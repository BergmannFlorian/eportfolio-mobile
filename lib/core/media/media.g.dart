// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(mediaStore)
final mediaStoreProvider = MediaStoreProvider._();

final class MediaStoreProvider
    extends $FunctionalProvider<MediaStore, MediaStore, MediaStore>
    with $Provider<MediaStore> {
  MediaStoreProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'mediaStoreProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$mediaStoreHash();

  @$internal
  @override
  $ProviderElement<MediaStore> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  MediaStore create(Ref ref) {
    return mediaStore(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MediaStore value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MediaStore>(value),
    );
  }
}

String _$mediaStoreHash() => r'61668a9f5d5a9bc756c198562a2e59a5498973ba';

/// Local file for a media URL (see [MediaStore.file]).

@ProviderFor(mediaFile)
final mediaFileProvider = MediaFileFamily._();

/// Local file for a media URL (see [MediaStore.file]).

final class MediaFileProvider
    extends $FunctionalProvider<AsyncValue<File?>, File?, FutureOr<File?>>
    with $FutureModifier<File?>, $FutureProvider<File?> {
  /// Local file for a media URL (see [MediaStore.file]).
  MediaFileProvider._({
    required MediaFileFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'mediaFileProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$mediaFileHash();

  @override
  String toString() {
    return r'mediaFileProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<File?> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<File?> create(Ref ref) {
    final argument = this.argument as String;
    return mediaFile(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is MediaFileProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$mediaFileHash() => r'76e966274f2815a310e3d9da416f5b52d167552f';

/// Local file for a media URL (see [MediaStore.file]).

final class MediaFileFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<File?>, String> {
  MediaFileFamily._()
    : super(
        retry: null,
        name: r'mediaFileProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Local file for a media URL (see [MediaStore.file]).

  MediaFileProvider call(String url) =>
      MediaFileProvider._(argument: url, from: this);

  @override
  String toString() => r'mediaFileProvider';
}
