part of 'my_list_bloc.bloc.dart';

@freezed
class MyListState with _$MyListState {
  const factory MyListState.loading() = _Loading;
  const factory MyListState.success(List<Anime> animes) = _Success;
  const factory MyListState.error(String error) = _Error;
}
