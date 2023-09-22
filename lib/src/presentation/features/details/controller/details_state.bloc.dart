part of 'details_bloc.bloc.dart';

@freezed
class DetailsState with _$DetailsState {
  const factory DetailsState.loading() = _Loading;
  const factory DetailsState.loaded() = _Loaded;
}
