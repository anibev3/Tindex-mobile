import 'package:dio/dio.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:tindex_mobile/app/data/provider/api.dart';

class ResidenceTypeService {
  static Dio dio = Dio();
  final pb = PocketBase(ApiHelper.pbIp);

  Future<dynamic> getAllResidenceType() async {
    try {
      dynamic response = await pb
          .collection(ApiHelper.residenceTypeCollectionName)
          .getFullList(
            batch: 200,
            sort: '-created',
          );

      print("sss response from getAllResidenceType :::: $response");
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
}
