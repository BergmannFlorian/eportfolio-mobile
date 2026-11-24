// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Overridden in `main()` with the instance loaded before `runApp`.

@ProviderFor(sharedPreferences)
final sharedPreferencesProvider = SharedPreferencesProvider._();

/// Overridden in `main()` with the instance loaded before `runApp`.

final class SharedPreferencesProvider
    extends
        $FunctionalProvider<
          SharedPreferences,
          SharedPreferences,
          SharedPreferences
        >
    with $Provider<SharedPreferences> {
  /// Overridden in `main()` with the instance loaded before `runApp`.
  SharedPreferencesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'sharedPreferencesProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$sharedPreferencesHash();

  @$internal
  @override
  $ProviderElement<SharedPreferences> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  SharedPreferences create(Ref ref) {
    return sharedPreferences(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SharedPreferences value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SharedPreferences>(value),
    );
  }
}

String _$sharedPreferencesHash() => r'70ef90bd70df9f89260fca9b542d9f8d25d8e3cb';

/// User preferences, persisted in shared preferences.

@ProviderFor(Settings)
final settingsProvider = SettingsProvider._();

/// User preferences, persisted in shared preferences.
final class SettingsProvider extends $NotifierProvider<Settings, AppSettings> {
  /// User preferences, persisted in shared preferences.
  SettingsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'settingsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$settingsHash();

  @$internal
  @override
  Settings create() => Settings();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AppSettings value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AppSettings>(value),
    );
  }
}

String _$settingsHash() => r'e33ba17df903c64eae8e34e159695ddbb211c561';

/// User preferences, persisted in shared preferences.

abstract class _$Settings extends $Notifier<AppSettings> {
  AppSettings build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AppSettings, AppSettings>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AppSettings, AppSettings>,
              AppSettings,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

/// The device locale. The app widget updates it when the system locale changes.

@ProviderFor(SystemLocale)
final systemLocaleProvider = SystemLocaleProvider._();

/// The device locale. The app widget updates it when the system locale changes.
final class SystemLocaleProvider
    extends $NotifierProvider<SystemLocale, Locale> {
  /// The device locale. The app widget updates it when the system locale changes.
  SystemLocaleProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'systemLocaleProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$systemLocaleHash();

  @$internal
  @override
  SystemLocale create() => SystemLocale();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Locale value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Locale>(value),
    );
  }
}

String _$systemLocaleHash() => r'63e268c09f4d8b90b1a40b65f62a5dbec1ebfec0';

/// The device locale. The app widget updates it when the system locale changes.

abstract class _$SystemLocale extends $Notifier<Locale> {
  Locale build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<Locale, Locale>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Locale, Locale>,
              Locale,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

/// The language used for the UI and passed to the API as `?lang=`.

@ProviderFor(appLanguage)
final appLanguageProvider = AppLanguageProvider._();

/// The language used for the UI and passed to the API as `?lang=`.

final class AppLanguageProvider
    extends $FunctionalProvider<String, String, String>
    with $Provider<String> {
  /// The language used for the UI and passed to the API as `?lang=`.
  AppLanguageProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appLanguageProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appLanguageHash();

  @$internal
  @override
  $ProviderElement<String> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  String create(Ref ref) {
    return appLanguage(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$appLanguageHash() => r'6639c729e96dca9831c3b9fa8f97abc8680b4c43';

/// When the app last fetched data successfully from the API.

@ProviderFor(LastSync)
final lastSyncProvider = LastSyncProvider._();

/// When the app last fetched data successfully from the API.
final class LastSyncProvider extends $NotifierProvider<LastSync, DateTime?> {
  /// When the app last fetched data successfully from the API.
  LastSyncProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'lastSyncProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$lastSyncHash();

  @$internal
  @override
  LastSync create() => LastSync();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DateTime? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DateTime?>(value),
    );
  }
}

String _$lastSyncHash() => r'a0e7276c53d0260d640b0e0b53fcc7f93a0caa1f';

/// When the app last fetched data successfully from the API.

abstract class _$LastSync extends $Notifier<DateTime?> {
  DateTime? build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<DateTime?, DateTime?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<DateTime?, DateTime?>,
              DateTime?,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
