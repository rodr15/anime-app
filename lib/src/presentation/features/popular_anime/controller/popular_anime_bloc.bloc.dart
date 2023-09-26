import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/models/anime/models.dart';
import '../../../../domain/usecases/anime.usecase.dart';

part 'popular_anime_bloc.bloc.freezed.dart';
part 'popular_anime_event.bloc.dart';
part 'popular_anime_state.bloc.dart';

class PopularAnimeBloc extends Bloc<PopularAnimeEvent, PopularAnimeState> {
  PopularAnimeBloc(this._animeUseCase) : super(const _Loading()) {
    on<PopularAnimeEvent>((event, emit) async {
      await event.when(
        started: () async {
          emit(const _Loading());
          try {
            final animes = await _animeUseCase.getSeasonAnime();
            emit(_Success(animes));
          } catch (e) {
            emit(_Error(e.toString()));
          }
        },
      );
    });
  }

  final AnimeUseCase _animeUseCase;
}
