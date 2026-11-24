import 'dart:convert';
import 'dart:io';

import 'package:flutter_riverpod/misc.dart' show Override;
import 'package:mocktail/mocktail.dart';
import 'package:portfolio/core/api/portfolio_api.dart';
import 'package:portfolio/core/cache/json_cache.dart';
import 'package:portfolio/core/settings/settings.dart';
import 'package:portfolio/data/providers.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Real API responses (French), saved in `test/fixtures`.
Object? loadFixture(String name) =>
    jsonDecode(File('test/fixtures/$name.json').readAsStringSync());

class MockApi extends Mock implements PortfolioApi {}

/// Makes [api] answer every endpoint with the matching fixture.
void stubFixtures(MockApi api) {
  for (final name in [
    'profile',
    'experiences',
    'projects',
    'skills',
    'certificates',
  ]) {
    when(
      () => api.get('/$name', lang: any(named: 'lang')),
    ).thenAnswer((_) async => loadFixture(name));
  }
}

/// A [JsonCache] in a fresh temporary folder.
Future<JsonCache> tempCache() async {
  final dir = await Directory.systemTemp.createTemp('portfolio_cache_test');
  return JsonCache(() async => dir);
}

/// Provider overrides for a test app: fake API, temp cache, French locale.
Future<List<Override>> testOverrides({
  required PortfolioApi api,
  JsonCache? cache,
  DateTime Function()? clock,
}) async {
  SharedPreferences.setMockInitialValues({'settings.language': 'fr'});
  final prefs = await SharedPreferences.getInstance();
  return [
    sharedPreferencesProvider.overrideWithValue(prefs),
    portfolioApiProvider.overrideWithValue(api),
    jsonCacheProvider.overrideWithValue(cache ?? await tempCache()),
    if (clock != null) clockProvider.overrideWithValue(clock),
  ];
}
