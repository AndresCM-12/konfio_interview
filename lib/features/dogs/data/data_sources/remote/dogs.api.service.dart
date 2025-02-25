import 'package:dio/dio.dart';
import 'package:sh_mobile/config/utils/constant/constants.dart';

class DogsApiService {
  final Dio _dio;

  DogsApiService(this._dio);

  Future<Response<dynamic>> getDogs() async {
    final response = await _dio.get(Constants.dogsRoute,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ));
    return response;
  }
}
