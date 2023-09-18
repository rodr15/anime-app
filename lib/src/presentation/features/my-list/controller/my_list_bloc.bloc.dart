import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/models/anime.model.dart';
import '../../../../domain/usecases/anime.usecase.dart';

part 'my_list_bloc.bloc.freezed.dart';
part 'my_list_event.bloc.dart';
part 'my_list_state.bloc.dart';

class MyListBloc extends Bloc<MyListEvent, MyListState> {
  MyListBloc(this._animeUseCase) : super(const _Loading()) {
    on<MyListEvent>((event, emit) async {
      await event.when(
        started: () async {
          emit(const _Loading());
          final animes = await _animeUseCase.getSeasonAnime();
          emit(_Success(animes));
        },
      );
    });
  }

  final AnimeUseCase _animeUseCase;
}
