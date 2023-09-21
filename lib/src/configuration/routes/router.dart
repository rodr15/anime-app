import 'package:go_router/go_router.dart';

import '../../presentation/common/widgets/scaffold_nav_bar.widget.dart';
import '../../presentation/features/details/anime_details.view.dart';
import '../../presentation/features/my-list/my_list.view.dart';
import '../../presentation/features/popular_anime/popular_anime.view.dart';
import '../../presentation/features/settings/settings_view.dart';
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
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: Routes.settings,
                  name: Routes.settings,
                  builder: (context, state) {
                    return const SettingsView();
                  },
                ),
              ],
            ),
          ],
        ),
        GoRoute(
          path: Routes.details,
          builder: (context, state) => const AnimeDetailsView(),
        )
      ],
    ),
  ],
);
