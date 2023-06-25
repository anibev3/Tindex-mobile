import 'package:dio/dio.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:tindex_mobile/app/data/models/demande.model.dart';
import 'package:tindex_mobile/app/data/provider/api.dart';
import 'package:tindex_mobile/app/utils/helpers/date.helper.dart';

class DemandeService {
  static Dio dio = Dio();
  final pb = PocketBase(ApiHelper.pbIp);

  Future<dynamic> listDemandeOfResidence(String residenceID) async {
    print(DateHelper.now());
    print('residence == "$residenceID"');
    try {
      final result =
          await pb.collection(ApiHelper.demandeCollectionName).getList(
                page: 1,
                perPage: 50,
                filter:
                    'depart >=  "${DateHelper.now()}" && residence = "$residenceID" && statut = "validé" ',
              );
      return result;
    } catch (ex) {
      rethrow;
    }
  }

  Future<dynamic> listDemandeOfUser(String userID, {String statut = ""}) async {
    print(DateHelper.now());
    print('user id == "$userID"');
    String filterchain = 'client = "$userID"';

    if (statut != "" && statut.toLowerCase() != "tous") {
      filterchain += ' && statut = "${statut.toLowerCase()}"';
    }

    try {
      final result = await pb
          .collection(ApiHelper.demandeCollectionName)
          .getList(
              page: 1,
              perPage: 10,
              filter: filterchain,
              expand: "client, residence");

      print("result from get reservations of user :::: ${result}");
      return result;
    } catch (ex) {
      rethrow;
    }
  }

  Future<dynamic> listDemandeOfOwner(String userID,
      {page = 1, size = 10, String statut = ""}) async {
    print(DateHelper.now());
    print('user id == "$userID"');
    String filterchain = 'residence.proprietaire = "$userID"';

    if (statut != "" && statut.toLowerCase() != "tous") {
      filterchain += ' && statut = "${statut.toLowerCase()}"';
    }
    try {
      final result = await pb
          .collection(ApiHelper.demandeCollectionName)
          .getList(
              page: page,
              perPage: size,
              filter: filterchain,
              expand: "client, residence");

      print("result from get reservations of user :::: ${result}");
      return result;
    } catch (ex) {
      rethrow;
    }
  }

  Future<dynamic> addDemande(Demande dmd) async {
    print(DateHelper.now());

    try {
      final result = await pb
          .collection(ApiHelper.demandeCollectionName)
          .create(body: dmd.toMap());
      return result;
    } catch (ex) {
      rethrow;
    }
  }

  Future<dynamic> getDemandeById(String id) async {
    try {
      dynamic response =
          await pb.collection(ApiHelper.demandeCollectionName).getOne(
                id,
              );

      print("sss response from getDemandeById :::: $response");
      return response;
    } catch (ex) {
      rethrow;
    }
  }

  Future<dynamic> updateDemande(String id, Demande dmd) async {
    try {
      dynamic response = await pb
          .collection(ApiHelper.demandeCollectionName)
          .update(id, body: dmd.toMap());

      print("sss response from getDemandeById :::: $response");
      return response;
    } catch (ex) {
      rethrow;
    }
  }

// ---- ----- ----- --- Dio requete ---- ----- ----- ---------------------
// -------------------------------------------------------

  Future confirmDemande(String demandeid, bool mode) async {
    Response response;

    try {
      print("Demande Service  -- : ${ApiHelper.demandeConfirm}");
      response = await dio.put(
        "${ApiHelper.demandeConfirm}/$demandeid/$mode",
      );
      return response;
    } on DioError catch (ex) {
      return ex.response;
    }
  }
}
