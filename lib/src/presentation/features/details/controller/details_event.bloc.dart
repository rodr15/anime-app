part of 'details_bloc.bloc.dart';

@freezed
class DetailsEvent with _$DetailsEvent {
  const factory DetailsEvent.load(int id) = _Load;
  const factory DetailsEvent.addAnime(Anime anime) = _Add;
}
