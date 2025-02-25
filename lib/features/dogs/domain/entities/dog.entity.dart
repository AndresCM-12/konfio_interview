import 'package:equatable/equatable.dart';

class DogEntity extends Equatable {
  final String? dogName;
  final String? description;
  final int? age;
  final String? image;

  const DogEntity({
    this.dogName,
    this.description,
    this.age,
    this.image,
  });

  @override
  List<Object?> get props => [dogName, description, age, image];
}
