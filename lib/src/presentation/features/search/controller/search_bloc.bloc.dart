import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/models/anime.model.dart';
import '../../../../domain/repositories/anime.repository.dart';

part 'search_bloc.bloc.freezed.dart';
part 'search_event.bloc.dart';
part 'search_state.bloc.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc(this._animeRepository) : super(const _Loading()) {
    on<SearchEvent>((event, emit) async {
      await event.when(
        started: () async {
          emit(const _Loading());
          try {
            final animes = await _animeRepository.getAnimesByWord('');
            emit(_Success(animes));
          } catch (e) {
            emit(_Error(e.toString()));
          }
        },
        search: (String search) async {
          emit(const _Loading());
          try {
            final animes = await _animeRepository.getAnimesByWord(search);
            emit(_Success(animes));
          } catch (e) {
            emit(_Error(e.toString()));
          }
        },
      );
    });
  }

  final AnimeRepository _animeRepository;
}
