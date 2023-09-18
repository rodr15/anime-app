part of 'my_list_bloc.bloc.dart';

@freezed
class MyListEvent with _$MyListEvent {
  const factory MyListEvent.started() = _Started;
  const factory MyListEvent.update(List<Anime> animes) = _Update;
}
