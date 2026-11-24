// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(portfolioApi)
final portfolioApiProvider = PortfolioApiProvider._();

final class PortfolioApiProvider
    extends $FunctionalProvider<PortfolioApi, PortfolioApi, PortfolioApi>
    with $Provider<PortfolioApi> {
  PortfolioApiProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'portfolioApiProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$portfolioApiHash();

  @$internal
  @override
  $ProviderElement<PortfolioApi> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  PortfolioApi create(Ref ref) {
    return portfolioApi(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PortfolioApi value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PortfolioApi>(value),
    );
  }
}

String _$portfolioApiHash() => r'1e3bf341c02dd7c558600c152ecf52c301095411';

@ProviderFor(jsonCache)
final jsonCacheProvider = JsonCacheProvider._();

final class JsonCacheProvider
    extends $FunctionalProvider<JsonCache, JsonCache, JsonCache>
    with $Provider<JsonCache> {
  JsonCacheProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'jsonCacheProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$jsonCacheHash();

  @$internal
  @override
  $ProviderElement<JsonCache> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  JsonCache create(Ref ref) {
    return jsonCache(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(JsonCache value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<JsonCache>(value),
    );
  }
}

String _$jsonCacheHash() => r'9ff2a8ef164cdd712ae67875ee5deca6d812e2e7';
