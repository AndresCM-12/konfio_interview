import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:sh_mobile/features/dogs/domain/entities/dog.entity.dart';

abstract class DogsRemoteState extends Equatable {
  final List<DogEntity>? dogs;
  final DioException? error;
  const DogsRemoteState({this.dogs, this.error});

  @override
  List<Object?> get props => [dogs, error];
}

class DogsRemoteLoading extends DogsRemoteState {
  const DogsRemoteLoading();
}

class DogsRemoteSuccess extends DogsRemoteState {
  const DogsRemoteSuccess({required List<DogEntity> dogs}) : super(dogs: dogs);
}

class DogsRemoteFailed extends DogsRemoteState {
  const DogsRemoteFailed({required DioException error}) : super(error: error);
}
