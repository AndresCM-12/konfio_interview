import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:drift/drift.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sh_mobile/core/database/app.database.dart';
import 'package:sh_mobile/core/resources/data_state.dart';
import 'package:sh_mobile/features/dogs/data/data_sources/remote/dogs.api.service.dart';
import 'package:sh_mobile/features/dogs/data/models/dogs.model.dart';
import 'package:sh_mobile/features/dogs/data/repository/dogs.implementation.dart';
import 'package:sh_mobile/features/dogs/domain/entities/dog.entity.dart';

import '../../../../fixtures/fixture_reader.dart';

class MockDogsRemoteDataSource extends Mock implements DogsApiService {}

class MockDogsLocalDataSource extends Mock implements AppDatabase {}

class MockDogTable extends Mock implements $DogTableTable {}

// ignore: subtype_of_sealed_class
class MockSimpleSelectStatement extends Mock
    implements SimpleSelectStatement<$DogTableTable, DogTableData> {}

void main() {
  late DogsApiService dogsApiService;
  late DogsImplementation dogsImplementation;
  late AppDatabase appDatabase;
  late MockDogTable mockDogTable;
  late MockSimpleSelectStatement mockSelectStatement;

  setUp(() {
    dogsApiService = MockDogsRemoteDataSource();
    appDatabase = MockDogsLocalDataSource();
    dogsImplementation = DogsImplementation(dogsApiService, appDatabase);
    mockDogTable = MockDogTable();
    mockSelectStatement = MockSimpleSelectStatement();
  });

  group('getDogs', () {
    test(
        'should return a list of DogModel from DogsApiService with correct value',
        () async {
      // Arrange
      final dogSting = fixture('dog.json');
      final dogJson = jsonDecode(dogSting);

      when(() => dogsApiService.getDogs()).thenAnswer((_) async => Response(
            data: [dogJson],
            statusCode: 200,
            requestOptions: RequestOptions(path: ''),
          ));

      // Act
      final response = await dogsImplementation.getDogs();

      // Assert
      expect(response, isA<DataSuccess>());
      expect(response.data, isA<List<DogModel>>());
      expect(response.data?.length, 1);
      expect(response.data?.first.dogName, 'Rex');

      verify(() => dogsApiService.getDogs()).called(1);
    });

    test('should return a DataFailed from DogsApiService with Exception',
        () async {
      // Arrange
      when(() => dogsApiService.getDogs()).thenThrow(DioException(
        requestOptions: RequestOptions(path: ''),
        type: DioExceptionType.unknown,
        error: 'error',
        message: 'error',
      ));

      // Act
      final response = await dogsImplementation.getDogs();

      // Assert
      expect(response, isA<DataFailed>());
      expect(response.error, isA<DioException>());

      verify(() => dogsApiService.getDogs()).called(1);
    });

    test(
        'should return a DataFailed from DogsApiService with status code != 200',
        () async {
      // Arrange
      when(() => dogsApiService.getDogs()).thenAnswer((_) async => Response(
            data: [],
            statusCode: 400,
            requestOptions: RequestOptions(path: ''),
          ));

      // Act
      final response = await dogsImplementation.getDogs();

      // Assert
      expect(response, isA<DataFailed>());
      expect(response.error, isA<DioException>());

      verify(() => dogsApiService.getDogs()).called(1);
    });
  });

  group('getSavedDogs', () {
    test('should return a list of DogModel from AppDatabase with correct value',
        () async {
      // Arrange
      const fakeDogTable = DogTableData(
        id: 1,
        dogName: 'Buddy',
        age: 3,
        description: 'Friendly dog',
        image: 'buddy.jpg',
      );

      when(() => appDatabase.dogTable).thenReturn(mockDogTable);
      when(() => appDatabase.select(mockDogTable))
          .thenReturn(mockSelectStatement);
      when(() => mockSelectStatement.get())
          .thenAnswer((_) async => [fakeDogTable]);

      // Act
      final response = await dogsImplementation.getSavedDogs();

      // Assert
      expect(response, isA<List<DogModel>>());
      expect(response.length, 1);
      expect(response.first.dogName, 'Buddy');

      verify(() => appDatabase.select(mockDogTable)).called(1);
      verify(() => mockSelectStatement.get()).called(1);
    });
  });

  group('saveDogs', () {
    test('should call the saveDogs method from the AppDatabase', () async {
      // arrange
      final List<DogEntity> dogs = [
        const DogEntity(
          dogName: 'dogName',
          age: 1,
          description: 'description',
          image: 'image',
        ),
      ];

      when(() => appDatabase.batch(any()))
          .thenAnswer((_) async => Future.value());

      // act
      await dogsImplementation.saveDogs(dogs);

      // assert
      verify(() => appDatabase.batch(any())).called(1);
    });
  });
}
