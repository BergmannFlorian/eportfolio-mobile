import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'screens/experience_screen.dart';
import 'screens/home_screen.dart';
import 'screens/journey_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/project_screen.dart';
import 'screens/projects_screen.dart';
import 'screens/settings_screen.dart';
import 'widgets/chrome.dart';

part 'router.g.dart';

final _rootKey = GlobalKey<NavigatorState>(debugLabel: 'root');

/// Routes:
/// - `/home`
/// - `/journey`, `/journey/:id`
/// - `/projects?group=personal|client`, `/projects/:id`
/// - `/profile`
/// - `/settings` (full screen, above the tab bar)
@Riverpod(keepAlive: true)
GoRouter router(Ref ref) {
  final router = GoRouter(
    navigatorKey: _rootKey,
    initialLocation: '/home',
    routes: [
      GoRoute(path: '/', redirect: (_, _) => '/home'),
      StatefulShellRoute.indexedStack(
        builder: (context, state, shell) => _TabShell(shell: shell),
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/home',
                builder: (_, _) => const HomeScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/journey',
                builder: (_, _) => const JourneyScreen(),
                routes: [
                  GoRoute(
                    path: ':id',
                    builder: (_, state) =>
                        ExperienceScreen(id: state.pathParameters['id']!),
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/projects',
                builder: (_, state) => ProjectsScreen(
                  group: state.uri.queryParameters['group'] == 'client'
                      ? ProjectGroupTab.client
                      : ProjectGroupTab.personal,
                ),
                routes: [
                  GoRoute(
                    path: ':id',
                    builder: (_, state) =>
                        ProjectScreen(id: state.pathParameters['id']!),
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/profile',
                builder: (_, _) => const ProfileScreen(),
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        path: '/settings',
        parentNavigatorKey: _rootKey,
        builder: (_, _) => const SettingsScreen(),
      ),
    ],
  );
  ref.onDispose(router.dispose);
  return router;
}

class _TabShell extends StatelessWidget {
  const _TabShell({required this.shell});

  final StatefulNavigationShell shell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: shell,
      bottomNavigationBar: AppTabBar(
        currentIndex: shell.currentIndex,
        // Tapping the active tab again pops back to its root screen.
        onSelect: (index) => shell.goBranch(
          index,
          initialLocation: index == shell.currentIndex,
        ),
      ),
    );
  }
}
