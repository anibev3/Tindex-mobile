import 'package:dio/dio.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:tindex_mobile/app/data/models/commentaire.model.dart';
import 'package:tindex_mobile/app/data/provider/api.dart';
import 'package:tindex_mobile/app/utils/helpers/date.helper.dart';

class CommentService {
  static Dio dio = Dio();
  final pb = PocketBase(ApiHelper.pbIp);

  Future<dynamic> getCommentOnResidence(String residenceID) async {
    try {
      dynamic response =
          await pb.collection(ApiHelper.noteCollectionName).getFullList(
                batch: 200,
                sort: '-created',
                expand: 'residence, user',
                filter: 'residence = "$residenceID" ',
              );
      return response;
    } catch (ex) {
      rethrow;
    }
  }

  Future<dynamic> getUserCommentOnResidence(
      String userId, String residenceID) async {
    try {
      dynamic response =
          await pb.collection(ApiHelper.noteCollectionName).getFirstListItem(
                'residence = "$residenceID" && user = "$userId"',
                expand: 'residence, user',
              );
      return response;
    } catch (ex) {
      rethrow;
    }
  }

  Future<dynamic> addCommentaire(Commentaire cmt) async {
    print("${DateHelper.now()} -----  ${cmt.toMap()}");

    try {
      final result = await pb
          .collection(ApiHelper.noteCollectionName)
          .create(body: cmt.toMap());
      return result;
    } catch (ex) {
      rethrow;
    }
  }

  Future<dynamic> updateCommentaire(Commentaire cmt) async {
    print("${DateHelper.now()} -----  ${cmt.toMap()}");

    try {
      final result = await pb
          .collection(ApiHelper.noteCollectionName)
          .update(cmt.id!, body: cmt.toMap());
      return result;
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
