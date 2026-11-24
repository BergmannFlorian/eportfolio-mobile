# Florian Bergmann — portfolio app

Flutter app (Android and iOS) that shows the content of
[bergmann-florian.ch](https://bergmann-florian.ch). It only reads the site's public
JSON API (`https://bergmann-florian.ch/api/v1`) and caches responses on the device for
offline use.

## Requirements

- Flutter 3.50+ (Dart 3.14+).
- Android: Android SDK with command-line tools, and licenses accepted
  (`flutter doctor --android-licenses`).
- iOS: builds need macOS with Xcode, or a cloud CI with macOS runners.

## Commands

```sh
flutter pub get
dart run build_runner build   # freezed, json_serializable, riverpod_generator
flutter gen-l10n              # lib/l10n/*.arb -> lib/l10n/generated
flutter analyze
flutter test
flutter run                   # on a connected device or emulator
```

Run `build_runner` again after changing a model, a provider or the router.
Use `dart run build_runner watch` while developing.

## Structure

```
lib/
  main.dart, app.dart     entry point, MaterialApp, theme and locale
  core/
    api/                  Dio client and typed API errors
    cache/                JSON file cache (one file per endpoint and language)
    settings/             language, theme and last-sync preferences
  data/
    models/               freezed models mirroring the API types
    cached_resource.dart  stale-while-revalidate logic shared by all resources
    resources.dart        one Riverpod notifier per endpoint
    selectors.dart        pure sorting and grouping helpers
  l10n/                   UI strings (fr = template, en)
  ui/
    theme/                design tokens, fonts and text styles
    widgets/              shared components (header, tab bar, grid, chips…)
    screens/              home, journey, projects, project, profile, settings
    router.dart           go_router routes with a 4-tab shell
test/                     unit and widget tests, real API fixtures
```

## Data flow

1. Each screen watches the resource providers it needs. A resource is keyed by
   endpoint and language.
2. A cached response is shown at once. When it is older than 5 minutes (the API's
   `max-age`), it is refetched in the background.
3. Without a cache, the app fetches from the network. If that fails, the screen shows
   an error with a retry button.
4. When a refresh fails while cached data is shown, an offline banner gives the cache
   date. Pull-to-refresh forces a refetch.

## Fonts

Questrial, Inter and JetBrains Mono are bundled in `assets/fonts` under the SIL Open
Font License. The license texts ship with the app and appear in Settings › Licenses.
