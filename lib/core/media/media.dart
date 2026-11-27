import 'dart:io';

import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'media.g.dart';

/// Origin that media paths (`/media/<file>`) are relative to.
const siteOrigin = 'https://bergmann-florian.ch';

/// Turns an API media path into an absolute URL. Returns `null` for a missing
/// or empty path, and leaves absolute URLs untouched.
String? mediaUrl(String? path) {
  if (path == null || path.trim().isEmpty) return null;
  final value = path.trim();
  if (value.startsWith('http://') || value.startsWith('https://')) return value;
  return value.startsWith('/') ? '$siteOrigin$value' : '$siteOrigin/$value';
}

/// Whether [url] points to an SVG file (logos can be SVG).
bool isSvgUrl(String url) =>
    Uri.tryParse(url)?.path.toLowerCase().endsWith('.svg') ?? false;

/// Resolves media URLs to local files.
abstract interface class MediaStore {
  /// The cached file for [url], downloading it on first use. `null` when it
  /// is not cached and cannot be downloaded (offline, 404…).
  Future<File?> file(String url);
}

/// Disk cache for media files.
///
/// A file never changes under a given name (a replaced image gets a new URL),
/// so a cached file is used as long as it exists: no expiry, no revalidation.
/// `getSingleFile` is avoided on purpose, since it would refetch once the HTTP
/// `max-age` has passed.
class CachedMediaStore implements MediaStore {
  CachedMediaStore([BaseCacheManager? manager])
    : _manager = manager ?? _defaultManager;

  static final _defaultManager = CacheManager(
    Config(
      'portfolio_media',
      // Only evicts files not used for this long.
      stalePeriod: const Duration(days: 365),
      maxNrOfCacheObjects: 500,
    ),
  );

  final BaseCacheManager _manager;

  @override
  Future<File?> file(String url) async {
    try {
      final cached = await _manager.getFileFromCache(url);
      if (cached != null && cached.file.existsSync()) return cached.file;
      return (await _manager.downloadFile(url)).file;
    } on Object {
      return null;
    }
  }
}

@Riverpod(keepAlive: true)
MediaStore mediaStore(Ref ref) => CachedMediaStore();

/// Local file for a media URL (see [MediaStore.file]).
@riverpod
Future<File?> mediaFile(Ref ref, String url) =>
    ref.watch(mediaStoreProvider).file(url);
