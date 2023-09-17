part of 'popular_anime_bloc.bloc.dart';

@freezed
class PopularAnimeState with _$PopularAnimeState {
  const factory PopularAnimeState.loading() = _Loading;
  const factory PopularAnimeState.success(List<Anime> animes) = _Success;
  const factory PopularAnimeState.error(String error) = _Error;
}
