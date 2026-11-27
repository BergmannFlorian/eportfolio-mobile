import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio/core/cache/json_cache.dart';

void main() {
  late Directory dir;
  late JsonCache cache;

  setUp(() async {
    dir = await Directory.systemTemp.createTemp('json_cache_test');
    cache = JsonCache(() async => dir);
  });

  tearDown(() => dir.delete(recursive: true));

  test('returns null for a missing key', () async {
    expect(await cache.read('fr/profile'), isNull);
  });

  test('round-trips JSON and timestamp', () async {
    final at = DateTime.utc(2026, 11, 24, 10, 3);
    await cache.write(
      'fr/profile',
      CacheEntry(json: {'name': 'Florian', 'tags': [1, 2]}, fetchedAt: at),
    );
    final entry = await cache.read('fr/profile');
    expect(entry!.json, {'name': 'Florian', 'tags': [1, 2]});
    expect(entry.fetchedAt.isAtSameMomentAs(at), isTrue);
  });

  test('keys are isolated per language', () async {
    final at = DateTime.utc(2026);
    await cache.write('fr/skills', CacheEntry(json: 'fr', fetchedAt: at));
    await cache.write('en/skills', CacheEntry(json: 'en', fetchedAt: at));
    expect((await cache.read('fr/skills'))!.json, 'fr');
    expect((await cache.read('en/skills'))!.json, 'en');
  });

  test('concurrent writes of the same key do not collide', () async {
    final at = DateTime.utc(2026);
    await Future.wait([
      for (var i = 0; i < 10; i++)
        cache.write('fr/projects', CacheEntry(json: i, fetchedAt: at)),
    ]);
    // Writes are serialized: the last one wins.
    expect((await cache.read('fr/projects'))!.json, 9);
  });

  test('a corrupt file is treated as a miss', () async {
    File('${dir.path}/fr_profile.json').writeAsStringSync('{not json');
    expect(await cache.read('fr/profile'), isNull);
  });
}
