import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:sh_mobile/core/database/app.database.dart';
import 'package:sh_mobile/features/dogs/data/models/dogs.model.dart';
import 'package:sh_mobile/features/dogs/domain/entities/dog.entity.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  group("Dog Model", () {
    test("Dog Model should be created", () {
      // Arrange
      const dog = DogModel(
        dogName: "Dog",
        age: 1,
        description: "Breed",
        image: "Image Url",
      );

      // Assert
      expect(dog, isA<DogModel>());
    });

    test("Dog Model should be created from Json", () {
      // Arrange
      final dogString = fixture("dog.json");
      final json = jsonDecode(dogString);
      final dog = DogModel.fromJson(json);

      // Assert
      expect(dog, isA<DogModel>());
    });

    test("Dog Model should be created from Table", () {
      // Arrange
      const dog = DogTableData(
        id: 1,
        dogName: "Dog",
        age: 1,
        description: "Breed",
        image: "Image Url",
      );

      // Act
      final dogModel = DogModel.fromTable(dog);

      // Assert
      expect(dogModel, isA<DogModel>());
    });

    test("Dog Model should be created from DogEntity", () {
      // Arrange
      const dog = DogEntity(
        dogName: "Dog",
        age: 1,
        description: "Breed",
        image: "Image Url",
      );

      // Act
      final dogModel = DogModel.fromEntity(dog);

      // Assert
      expect(dogModel, isA<DogModel>());
    });
  });
}
