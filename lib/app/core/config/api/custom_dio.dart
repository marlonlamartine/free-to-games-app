import 'package:dio/dio.dart';

final customDio = BaseOptions(
  baseUrl: 'https://www.freetogame.com/api',
  connectTimeout: const Duration(seconds: 10),
  receiveTimeout: const Duration(seconds: 60),
);
