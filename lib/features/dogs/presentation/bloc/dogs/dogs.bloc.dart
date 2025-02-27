import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sh_mobile/core/resources/data_state.dart';
import 'package:sh_mobile/features/dogs/domain/use_cases/get_dogs.usecase.dart';
import 'package:sh_mobile/features/dogs/domain/use_cases/get_local_dogs.usecase.dart';
import 'package:sh_mobile/features/dogs/domain/use_cases/save_local_dogs.usecase.dart';
import 'package:sh_mobile/features/dogs/presentation/bloc/dogs/dogs.event.dart';
import 'package:sh_mobile/features/dogs/presentation/bloc/dogs/dogs.state.dart';

class DogsRemoteBloc extends Bloc<DogsRemoteEvent, DogsRemoteState> {
  final GetDogsUseCase _getDogsUseCase;
  final GetLocalDogsUseCase _getLocalDogsUseCase;
  final SaveLocalDogsUseCase _saveLocalDogsUseCase;

  DogsRemoteBloc(
    this._getDogsUseCase,
    this._getLocalDogsUseCase,
    this._saveLocalDogsUseCase,
  ) : super(const DogsRemoteLoading()) {
    on<GetDogs>(onGetDogs);
  }

  void onGetDogs(GetDogs event, Emitter<DogsRemoteState> emit) async {
    emit(const DogsRemoteLoading());

    if (!event.forceRefresh) {
      final localDogs = await _getLocalDogsUseCase.call();

      //We make sure that we have data in the local database
      if (localDogs.isNotEmpty) {
        emit(DogsRemoteSuccess(dogs: localDogs));
        return;
      }
    }

    ///If we don't have data in the local database, we fetch it from the remote server
    ///and save it in the local database
    final dataState = await _getDogsUseCase.call();
    if (dataState is DataFailed) {
      final error = dataState.error!;
      emit(DogsRemoteFailed(error: error));
      return;
    }

    final data = dataState.data!;
    await _saveLocalDogsUseCase.call(params: data);
    emit(DogsRemoteSuccess(dogs: data));
  }
}
