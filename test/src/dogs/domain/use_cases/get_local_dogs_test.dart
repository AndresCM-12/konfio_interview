import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sh_mobile/features/dogs/domain/repository/dogs.repository.dart';
import 'package:sh_mobile/features/dogs/domain/use_cases/get_local_dogs.usecase.dart';

class MockDogsRepository extends Mock implements DogsRepository {}

void main() {
  late GetLocalDogsUseCase usecase;
  late DogsRepository dogsRepository;

  setUp(() {
    dogsRepository = MockDogsRepository();
    usecase = GetLocalDogsUseCase(dogsRepository);
  });

  group("GetLocalDogsUseCase", () {
    test("should call DogsRepository and return List<DogEntity>", () async {
      //arrange
      when(() => dogsRepository.getSavedDogs()).thenAnswer((_) async => []);

      //act
      final result = await usecase.call();

      //assert
      expect(result, equals([]));
      verify(() => dogsRepository.getSavedDogs()).called(1);
    });
  });
}
