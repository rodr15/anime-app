import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../domain/models/anime/models.dart';
import '../../presentation/common/widgets/scaffold_nav_bar.widget.dart';
import '../../presentation/features/details/anime_details.view.dart';
import '../../presentation/features/my-list/my_list.view.dart';
import '../../presentation/features/popular_anime/popular_anime.view.dart';
import '../../presentation/features/settings/settings_view.dart';
import 'routes.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

GoRouter router = GoRouter(
  debugLogDiagnostics: true,
  navigatorKey: _rootNavigatorKey,
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
                  builder: (context, state) => const PopularAnimeView(),
                  routes: [
                    GoRoute(
                      parentNavigatorKey: _rootNavigatorKey,
                      path: Routes.details,
                      name: Routes.popularAnimeDetails,
                      builder: (context, state) =>
                          AnimeDetailsView(state.extra as Anime),
                    ),
                  ],
                ),
              ],
            ),
            StatefulShellBranch(
              routes: [
                GoRoute(
                    path: Routes.myList,
                    name: Routes.myList,
                    builder: (context, state) => const MyListView(),
                    routes: [
                      GoRoute(
                        parentNavigatorKey: _rootNavigatorKey,
                        path: Routes.details,
                        name: Routes.myListDetails,
                        builder: (context, state) =>
                            AnimeDetailsView(state.extra as Anime),
                      )
                    ]),
              ],
            ),
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: Routes.settings,
                  name: Routes.settings,
                  builder: (context, state) => const SettingsView(),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  ],
);
