import 'package:dio/dio.dart';

class DioExceptions implements Exception {
  DioExceptions.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioExceptionType.cancel:
        message = "Request to API server was cancelled";
        break;
      case DioExceptionType.connectionTimeout:
        message = "Connection timeout with API server";
        break;
      case DioExceptionType.unknown:
        message = "Connection to API server failed due to internet connection";
        break;
      case DioExceptionType.receiveTimeout:
        message = "Receive timeout in connection with API server";
        break;
      case DioExceptionType.badResponse:
        print("dio error except");
        print(dioError.response);
        message = _handleError(
            dioError.response?.statusCode as int, dioError.response!.data);
        break;
      case DioExceptionType.sendTimeout:
        message = "Send timeout in connection with API server";
        break;

      default:
        message = "Quelque chose s'est mal passé";
        break;
    }
  }

  String message = "";

  String _handleError(int statusCode, dynamic error) {
    print(error);
    switch (statusCode) {
      case 400:
        return 'Mauvaise requête';
      case 404:
        return error["message"];
      case 406:
        return "Compte Inactif";
      case 500:
        return 'Erreur Interne du serveur';
      default:
        return error != null && error["message"] != null
            ? error["message"]
            : "Oups, quelque chose s'est mal passé";
    }
  }

  @override
  String toString() => message;
}
