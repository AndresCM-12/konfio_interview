import 'package:sh_mobile/core/resources/data_state.dart';
import 'package:sh_mobile/features/dogs/domain/entities/dog.entity.dart';

abstract class DogsRepository {
  //Remote
  Future<DataState<List<DogEntity>>> getDogs();

  //Local
  Future<void> saveDogs(List<DogEntity> dogs);
  Future<List<DogEntity>> getSavedDogs();
}
