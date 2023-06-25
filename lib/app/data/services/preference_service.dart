import 'package:get/state_manager.dart';
import 'package:dio/dio.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:tindex_mobile/app/data/models/favoris.model.dart';
import 'package:tindex_mobile/app/data/models/utilisateur.model.dart';
import 'package:tindex_mobile/app/data/provider/api.dart';
import 'package:tindex_mobile/app/data/provider/exceptions_pb.dart';
import 'package:tindex_mobile/app/utils/helpers/session.helper.dart';

class PreferencesService extends GetxService {
  static Dio dio = Dio();
  final pb = PocketBase(ApiHelper.pbIp);

  //  --------------------------- SERVICES DEFINITION

  SessionManager prefs = SessionManager();
  //  ----------------------------------------------------------------

  var currentUser = Utilisateur().obs;
  var isfavloading = false.obs;
  var favorisList = <Favoris>[].obs;

  Future<PreferencesService> init() async {
    //  init user prefs
    if (prefs.isUserLogged()) {
      // get user panier
      currentUser(prefs.readUserData());
      getFavoris(currentUser.value.id!);
    } else {
      favorisList.clear();
    }

    return this;
  }

  Future getFavoris(String userId) async {
    if (prefs.isUserLogged()) {
      isfavloading(true);

      dynamic response = await pb
          .collection(ApiHelper.favorisCollectionName)
          .getFullList(
              batch: 200,
              sort: '-created',
              filter: 'utilisateur = "$userId" && enable = true',
              expand: "utilisateur, residence")
          .catchError(PbExceptions().checkError);

      if (response != null) {
        favorisList.clear();
        favorisList.addAll(listefavorisFromRecord(response));
        for (var element in favorisList) {
          print("+++++++++++++++++++++++++++++++++++++++++++");
          print("++++++++++++++++ DEBUT +++++++++++++++++++++++");
          print(element.toJson());
          print("++++++++++++++++++ FIN +++++++++++++++++++++");
          print("+++++++++++++++++++++++++++++++++++++++++++");
        }
      }
    }
  }

  //  ---================================================================

  int getIndexByResidenceId(String id) {
    int indexPref =
        favorisList.indexWhere((element) => element.residence == id);
    return indexPref;
  }

  bool isFavorite(String id) {
    // print("elts from anywhere ==== ${favorisList}");
    int indexPref = getIndexByResidenceId(id);
    // print("Checking preference house is set :::: $id ------ $indexPref");
    if (indexPref != -1) {
      return true;
    }
    return false;
  }

  toggleFavorite(String id) async {
    if (prefs.isUserLogged()) {
      // get user panier

      if (currentUser.value.id == null) {
        currentUser(prefs.readUserData());
      }
      dynamic response = await pathFavoris(id);
      print(response);
      getFavoris(currentUser.value.id!);
    }
  }

  // =============================    =================

  Future pathFavoris(String idresi) async {
    Response response;
    try {
      print("FavorisService -- : ${ApiHelper.favorisApiSet}");
      response = await dio
          .patch("${ApiHelper.favorisApiSet}/${currentUser.value.id}/$idresi");
      return response;
    } on DioError catch (ex) {
      return ex.response;
    }
  }
}
