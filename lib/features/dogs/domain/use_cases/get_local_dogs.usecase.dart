import 'package:sh_mobile/core/use_cases/usecase.dart';
import 'package:sh_mobile/features/dogs/domain/entities/dog.entity.dart';
import 'package:sh_mobile/features/dogs/domain/repository/dogs.repository.dart';

class GetLocalDogsUseCase implements UseCase<List<DogEntity>, void> {
  final DogsRepository _dogsRepository;

  GetLocalDogsUseCase(this._dogsRepository);

  @override
  Future<List<DogEntity>> call({void params}) {
    return _dogsRepository.getSavedDogs();
  }
}
