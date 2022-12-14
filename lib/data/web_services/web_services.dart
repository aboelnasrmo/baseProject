import 'package:approutertrial/helper/constants/strings.dart';
import 'package:dio/dio.dart';

class WebServices {
  Dio? dio;

  WebServices() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: 5000,
      receiveTimeout: 5000,
    );
    dio = Dio(options);
  }

  Future<List<dynamic>> getAllCharacters() async {
    try {
      Response response = await dio!.get('characters');

      return response.data;
    } on Exception {
      return [];
    }
  }

  Future<List<dynamic>> getCharacterQoutes(String charname) async {
    try {
      Response response =
          await dio!.get('quote', queryParameters: {'author': charname});

      return response.data;
    } on Exception {
      return [];
    }
  }
}
