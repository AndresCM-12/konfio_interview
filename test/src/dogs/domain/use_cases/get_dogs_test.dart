import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sh_mobile/core/resources/data_state.dart';
import 'package:sh_mobile/features/dogs/domain/entities/dog.entity.dart';
import 'package:sh_mobile/features/dogs/domain/repository/dogs.repository.dart';
import 'package:sh_mobile/features/dogs/domain/use_cases/get_dogs.usecase.dart';

class MockDogsRepository extends Mock implements DogsRepository {}

void main() async {
  late DogsRepository dogsRepository;
  late GetDogsUseCase usecase;

  setUp(() {
    dogsRepository = MockDogsRepository();
    usecase = GetDogsUseCase(dogsRepository);
  });

  group('GetDogsUseCase', () {
    test('should call DogsRepository and return DataSuccess<List<DogEntity>>',
        () async {
      //arrange
      when(() => dogsRepository.getDogs())
          .thenAnswer((_) async => const DataSuccess(data: []));

      //act
      final result = await usecase.call();

      //assert
      expect(result, equals(const DataSuccess<List<DogEntity>>(data: [])));
      verify(() => dogsRepository.getDogs()).called(1);
    });

    test('should call DogsRepository and return DataFailed<DioException>',
        () async {
      //arrange
      final dioException =
          DioException(requestOptions: RequestOptions(path: '/'));
      when(() => dogsRepository.getDogs())
          .thenAnswer((_) async => DataFailed(error: dioException));

      //act
      final result = await usecase.call();

      //assert
      expect(result, equals(DataFailed<List<DogEntity>>(error: dioException)));
      verify(() => dogsRepository.getDogs()).called(1);
    });
  });
}
