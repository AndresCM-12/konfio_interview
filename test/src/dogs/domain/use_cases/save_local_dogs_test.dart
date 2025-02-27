import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sh_mobile/features/dogs/domain/entities/dog.entity.dart';
import 'package:sh_mobile/features/dogs/domain/repository/dogs.repository.dart';
import 'package:sh_mobile/features/dogs/domain/use_cases/save_local_dogs.usecase.dart';

class MockDogsRepository extends Mock implements DogsRepository {}

void main() {
  late SaveLocalDogsUseCase usecase;
  late DogsRepository dogsRepository;

  setUp(() {
    dogsRepository = MockDogsRepository();
    usecase = SaveLocalDogsUseCase(dogsRepository);
  });

  group("SaveLocalDogsUseCase", () {
    test("should call DogsRepository and return void", () async {
      //arrange
      final List<DogEntity> dogList = [];
      when(() => dogsRepository.saveDogs(dogList)).thenAnswer((_) async {});

      //act
      await usecase.call(params: dogList);

      //assert
      verify(() => dogsRepository.saveDogs(dogList)).called(1);
    });
  });
}
