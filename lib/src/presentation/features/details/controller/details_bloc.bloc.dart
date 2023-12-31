import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/models/anime/models.dart';
import '../../../../domain/usecases/anime.usecase.dart';
import '../../../../domain/usecases/user_list.usecase.dart';

part 'details_bloc.bloc.freezed.dart';
part 'details_event.bloc.dart';
part 'details_state.bloc.dart';

class DetailsBloc extends Bloc<DetailsEvent, DetailsState> {
  DetailsBloc(this._listUseCase, this._animeUseCase) : super(const _Loading()) {
    on<DetailsEvent>((event, emit) async {
      await event.when(
        load: (int animeId) async {
          emit(const _Loading());

          _anime = await _animeUseCase.getAnimeById(animeId);
          _exists = await _listUseCase.animeExists(animeId);

          emit(const _Loaded());
        },
        addAnime: (Anime anime) async {
          _listUseCase.toggleAnimeInFavoriteList(anime);
        },
      );
    });
  }

  final UserListUseCase _listUseCase;
  final AnimeUseCase _animeUseCase;
  late Anime _anime;
  bool _exists = false;

  Anime get anime => _anime;
  bool get animeExists => _exists;
}
