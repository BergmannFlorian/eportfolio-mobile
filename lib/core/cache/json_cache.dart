import 'dart:convert';
import 'dart:io';

/// A cached API response: the raw decoded JSON and when it was fetched.
class CacheEntry {
  const CacheEntry({required this.json, required this.fetchedAt});

  final Object? json;
  final DateTime fetchedAt;
}

/// Stores raw API responses as JSON files, one per key.
///
/// Keys look like `fr/profile`; they are turned into safe file names.
class JsonCache {
  JsonCache(this._directory);

  /// Resolves the folder lazily, so the cache can be built synchronously.
  final Future<Directory> Function() _directory;

  Future<File> _file(String key) async {
    final dir = await _directory();
    final name = key.replaceAll(RegExp('[^A-Za-z0-9_-]'), '_');
    return File('${dir.path}${Platform.pathSeparator}$name.json');
  }

  /// Returns the entry for [key], or `null` if missing or unreadable.
  Future<CacheEntry?> read(String key) async {
    try {
      final file = await _file(key);
      if (!file.existsSync()) return null;
      final decoded = jsonDecode(await file.readAsString());
      if (decoded is! Map<String, Object?>) return null;
      final fetchedAt = DateTime.tryParse(decoded['fetchedAt'] as String? ?? '');
      if (fetchedAt == null) return null;
      return CacheEntry(json: decoded['body'], fetchedAt: fetchedAt.toLocal());
    } on Object {
      // A corrupt cache file is treated as a miss.
      return null;
    }
  }

  /// Last pending write per key. Two refreshes of the same resource can
  /// overlap; writes to one key run one after the other, last one wins.
  final _pending = <String, Future<void>>{};

  Future<void> write(String key, CacheEntry entry) {
    final previous = _pending[key] ?? Future<void>.value();
    final next = previous
        .catchError((Object _) {}) // a failed write must not block the next
        .then((_) => _write(key, entry));
    _pending[key] = next;
    return next.whenComplete(() {
      if (identical(_pending[key], next)) _pending.remove(key);
    });
  }

  Future<void> _write(String key, CacheEntry entry) async {
    final file = await _file(key);
    await file.parent.create(recursive: true);
    final payload = jsonEncode({
      'fetchedAt': entry.fetchedAt.toUtc().toIso8601String(),
      'body': entry.json,
    });
    // Write then rename, so a crash never leaves a half-written file.
    final tmp = File('${file.path}.tmp');
    await tmp.writeAsString(payload, flush: true);
    await tmp.rename(file.path);
  }
}
