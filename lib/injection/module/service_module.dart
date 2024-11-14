import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@module
abstract class ServiceModule {

  @singleton
  Dio get dioClient => Dio(BaseOptions(baseUrl: 'https://api.binance.com/api/v3/', connectTimeout: const Duration(seconds: 20)));

}