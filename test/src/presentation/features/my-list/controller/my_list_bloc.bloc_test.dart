import 'package:anime/src/domain/models/anime/models.dart';
import 'package:anime/src/domain/usecases/user_list.usecase.dart';
import 'package:anime/src/presentation/features/my-list/controller/my_list_bloc.bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'my_list_bloc.bloc_test.mocks.dart';

@GenerateNiceMocks([MockSpec<UserListUseCase>()])
void main() {
  late MyListBloc myListBloc;
  late UserListUseCase mockUserListUseCase;

  const genreDrama = AnimeGenres(id: 1, name: 'Drama');
  const genreAction = AnimeGenres(id: 2, name: 'Action');

  final streamingCrunchy = AnimeStreaming(
      name: 'Crunchyroll', url: 'https://www.crunchyroll.com/anime1');
  final streamingNetfilx =
      AnimeStreaming(name: 'Netflix', url: 'https://www.netflix.com/anime1');

  final Anime anime1 = Anime(
    id: 1,
    title: 'Ejemplo Anime 1',
    description: 'Descripción del Anime 1',
    portraitImages: const AnimeImages(),
    landscapeImages: const AnimeImages(),
    episodes: 12,
    ageRating: 'PG-13',
    score: 8.5,
    genres: [genreDrama, genreAction],
    streaming: [streamingCrunchy, streamingNetfilx],
    status: AnimeStatus.emission,
    type: AnimeType.anime,
  );

  final anime2 = Anime(
    id: 2,
    title: 'Ejemplo Anime 2',
    description: 'Descripción del Anime 2',
    portraitImages: const AnimeImages(),
    landscapeImages: const AnimeImages(),
    trailerUrl: 'https://www.youtube.com/watch?v=abc123',
    episodes: 24,
    ageRating: 'R',
    score: 9.0,
    genres: [genreDrama],
    streaming: [streamingNetfilx],
    status: AnimeStatus.emission,
    type: AnimeType.manga,
  );

  setUp(() {
    mockUserListUseCase = MockUserListUseCase();
    myListBloc = MyListBloc(mockUserListUseCase);
  });

  group(' 👀 MyListBloc', () {
    blocTest<MyListBloc, MyListState>(
      'emits [_Loading,_Success] when started is added',
      build: () => myListBloc,
      setUp: () {
        when(mockUserListUseCase.getFavoriteAnimes())
            .thenAnswer((_) async => [anime1, anime2]);
      },
      act: (bloc) => bloc.add(const MyListEvent.started()),
      expect: () => [
        const MyListState.loading(),
        MyListState.success([anime1, anime2]),
      ],
    );

    blocTest<MyListBloc, MyListState>(
      'emits [_Loading,_Success] when update is added',
      build: () => myListBloc,
      act: (bloc) => bloc.add(MyListEvent.update([anime1, anime2])),
      expect: () => [
        const MyListState.loading(),
        MyListState.success([anime1, anime2]),
      ],
    );

    blocTest<MyListBloc, MyListState>(
      'emits [] when listenFavoriteAnimes doesn\'t stream',
      build: () => myListBloc,
      act: (bloc) {},
      expect: () => [],
    );
  });
}
