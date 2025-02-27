import 'package:bloc_test/bloc_test.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sh_mobile/core/resources/data_state.dart';
import 'package:sh_mobile/features/dogs/domain/entities/dog.entity.dart';
import 'package:sh_mobile/features/dogs/domain/repository/dogs.repository.dart';
import 'package:sh_mobile/features/dogs/domain/use_cases/get_dogs.usecase.dart';
import 'package:sh_mobile/features/dogs/domain/use_cases/get_local_dogs.usecase.dart';
import 'package:sh_mobile/features/dogs/domain/use_cases/save_local_dogs.usecase.dart';
import 'package:sh_mobile/features/dogs/presentation/bloc/dogs/dogs.bloc.dart';
import 'package:sh_mobile/features/dogs/presentation/bloc/dogs/dogs.event.dart';
import 'package:sh_mobile/features/dogs/presentation/bloc/dogs/dogs.state.dart';

class MockGetDogsUseCase extends Mock implements GetDogsUseCase {}

class MockGetLocalDogsUseCase extends Mock implements GetLocalDogsUseCase {}

class MockSaveLocalDogsUseCase extends Mock implements SaveLocalDogsUseCase {}

void main() {
  late DogsRemoteBloc dogsBloc;
  late GetDogsUseCase mockGetDogsUseCase;
  late GetLocalDogsUseCase mockGetLocalDogsUseCase;
  late SaveLocalDogsUseCase mockSaveLocalDogsUseCase;

  setUp(() {
    mockGetDogsUseCase = MockGetDogsUseCase();
    mockGetLocalDogsUseCase = MockGetLocalDogsUseCase();
    mockSaveLocalDogsUseCase = MockSaveLocalDogsUseCase();

    dogsBloc = DogsRemoteBloc(
      mockGetDogsUseCase,
      mockGetLocalDogsUseCase,
      mockSaveLocalDogsUseCase,
    );
  });

  tearDown(() async {
    await dogsBloc.close();
  });

  final testDogs = [
    const DogEntity(
      dogName: 'Buddy',
      age: 3,
      description: 'Friendly dog',
      image: 'buddy.jpg',
    ),
  ];

  group("onGetDogs", () {
    blocTest<DogsRemoteBloc, DogsRemoteState>(
      'should emit [DogsRemoteLoading, DogsRemoteSuccess] and only call local use case',
      build: () {
        when(() => mockGetLocalDogsUseCase.call())
            .thenAnswer((_) async => testDogs);
        return dogsBloc;
      },
      act: (bloc) => bloc.add(const GetDogs(forceRefresh: false)),
      expect: () => [
        const DogsRemoteLoading(),
        DogsRemoteSuccess(dogs: testDogs),
      ],
      verify: (_) {
        verify(() => mockGetLocalDogsUseCase.call()).called(1);
        verifyNever(() => mockGetDogsUseCase.call());
      },
    );

    blocTest<DogsRemoteBloc, DogsRemoteState>(
      'should emit [DogsRemoteLoading, DogsRemoteSuccess] and save local data when forceRefresh is true',
      build: () {
        when(() => mockSaveLocalDogsUseCase.call(params: testDogs))
            .thenAnswer((_) => Future.value());
        when(() => mockGetDogsUseCase.call()).thenAnswer(
          (_) async => DataSuccess(data: testDogs),
        );

        return dogsBloc;
      },
      act: (bloc) => bloc.add(const GetDogs(forceRefresh: true)),
      expect: () => [
        const DogsRemoteLoading(),
        DogsRemoteSuccess(dogs: testDogs),
      ],
      verify: (_) {
        verifyNever(() => mockGetLocalDogsUseCase.call());
        verifyNever(() => mockSaveLocalDogsUseCase.call());
        verify(() => mockGetDogsUseCase.call()).called(1);
      },
    );

    blocTest<DogsRemoteBloc, DogsRemoteState>(
      'should emit [DogsRemoteLoading, DogsRemoteSuccess] and only call remote use case if local data is empty',
      build: () {
        when(() => mockGetLocalDogsUseCase.call()).thenAnswer((_) async => []);

        when(() => mockGetDogsUseCase.call())
            .thenAnswer((_) async => DataSuccess(data: testDogs));

        when(() => mockSaveLocalDogsUseCase.call(params: testDogs))
            .thenAnswer((_) => Future.value());

        return dogsBloc;
      },
      act: (bloc) => bloc.add(const GetDogs()),
      expect: () => [
        const DogsRemoteLoading(),
        DogsRemoteSuccess(dogs: testDogs),
      ],
      verify: (_) {
        verify(() => mockGetLocalDogsUseCase.call()).called(1);
        verify(() => mockGetDogsUseCase.call()).called(1);
        verify(() => mockSaveLocalDogsUseCase.call(params: testDogs)).called(1);
      },
    );

    blocTest<DogsRemoteBloc, DogsRemoteState>(
      'should emit [DogsRemoteLoading, DogsRemoteFailed] when saved dogs are empty and only call remote use case',
      build: () {
        when(() => mockGetLocalDogsUseCase.call()).thenAnswer((_) async => []);

        when(() => mockGetDogsUseCase.call()).thenAnswer((_) async =>
            DataFailed(error: DioException(requestOptions: RequestOptions())));

        return dogsBloc;
      },
      act: (bloc) => bloc.add(const GetDogs()),
      expect: () => [const DogsRemoteLoading(), isA<DogsRemoteFailed>()],
      verify: (_) {
        verify(() => mockGetLocalDogsUseCase.call()).called(1);
        verify(() => mockGetDogsUseCase.call()).called(1);
        verifyNever(
            () => mockSaveLocalDogsUseCase.call(params: any(named: "params")));
      },
    );
  });
}
