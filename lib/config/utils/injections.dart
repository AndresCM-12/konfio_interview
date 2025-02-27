import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:sh_mobile/config/router/routes.dart';
import 'package:sh_mobile/config/utils/constant/constants.dart';
import 'package:sh_mobile/core/database/app.database.dart';
import 'package:sh_mobile/features/dogs/data/data_sources/remote/dogs.api.service.dart';
import 'package:sh_mobile/features/dogs/data/repository/dogs.implementation.dart';
import 'package:sh_mobile/features/dogs/domain/repository/dogs.repository.dart';
import 'package:sh_mobile/features/dogs/domain/use_cases/get_dogs.usecase.dart';
import 'package:sh_mobile/features/dogs/domain/use_cases/get_local_dogs.usecase.dart';
import 'package:sh_mobile/features/dogs/domain/use_cases/save_local_dogs.usecase.dart';
import 'package:sh_mobile/features/dogs/presentation/bloc/dogs/dogs.bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
// Core
  // Router
  sl.registerSingleton<AppRouter>(AppRouter());
  // Dio Client
  sl.registerSingleton<Dio>(Dio(BaseOptions(
    baseUrl: Constants.baseUrl,
    headers: {'Content-Type': 'application/json'},
    receiveTimeout: const Duration(seconds: 20),
    connectTimeout: const Duration(seconds: 20),
    sendTimeout: const Duration(seconds: 20),
  )));

// Dogs Feature
  // Data Sources
  sl.registerSingleton<AppDatabase>(AppDatabase());
  sl.registerSingleton<DogsApiService>(DogsApiService(sl()));
  // Repository
  sl.registerSingleton<DogsRepository>(DogsImplementation(sl(), sl()));
  // Use Cases
  sl.registerSingleton<GetDogsUseCase>(GetDogsUseCase(sl()));
  sl.registerSingleton<SaveLocalDogsUseCase>(SaveLocalDogsUseCase(sl()));
  sl.registerSingleton<GetLocalDogsUseCase>(GetLocalDogsUseCase(sl()));
  // Bloc
  sl.registerFactory<DogsRemoteBloc>(() => DogsRemoteBloc(sl(), sl(), sl()));
}
