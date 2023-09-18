import 'package:go_router/go_router.dart';

import '../../presentation/common/widgets/scaffold_nav_bar.widget.dart';
import '../../presentation/features/my-list/my_list.view.dart';
import '../../presentation/features/popular_anime/popular_anime.view.dart';
import 'routes.dart';

GoRouter router = GoRouter(
  initialLocation: '/${Routes.popularAnime}',
  routes: [
    GoRoute(
      path: Routes.root,
      builder: (context, state) => const PopularAnimeView(),
      routes: [
        StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) {
            return ScaffoldWithNavBar(navigationShell: navigationShell);
          },
          branches: [
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: Routes.popularAnime,
                  name: Routes.popularAnime,
                  builder: (context, state) {
                    return const PopularAnimeView();
                  },
                ),
              ],
            ),
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: Routes.myList,
                  name: Routes.myList,
                  builder: (context, state) {
                    return const MyListView();
                  },
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  ],
);
