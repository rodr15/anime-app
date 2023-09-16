part of 'search_bloc.bloc.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState.loading() = _Loading;
  const factory SearchState.success(List<Anime> animes) = _Success;
  const factory SearchState.error(String error) = _Error;
}
