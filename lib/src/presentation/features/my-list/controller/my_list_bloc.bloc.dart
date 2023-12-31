import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/models/anime/models.dart';
import '../../../../domain/usecases/user_list.usecase.dart';

part 'my_list_bloc.bloc.freezed.dart';
part 'my_list_event.bloc.dart';
part 'my_list_state.bloc.dart';

class MyListBloc extends Bloc<MyListEvent, MyListState> {
  MyListBloc(this._listUseCase) : super(const _Loading()) {
    _listUseCase.listenFavoriteAnimes().listen((animes) {
      add(_Update(animes));
    });

    on<MyListEvent>((event, emit) async {
      await event.when(
        started: () async {
          emit(const _Loading());
          final animes = await _listUseCase.getFavoriteAnimes();
          emit(_Success(animes));
        },
        update: (animes) async {
          emit(const _Loading());
          emit(_Success(animes));
        },
      );
    });
  }

  final UserListUseCase _listUseCase;
}
