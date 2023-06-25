import 'dart:io';

import 'package:dio/dio.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:tindex_mobile/app/data/models/utilisateur.model.dart';
import 'package:tindex_mobile/app/data/provider/api.dart';

class UtilisateurService {
  static Dio dio = Dio();
  final pb = PocketBase(ApiHelper.pbIp);

  Future<dynamic> registerUser(Utilisateur utilisateur) async {
    RecordModel response;
    try {
      response = await pb
          .collection(ApiHelper.userCollectionName)
          .create(body: utilisateur.toMap());

      return response;
    } catch (ex) {
      rethrow;
    }
  }

  Future<dynamic> findUserByContact(String contact) async {
    try {
      dynamic response = await pb
          .collection(ApiHelper.userCollectionName)
          .getFirstListItem('contact="$contact"');

      print("sss response from findUserByContact :::: $response");
      return response;
    } catch (ex) {
      rethrow;
    }
  }

  Future<bool> validOtp(String contact, otp) async {
    Utilisateur user;
    try {
      dynamic response = await pb
          .collection(ApiHelper.userCollectionName)
          .getFirstListItem('contact="$contact"');

      user = Utilisateur.fromRecord(response);
    } catch (ex) {
      return false;
    }

    if (user.id == null) {
      return false;
    }

    //  si true
    //  checker le otp
    return user.otp == otp;
  }

  Future<dynamic> confirmAccount(String contact) async {
    try {
      dynamic response = await pb
          .collection(ApiHelper.userCollectionName)
          .getFirstListItem('contact="$contact"');

      print("sss response from findUserByContact :::: $response");
      Utilisateur user = Utilisateur.fromRecord(response);
      user.isactive = true;

      response = await pb
          .collection(ApiHelper.userCollectionName)
          .update(user.id!, body: user.toMap());
      return response;
    } catch (ex) {
      rethrow;
    }
  }

  loginWithPassword(String email, String password) async {
    try {
      dynamic response = await pb
          .collection(ApiHelper.userCollectionName)
          .authWithPassword(email, password);

      return response;
    } catch (ex) {
      rethrow;
    }
  }

// ---- ----- ----- --- Dio requete ---- ----- ----- ---------------------
// -------------------------------------------------------

  // Future confirmContact(String contact) async {
  //   Response response;

  //   try {
  //     print("UtilisateurService -- : ${ApiHelper.authApiConfirmNumber}");
  //     response = await dio.get(ApiHelper.authApiConfirmNumber,
  //         queryParameters: {"contact": contact});
  //     return response;
  //   } on DioError catch (ex) {
  //     return ex.response;
  //   }
  // }

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

  Future updateProfile(Utilisateur utilisateur, File? image) async {
    Response response;

    FormData formData = FormData.fromMap({
      "utilisateur": utilisateur.toJson(),
      "image": image != null && image.path.isNotEmpty
          ? MultipartFile.fromFileSync(image.path)
          : null
    });

    try {
      print(
          "UtilisateurService -- : ${ApiHelper.userApiUpdateProfile}/${utilisateur.id}");
      response = await dio.put(
          "${ApiHelper.userApiUpdateProfile}/${utilisateur.id}",
          data: formData);
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
