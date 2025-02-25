import 'package:sh_mobile/core/resources/data_state.dart';
import 'package:sh_mobile/core/use_cases/usecase.dart';
import 'package:sh_mobile/features/dogs/domain/entities/dog.entity.dart';
import 'package:sh_mobile/features/dogs/domain/repository/dogs.repository.dart';

class GetDogsUseCase implements UseCase<DataState<List<DogEntity>>, void> {
  final DogsRepository _dogsRepository;

  GetDogsUseCase(this._dogsRepository);

  @override
  Future<DataState<List<DogEntity>>> call({void params}) {
    return _dogsRepository.getDogs();
  }
}
