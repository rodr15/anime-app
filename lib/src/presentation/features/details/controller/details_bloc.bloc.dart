import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/models/anime.model.dart';

part 'details_bloc.bloc.freezed.dart';
part 'details_event.bloc.dart';
part 'details_state.bloc.dart';

class DetailsBloc extends Bloc<DetailsEvent, DetailsState> {
  DetailsBloc() : super(const _Loading()) {
    on<DetailsEvent>((event, emit) {
      event.when(
        started: (anime) {
          if (_anime != null) {
            emit(const _Loaded());
            return;
          }
          if (anime == null) return;

          _anime = anime;
          emit(const _Loaded());
        },
      );
    });
  }

  Anime? _anime;
  Anime? get anime => _anime;
}
