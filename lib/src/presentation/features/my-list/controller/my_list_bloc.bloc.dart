import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/models/anime.model.dart';

part 'my_list_bloc.bloc.freezed.dart';
part 'my_list_event.bloc.dart';
part 'my_list_state.bloc.dart';

class MyListBloc extends Bloc<MyListEvent, MyListState> {
  MyListBloc() : super(const _Loading()) {
    on<MyListEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
