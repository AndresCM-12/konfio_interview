import 'package:sh_mobile/features/dogs/data/data_sources/local/app.database.dart';
import 'package:sh_mobile/features/dogs/domain/entities/dog.entity.dart';

class DogModel extends DogEntity {
  const DogModel({
    super.dogName,
    super.description,
    super.age,
    super.image,
  });

  factory DogModel.fromJson(Map<String, dynamic> json) {
    return DogModel(
      dogName: json['dogName'],
      description: json['description'],
      age: json['age'],
      image: json['image'],
    );
  }

  factory DogModel.fromTable(DogTableData tableData) {
    return DogModel(
      dogName: tableData.dogName,
      description: tableData.description,
      age: tableData.age,
      image: tableData.image,
    );
  }

  factory DogModel.fromEntity(DogEntity entity) {
    return DogModel(
      dogName: entity.dogName,
      description: entity.description,
      age: entity.age,
      image: entity.image,
    );
  }
}
