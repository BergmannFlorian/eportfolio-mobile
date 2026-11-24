// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'router.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Routes:
/// - `/home`
/// - `/journey`, `/journey/:id`
/// - `/projects?group=personal|client`, `/projects/:id`
/// - `/profile`
/// - `/settings` (full screen, above the tab bar)

@ProviderFor(router)
final routerProvider = RouterProvider._();

/// Routes:
/// - `/home`
/// - `/journey`, `/journey/:id`
/// - `/projects?group=personal|client`, `/projects/:id`
/// - `/profile`
/// - `/settings` (full screen, above the tab bar)

final class RouterProvider
    extends $FunctionalProvider<GoRouter, GoRouter, GoRouter>
    with $Provider<GoRouter> {
  /// Routes:
  /// - `/home`
  /// - `/journey`, `/journey/:id`
  /// - `/projects?group=personal|client`, `/projects/:id`
  /// - `/profile`
  /// - `/settings` (full screen, above the tab bar)
  RouterProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'routerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$routerHash();

  @$internal
  @override
  $ProviderElement<GoRouter> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  GoRouter create(Ref ref) {
    return router(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GoRouter value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GoRouter>(value),
    );
  }
}

String _$routerHash() => r'42c72c8f952ebfd5792bccad2dc946f10c91f523';
