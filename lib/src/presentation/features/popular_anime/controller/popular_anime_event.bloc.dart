part of 'popular_anime_bloc.bloc.dart';

@freezed
class PopularAnimeEvent with _$PopularAnimeEvent {
  const factory PopularAnimeEvent.started() = _Started;
}
