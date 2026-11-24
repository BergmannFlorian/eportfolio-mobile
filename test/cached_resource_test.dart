import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:portfolio/core/api/api_exception.dart';
import 'package:portfolio/core/cache/json_cache.dart';
import 'package:portfolio/core/settings/settings.dart';
import 'package:portfolio/data/resources.dart';

import 'helpers.dart';

void main() {
  late MockApi api;
  late JsonCache cache;
  var now = DateTime(2026, 11, 24, 12);

  Future<ProviderContainer> container() async {
    final c = ProviderContainer(
      overrides: await testOverrides(api: api, cache: cache, clock: () => now),
      retry: (_, _) => null,
    );
    addTearDown(c.dispose);
    return c;
  }

  /// Lets background revalidation (including cache file I/O) run.
  Future<void> settle() =>
      Future<void>.delayed(const Duration(milliseconds: 200));

  setUp(() async {
    api = MockApi();
    cache = await tempCache();
    now = DateTime(2026, 11, 24, 12);
  });

  test('without cache: fetches with ?lang and stores the response', () async {
    stubFixtures(api);
    final c = await container();

    final result = await c.read(skillsProvider.future);

    expect(result.data.stack, isNotEmpty);
    expect(result.isOffline, isFalse);
    verify(() => api.get('/skills', lang: 'fr')).called(1);
    expect(await cache.read('fr/skills'), isNotNull);
    expect(c.read(lastSyncProvider), now);
  });

  test('without cache and offline: exposes the error', () async {
    when(
      () => api.get(any(), lang: any(named: 'lang')),
    ).thenThrow(const NetworkException('offline'));
    final c = await container();
    final sub = c.listen(skillsProvider, (_, _) {});

    await expectLater(
      c.read(skillsProvider.future),
      throwsA(isA<NetworkException>()),
    );
    expect(sub.read().hasError, isTrue);
  });

  test('fresh cache: served without a network call', () async {
    await cache.write(
      'fr/skills',
      CacheEntry(
        json: loadFixture('skills'),
        fetchedAt: now.subtract(const Duration(minutes: 2)),
      ),
    );
    final c = await container();

    final result = await c.read(skillsProvider.future);
    await settle();

    expect(result.data.stack, isNotEmpty);
    verifyNever(() => api.get(any(), lang: any(named: 'lang')));
  });

  test('stale cache: served at once, then revalidated', () async {
    final old = now.subtract(const Duration(minutes: 10));
    await cache.write(
      'fr/skills',
      CacheEntry(
        json: <String, Object?>{'stack': ['Old'], 'categories': <Object?>[]},
        fetchedAt: old,
      ),
    );
    stubFixtures(api);
    final c = await container();
    final sub = c.listen(skillsProvider, (_, _) {});

    final first = await c.read(skillsProvider.future);
    expect(first.data.stack, ['Old']);

    await settle();
    final refreshed = sub.read().requireValue;
    expect(refreshed.data.stack, isNot(['Old']));
    expect(refreshed.fetchedAt, now);
  });

  test('stale cache and offline: keeps data, flags it offline', () async {
    final old = now.subtract(const Duration(hours: 3));
    await cache.write(
      'fr/skills',
      CacheEntry(json: loadFixture('skills'), fetchedAt: old),
    );
    when(
      () => api.get(any(), lang: any(named: 'lang')),
    ).thenThrow(const NetworkException('offline'));
    final c = await container();
    final sub = c.listen(skillsProvider, (_, _) {});

    await c.read(skillsProvider.future);
    await settle();

    final value = sub.read().requireValue;
    expect(value.isOffline, isTrue);
    expect(value.fetchedAt, old);
    expect(value.data.stack, isNotEmpty);
  });

  test('refresh() recovers from an error', () async {
    when(
      () => api.get(any(), lang: any(named: 'lang')),
    ).thenThrow(const HttpStatusException(500, 'db down'));
    final c = await container();
    final sub = c.listen(certificatesProvider, (_, _) {});
    await expectLater(
      c.read(certificatesProvider.future),
      throwsA(isA<HttpStatusException>()),
    );

    reset(api);
    stubFixtures(api);
    await c.read(certificatesProvider.notifier).refresh();

    expect(sub.read().requireValue.data, isNotEmpty);
  });

  test('switching language refetches in the new language', () async {
    stubFixtures(api);
    final c = await container();
    final sub = c.listen(profileProvider, (_, _) {});
    await c.read(profileProvider.future);

    await c.read(settingsProvider.notifier).setLanguage(LanguagePreference.en);
    await c.read(profileProvider.future);
    await settle();

    expect(sub.read().hasValue, isTrue);
    verify(() => api.get('/profile', lang: 'fr')).called(1);
    verify(() => api.get('/profile', lang: 'en')).called(1);
  });
}
