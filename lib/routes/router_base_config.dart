
import 'package:go_router/go_router.dart';
import 'package:harmony_flow/models/router_args.dart';
import 'package:harmony_flow/routes/router_path.dart';
import 'package:harmony_flow/screens/PlaylistDetailScreen.dart';
import 'package:harmony_flow/widgets/layout_scaffold_navigation.dart';
import 'package:harmony_flow/widgets/layout_tab_controller.dart';

class RouterBaseConfig {
  static GoRouter router =
  GoRouter(initialLocation: RouterPath.home.path, routes: [

    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) =>
          LayoutScaffoldNavigation(navigationShell: navigationShell),

      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
                name: RouterPath.home.name,
                path: RouterPath.home.path,
                builder: (context, state) => RouterPath.home.widget),

          ],
        ),

        StatefulShellBranch(routes: [
          GoRoute(
              name: RouterPath.library.name,
              path: RouterPath.library.path,
              builder: (context, state) => RouterPath.library.widget),
          GoRoute(
              name: RouterPath.playlistDetail.name,
              path: RouterPath.playlistDetail.path,
              builder: (context, state) {
                final args = state.extra as PlaylistScreenArgument;
                return PlaylistDetailScreen(
                    id: args.id, title: args.title ?? "Unknown");
              }),
        ]),
        StatefulShellBranch(routes: [
          GoRoute(
              name: RouterPath.settings.name,
              path: RouterPath.settings.path,
              builder: (context, state) => RouterPath.settings.widget),
        ])
      ],
    ),
  ]);

}

