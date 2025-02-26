import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

abstract class DataState<T> extends Equatable {
  final T? data;
  final DioException? error;

  const DataState({this.data, this.error});

  @override
  List<Object?> get props => [data, error];
}

class DataSuccess<T> extends DataState<T> {
  const DataSuccess({required T data}) : super(data: data);
}

class DataFailed<T> extends DataState<T> {
  const DataFailed({required DioException error}) : super(error: error);
}
