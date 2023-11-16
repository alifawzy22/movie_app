import 'package:dio/dio.dart';

abstract class Failure implements Exception {
  final String errorMessage;

  Failure({required this.errorMessage});
}

class ServerException extends Failure {
  ServerException({required super.errorMessage});

  factory ServerException.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerException(errorMessage: 'Connection Time Out');
      case DioExceptionType.sendTimeout:
        return ServerException(errorMessage: 'Send Time Out');
      case DioExceptionType.receiveTimeout:
        return ServerException(errorMessage: 'Receive Time Out');
      case DioExceptionType.badCertificate:
        return ServerException(errorMessage: 'Incorrect Certificate');
      case DioExceptionType.badResponse:
        return ServerException(
            errorMessage: dioException.response!.data['status_message']);
      case DioExceptionType.cancel:
        return ServerException(errorMessage: 'The Request Is Cancelled');
      case DioExceptionType.connectionError:
        return ServerException(errorMessage: 'No Internet Connection');
      case DioExceptionType.unknown:
        return ServerException(
            errorMessage: 'UnExpected Error, please try later');
    }
  }
}

class DataBaseException extends Failure {
  DataBaseException({required super.errorMessage});
}
