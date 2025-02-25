import 'package:sh_mobile/core/use_cases/usecase.dart';
import 'package:sh_mobile/features/dogs/domain/entities/dog.entity.dart';
import 'package:sh_mobile/features/dogs/domain/repository/dogs.repository.dart';

class SaveLocalDogsUseCase implements UseCase<void, List<DogEntity>> {
  final DogsRepository _dogsRepository;

  SaveLocalDogsUseCase(this._dogsRepository);

  @override
  Future<void> call({List<DogEntity>? params}) async {
    _dogsRepository.saveDogs(params!);
  }
}
