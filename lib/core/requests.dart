import 'package:dio/dio.dart';

class Requests {
  static final Requests _requests = Requests._internal();
  factory Requests() {
    return _requests;
  }
  Requests._internal();

  final _dio = Dio();

  Future<String> get() async {
    final result = await _dio.get('https://google.com');
    return result.data as String;
  }
}
