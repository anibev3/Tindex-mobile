import 'dart:io';

import 'package:dio/dio.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:tindex_mobile/app/data/models/coordonnee.model.dart';
import 'package:tindex_mobile/app/data/models/residence.model.dart';
import 'package:tindex_mobile/app/data/provider/api.dart';

class ResidenceService {
  static Dio dio = Dio();
  final pb = PocketBase(ApiHelper.pbIp);

  Future<dynamic> getAllResidence() async {
    try {
      dynamic response =
          await pb.collection(ApiHelper.residenceCollectionName).getFullList(
                batch: 200,
                sort: '-created',
                expand: 'residencetype,  proprietaire',
              );

      print("sss response from getAllResidence :::: $response");
      return response;
    } catch (ex) {
      rethrow;
    }
  }

  Future<dynamic> getRecentResidence() async {
    try {
      dynamic response =
          await pb.collection(ApiHelper.residenceCollectionName).getFullList(
                batch: 5,
                sort: '-created',
                expand: 'residencetype,  proprietaire',
              );

      print("sss response from getAllResidence :::: $response");
      return response;
    } catch (ex) {
      rethrow;
    }
  }

  Future<dynamic> findResidenceByName(String name) async {
    try {
      dynamic response = await pb
          .collection(ApiHelper.residenceCollectionName)
          .getFullList(
              batch: 10000,
              sort: '-created',
              expand: 'residencetype,  proprietaire',
              filter: 'residencelibelle ~ "${name}" || adresse ~ "${name}"');

      print("sss response from find All Residence :::: $response");
      return response;
    } catch (ex) {
      rethrow;
    }
  }

  Future<dynamic> getAllResidenceByType(String residenceTypeID) async {
    try {
      dynamic response =
          await pb.collection(ApiHelper.residenceCollectionName).getFullList(
                batch: 200,
                sort: '-created',
                filter: 'residencetype = "$residenceTypeID"',
                expand: 'residencetype, proprietaire',
              );

      print("sss response from getAllResidence :::: $response");
      return response;
    } catch (ex) {
      rethrow;
    }
  }

  Future<dynamic> getAllResidenceByUserId(String userID) async {
    try {
      dynamic response =
          await pb.collection(ApiHelper.residenceCollectionName).getFullList(
                batch: 200,
                sort: '-created',
                filter: 'proprietaire = "$userID" && residenceenable = true',
                expand: 'residencetype,  proprietaire',
              );

      print("sss response from getAllResidenceByUserId :::: $response");
      return response;
    } catch (ex) {
      rethrow;
    }
  }

  Future<dynamic> getResidenceById(String id) async {
    try {
      dynamic response =
          await pb.collection(ApiHelper.residenceCollectionName).getOne(
                id,
                expand: 'residencetype, proprietaire',
              );

      print("sss response from getResidenceById :::: $response");
      return response;
    } catch (ex) {
      rethrow;
    }
  }

  Future<dynamic> updateResidence(String id, Residence resi) async {
    try {
      dynamic response = await pb
          .collection(ApiHelper.residenceCollectionName)
          .update(id, body: resi.toMap());

      print("sss response from updateResidence :::: $response");
      return response;
    } catch (ex) {
      rethrow;
    }
  }

// ---- ----- ----- --- Dio requete ---- ----- ----- ---------------------
// -------------------------------------------------------

  Future findPlace(Coordonnee data) async {
    Response response;
    try {
      print("ResidenceService -- : ${ApiHelper.residenceApiFindPlaces}");
      response = await dio
          .get("${ApiHelper.residenceApiFindPlaces}/${data.lat}/${data.lng}");
      return response;
    } on DioError catch (ex) {
      return ex.response;
    }
  }

  Future postResidence(Residence data, List<File> images) async {
    Response response;

    print("files in request are :::: ${images.length}");

    print("------------------------ ${images.first.path}");

    print(
        "----file from--------- ${await MultipartFile.fromFile(images.first.path, filename: "")}");

    var listeImage =
        images.map((e) => MultipartFile.fromFileSync(e.path)).toList();
    print(listeImage);

    FormData formData =
        FormData.fromMap({"residence": data.toJson(), "images": listeImage});

    try {
      print("ResidenceService -- : ${ApiHelper.residenceApiPost}");
      response = await dio.post(
        "${ApiHelper.residenceApiPost}",
        data: formData,
      );
      return response;
    } on DioError catch (ex) {
      return ex.response;
    }
  }
}
