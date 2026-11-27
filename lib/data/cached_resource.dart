import 'dart:async';
import 'dart:io' show FileSystemException;

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/api/api_exception.dart';
import '../core/api/portfolio_api.dart';
import '../core/cache/json_cache.dart';
import '../core/settings/settings.dart';
import 'providers.dart';

/// Data loaded from the API or the local cache.
class Cached<T> {
  const Cached({required this.data, required this.fetchedAt, this.refreshError});

  final T data;

  /// When [data] was fetched from the API.
  final DateTime fetchedAt;

  /// Set when the last refresh failed and [data] comes from the cache.
  final ApiException? refreshError;

  bool get isOffline => refreshError != null;

  Cached<T> withError(ApiException? error) =>
      Cached(data: data, fetchedAt: fetchedAt, refreshError: error);
}

/// Stale-while-revalidate loading shared by every API resource notifier.
///
/// - With a cache entry: returns it at once, then refetches in the background
///   when it is older than [maxAge].
/// - Without one: fetches from the API, and fails if that fails.
/// - A failed refresh keeps the cached data and sets [Cached.refreshError].
mixin CachedResource<T> {
  /// Matches the API's `Cache-Control: max-age=300`.
  static const maxAge = Duration(minutes: 5);

  // Provided by the generated notifier base class.
  Ref get ref;
  AsyncValue<Cached<T>> get state;
  set state(AsyncValue<Cached<T>> value);

  /// API path, e.g. `/profile`.
  String get path;

  /// Converts the decoded JSON body into the model.
  T decode(Object? json);

  DateTime now() => ref.read(clockProvider)();

  String _cacheKey(String lang) => '$lang$path';

  /// Call from `build()`.
  Future<Cached<T>> load() async {
    final lang = ref.watch(appLanguageProvider);
    final cache = ref.watch(jsonCacheProvider);
    final api = ref.watch(portfolioApiProvider);

    final entry = await cache.read(_cacheKey(lang));
    if (entry != null) {
      final cached = _tryDecode(entry);
      if (cached != null) {
        if (now().difference(entry.fetchedAt) > maxAge) {
          // Revalidate after build() has returned the cached value.
          unawaited(Future<void>.microtask(() => _revalidate(api, cache, lang)));
        }
        return cached;
      }
    }
    return _fetch(api, cache, lang);
  }

  /// Forces a network fetch (pull-to-refresh, retry button).
  Future<void> refresh() async {
    final lang = ref.read(appLanguageProvider);
    final api = ref.read(portfolioApiProvider);
    final cache = ref.read(jsonCacheProvider);
    if (!state.hasValue) state = AsyncLoading<Cached<T>>();
    await _revalidate(api, cache, lang);
  }

  Future<void> _revalidate(PortfolioApi api, JsonCache cache, String lang) async {
    try {
      final fresh = await _fetch(api, cache, lang);
      if (ref.mounted) state = AsyncData(fresh);
    } on ApiException catch (error, stack) {
      if (!ref.mounted) return;
      final current = state.value;
      state = current != null
          ? AsyncData(current.withError(error))
          : AsyncError<Cached<T>>(error, stack);
    }
  }

  Future<Cached<T>> _fetch(PortfolioApi api, JsonCache cache, String lang) async {
    final json = await api.get(path, lang: lang);
    final T data;
    try {
      data = decode(json);
    } on Object catch (error) {
      throw InvalidResponseException(error);
    }
    final fetchedAt = now();
    try {
      await cache.write(
        _cacheKey(lang),
        CacheEntry(json: json, fetchedAt: fetchedAt),
      );
    } on FileSystemException {
      // The data is valid even if it could not be cached (disk full…).
    }
    if (ref.mounted) await ref.read(lastSyncProvider.notifier).mark(fetchedAt);
    return Cached(data: data, fetchedAt: fetchedAt);
  }

  Cached<T>? _tryDecode(CacheEntry entry) {
    try {
      return Cached(data: decode(entry.json), fetchedAt: entry.fetchedAt);
    } on Object {
      // Stale schema or corrupt file: fall back to the network.
      return null;
    }
  }
}

/// Decodes a JSON array of objects with [fromJson].
List<T> decodeList<T>(Object? json, T Function(Map<String, Object?>) fromJson) {
  if (json is! List) throw FormatException('Expected a JSON array, got $json');
  return [for (final item in json) fromJson(item as Map<String, Object?>)];
}

/// Decodes a JSON object with [fromJson].
T decodeObject<T>(Object? json, T Function(Map<String, Object?>) fromJson) {
  if (json is! Map<String, Object?>) {
    throw FormatException('Expected a JSON object, got $json');
  }
  return fromJson(json);
}
