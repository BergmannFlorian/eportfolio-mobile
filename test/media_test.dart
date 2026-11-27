import 'dart:io' show SocketException;

import 'package:file/file.dart';
import 'package:file/local.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:portfolio/core/media/media.dart';
import 'package:portfolio/data/models/experience.dart';
import 'package:portfolio/data/models/profile.dart';
import 'package:portfolio/data/models/project.dart';
import 'package:portfolio/ui/theme/app_theme.dart';
import 'package:portfolio/ui/widgets/media_image.dart';

import 'helpers.dart';

class MockCacheManager extends Mock implements BaseCacheManager {}

void main() {
  group('mediaUrl', () {
    test('prefixes site-relative paths with the site origin', () {
      expect(
        mediaUrl('/media/a1b2.webp'),
        'https://bergmann-florian.ch/media/a1b2.webp',
      );
      expect(mediaUrl('media/x.png'), 'https://bergmann-florian.ch/media/x.png');
    });

    test('keeps absolute URLs and rejects empty values', () {
      expect(mediaUrl('https://cdn.example/x.png'), 'https://cdn.example/x.png');
      expect(mediaUrl(null), isNull);
      expect(mediaUrl('  '), isNull);
    });

    test('detects SVG files', () {
      expect(isSvgUrl('https://bergmann-florian.ch/media/logo.SVG'), isTrue);
      expect(isSvgUrl('https://bergmann-florian.ch/media/logo.webp'), isFalse);
    });
  });

  test('initials', () {
    expect(initials('IOMEDIA SA'), 'IS');
    expect(initials('CPNV'), 'CP');
    expect(initials("McDonald's"), 'MC');
    expect(initials('Florian Bergmann'), 'FB');
    expect(initials(''), '');
  });

  group('models read the image fields', () {
    test('profile photo, experience logo, project image', () {
      final profile = ApiProfile.fromJson({
        ...loadFixture('profile')! as Map<String, Object?>,
        'photo': {'url': '/media/p.webp', 'alt': 'Portrait'},
      });
      expect(profile.photo?.url, '/media/p.webp');
      expect(profile.photo?.alt, 'Portrait');

      final experience = ApiExperience.fromJson({
        'id': 'x',
        'kind': 'job',
        'title': 'Dev',
        'start': '2021-12-01',
        'organizationLogo': '/media/logo.svg',
      });
      expect(experience.organizationLogo, '/media/logo.svg');

      final project = ApiProject.fromJson({
        'id': 'p',
        'name': 'P',
        'image': '/media/p.webp',
        'imageAlt': 'Screenshot',
      });
      expect(project.image, '/media/p.webp');
      expect(project.imageAlt, 'Screenshot');
    });

    test('live fixtures accept null images', () {
      final profile = ApiProfile.fromJson(
        loadFixture('profile')! as Map<String, Object?>,
      );
      expect(profile.photo, isNull);
    });
  });

  group('CachedMediaStore', () {
    late MockCacheManager manager;
    late File file;
    const url = 'https://bergmann-florian.ch/media/a.webp';

    setUp(() async {
      manager = MockCacheManager();
      file = const LocalFileSystem().file((await tinyImages()).png.path);
    });

    test('uses a cached file even past its HTTP expiry, without download', () async {
      when(() => manager.getFileFromCache(url)).thenAnswer(
        (_) async => FileInfo(
          file,
          FileSource.Cache,
          DateTime(2000), // long expired
          url,
        ),
      );

      final result = await CachedMediaStore(manager).file(url);

      expect(result?.path, file.path);
      verifyNever(() => manager.downloadFile(any()));
    });

    test('downloads a missing file', () async {
      when(() => manager.getFileFromCache(url)).thenAnswer((_) async => null);
      when(() => manager.downloadFile(url)).thenAnswer(
        (_) async => FileInfo(file, FileSource.Online, DateTime(2100), url),
      );

      expect((await CachedMediaStore(manager).file(url))?.path, file.path);
    });

    test('returns null when offline and not cached', () async {
      when(() => manager.getFileFromCache(url)).thenAnswer((_) async => null);
      when(
        () => manager.downloadFile(url),
      ).thenThrow(const SocketException('offline'));

      expect(await CachedMediaStore(manager).file(url), isNull);
    });
  });

  group('MediaImage', () {
    Future<void> pump(WidgetTester tester, Widget child, MediaStore store) async {
      await tester.pumpWidget(
        ProviderScope(
          overrides: [mediaStoreProvider.overrideWithValue(store)],
          child: Theme(
            data: AppTheme.light(),
            child: Directionality(
              textDirection: TextDirection.ltr,
              child: Center(
                child: SizedBox(width: 100, height: 100, child: child),
              ),
            ),
          ),
        ),
      );
      await tester.pump();
    }

    const fallbackKey = Key('fallback');
    const fallback = SizedBox(key: fallbackKey);

    testWidgets('shows the fallback without a path', (tester) async {
      final store = FakeMediaStore();
      await pump(tester, const MediaImage(path: null, fallback: fallback), store);
      expect(find.byKey(fallbackKey), findsOneWidget);
      expect(store.requested, isEmpty);
    });

    testWidgets('shows the fallback when the file is unavailable', (tester) async {
      await pump(
        tester,
        const MediaImage(path: '/media/missing.webp', fallback: fallback),
        FakeMediaStore(),
      );
      expect(find.byKey(fallbackKey), findsOneWidget);
    });

    testWidgets('renders a raster image with its description', (tester) async {
      final images = await tester.runAsync(tinyImages);
      final handle = tester.ensureSemantics();
      await pump(
        tester,
        const MediaImage(
          path: '/media/a.png',
          fallback: fallback,
          grayscale: true,
          semanticLabel: 'Screenshot of the app',
        ),
        FakeMediaStore({'$siteOrigin/media/a.png': images!.png}),
      );
      expect(find.byType(Image), findsOneWidget);
      expect(find.byType(ColorFiltered), findsOneWidget);
      expect(find.bySemanticsLabel('Screenshot of the app'), findsOneWidget);
      handle.dispose();
    });

    testWidgets('renders SVG logos', (tester) async {
      final images = await tester.runAsync(tinyImages);
      await pump(
        tester,
        const OrgLogo(path: '/media/logo.svg', name: 'IOMEDIA SA'),
        FakeMediaStore({'$siteOrigin/media/logo.svg': images!.svg}),
      );
      expect(find.byType(SvgPicture), findsOneWidget);
    });

    testWidgets('logo falls back to initials', (tester) async {
      await pump(
        tester,
        const OrgLogo(path: null, name: 'IOMEDIA SA'),
        FakeMediaStore(),
      );
      expect(find.text('IS'), findsOneWidget);
    });
  });
}
