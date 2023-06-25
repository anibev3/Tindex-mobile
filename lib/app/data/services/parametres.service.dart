import 'package:dio/dio.dart';

import 'package:pocketbase/pocketbase.dart';
import 'package:tindex_mobile/app/data/provider/api.dart';

class ParameterService {
  static Dio dio = Dio();
  final pb = PocketBase(ApiHelper.pbIp);

  Future<dynamic> getParameters() async {
    try {
      dynamic response = await pb
          .collection(ApiHelper.parametresCollectionName)
          .getFirstListItem('');
      print(
          "------------------------------ BEGIN ----------------------------------");
      print("sss response from getParameters :::: $response");
      print(
          "---------------------------- END ------------------------------------");
      return response;
    } catch (ex) {
      rethrow;
    }
  }

// ---- ----- ----- --- Dio requete ---- ----- ----- ---------------------
// -------------------------------------------------------

  Future confirmContact(String contact) async {
    Response response;

    try {
      print("UtilisateurService -- : ${ApiHelper.authApiConfirmNumber}");
      response = await dio.get(ApiHelper.authApiConfirmNumber,
          queryParameters: {"contact": contact});
      return response;
    } on DioError catch (ex) {
      return ex.response;
    }
  }

//  ********

  Future renewOTP(String contact, String signature) async {
    Response response;

    try {
      print("UtilisateurService -- : ${ApiHelper.authApiResendOtp}");
      response = await dio.get(ApiHelper.authApiResendOtp,
          queryParameters: {"contact": contact, "signature": signature});
      return response;
    } on DioError catch (ex) {
      return ex.response;
    }
  }

  Future loginWithNumber(String contact, String signature) async {
    Response response;

    try {
      print("UtilisateurService -- : ${ApiHelper.authApiLoginWithNumber}");
      response = await dio.get(ApiHelper.authApiLoginWithNumber,
          queryParameters: {"contact": contact, "signature": signature});
      return response;
    } on DioError catch (ex) {
      return ex.response;
    }
  }
}
