part of 'details_bloc.bloc.dart';

@freezed
class DetailsEvent with _$DetailsEvent {
  const factory DetailsEvent.started(Anime? anime) = _Started;
}
