part of 'search_bloc.bloc.dart';

@freezed
class SearchEvent with _$SearchEvent {
  const factory SearchEvent.search(String search) = _Search;
}
