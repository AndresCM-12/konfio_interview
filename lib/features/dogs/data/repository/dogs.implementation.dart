import 'package:dio/dio.dart';
import 'package:drift/drift.dart';

import 'package:sh_mobile/config/utils/constant/constants.dart';
import 'package:sh_mobile/core/resources/data_state.dart';
import 'package:sh_mobile/core/database/app.database.dart';
import 'package:sh_mobile/features/dogs/data/data_sources/remote/dogs.api.service.dart';
import 'package:sh_mobile/features/dogs/data/models/dogs.model.dart';
import 'package:sh_mobile/features/dogs/domain/entities/dog.entity.dart';
import 'package:sh_mobile/features/dogs/domain/repository/dogs.repository.dart';

class DogsImplementation implements DogsRepository {
  final DogsApiService _dogsApiService;
  final AppDatabase _appDatabase;
  DogsImplementation(this._dogsApiService, this._appDatabase);

  @override
  Future<DataState<List<DogModel>>> getDogs() async {
    try {
      final response = await _dogsApiService.getDogs();
      final responseStatus = response.statusCode;

      if (responseStatus != 200) {
        final error = DioException(
          type: DioExceptionType.badResponse,
          response: response,
          message: response.statusMessage,
          requestOptions: response.requestOptions,
        );

        return DataFailed(error: error);
      }

      final data = response.data as List<dynamic>;
      final dogs = data.map((element) => DogModel.fromJson(element)).toList();

      return DataSuccess(data: dogs);
    } on DioException catch (e) {
      return DataFailed(error: e);
    } catch (e) {
      final error = DioException(
        requestOptions: RequestOptions(
          path: "${Constants.baseUrl}${Constants.dogsRoute}",
        ),
        type: DioExceptionType.unknown,
        error: e,
        message: e.toString(),
      );

      return DataFailed(error: error);
    }
  }

  @override
  Future<List<DogModel>> getSavedDogs() async {
    final dogTableList = await _appDatabase.select(_appDatabase.dogTable).get();
    final dogs = dogTableList.map((e) => DogModel.fromTable(e)).toList();

    return dogs;
  }

  @override
  Future<void> saveDogs(List<DogEntity> dogs) async {
    final dogsCompanionList = dogs
        .map((e) => DogTableCompanion(
              dogName: Value(e.dogName!),
              description: Value(e.description!),
              age: Value(e.age!),
              image: Value(e.image!),
            ))
        .toList();

    await _appDatabase.batch((batch) {
      batch.insertAll(
        _appDatabase.dogTable,
        dogsCompanionList,
        mode: InsertMode.insertOrReplace,
      );
    });
  }
}
