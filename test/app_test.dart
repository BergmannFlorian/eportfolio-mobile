import 'package:flutter/widgets.dart' show Scrollable;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:portfolio/app.dart';
import 'package:portfolio/core/api/api_exception.dart';

import 'helpers.dart';

void main() {
  late MockApi api;

  setUp(() => api = MockApi());

  Future<void> pumpApp(WidgetTester tester) async {
    final overrides = await tester.runAsync(() => testOverrides(api: api));
    await tester.pumpWidget(
      ProviderScope(
        overrides: overrides!,
        retry: (_, _) => null,
        child: const PortfolioApp(),
      ),
    );
  }

  /// File I/O in the cache needs real async; then let the UI settle.
  Future<void> load(WidgetTester tester) async {
    for (var i = 0; i < 10; i++) {
      await tester.runAsync(
        () => Future<void>.delayed(const Duration(milliseconds: 100)),
      );
      await tester.pump();
    }
  }

  testWidgets('home shows profile and both featured blocks', (tester) async {
    stubFixtures(api);
    await pumpApp(tester);
    await load(tester);

    expect(find.text('Me contacter'), findsOneWidget);
    expect(find.text('Accueil'), findsOneWidget);

    final list = find.byType(Scrollable).first;
    for (final label in [
      'Voir tous les projets perso →',
      'Voir tous les projets en entreprise →',
      'florian.bergmann@ik.me',
    ]) {
      await tester.scrollUntilVisible(find.text(label), 300, scrollable: list);
      expect(find.text(label), findsWidgets);
    }
  });

  testWidgets('navigates to the projects tab and its client page', (tester) async {
    stubFixtures(api);
    await pumpApp(tester);
    await load(tester);

    await tester.tap(find.text('Projets'));
    await load(tester);
    expect(find.text('PERSONNELS  3'), findsOneWidget);

    await tester.tap(find.textContaining('ENTREPRISE'));
    await tester.pumpAndSettle();
    await load(tester);
    expect(find.text('IOMEDIA SA'), findsOneWidget);
  });

  testWidgets('offline without cache shows the error and retries', (tester) async {
    when(
      () => api.get(any(), lang: any(named: 'lang')),
    ).thenThrow(const NetworkException('offline'));
    await pumpApp(tester);
    await load(tester);

    expect(find.text('Réessayer'), findsOneWidget);

    reset(api);
    stubFixtures(api);
    await tester.tap(find.text('Réessayer'));
    await load(tester);
    expect(find.text('Me contacter'), findsOneWidget);
  });
}
