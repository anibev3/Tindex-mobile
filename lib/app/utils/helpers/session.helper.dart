import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tindex_mobile/app/data/models/utilisateur.model.dart';
import 'package:tindex_mobile/app/routes/app_pages.dart';

class SessionManager {
  final Box = GetStorage();

  // static final IS_LOGGED = false.val("is_logged"); // Si 0:: Offline / 1:: Online
  /// static final IS_LOGGED2 = "".obs; // Si 0:: Offline / 1:: Online
  // static final USER_KEY = null.val("userkey");

  Future<bool> saveUserData(Utilisateur userFromServer) async {
    Box.write("IS_LOGGED", true);
    Box.write("USER_KEY", userFromServer.toJson());
    return Box.hasData("USER_KEY");
  }

  Future<bool> saveTmpUserData(Utilisateur userFromServer) async {
    Box.write("IS_TMP_LOGGED", true);
    Box.write("USER_TMP_KEY", userFromServer.toJson());
    return Box.hasData("USER_TMP_KEY");
  }

  Future<bool> saveUserToken(Map<String, dynamic> tokens) async {
    Box.write("access_token", tokens["accessToken"]);
    Box.write("refresh_token", tokens["refreshToken"]);
    return Box.hasData("refresh_token") && Box.hasData("refresh_token");
  }

  Utilisateur readUserData() {
    Utilisateur user = Utilisateur.fromJson(Box.read("USER_KEY"));
    return user;
  }

  Utilisateur readTempUserData() {
    Utilisateur user = Utilisateur.fromJson(Box.read("USER_TMP_KEY"));
    return user;
  }

  bool isOwner(String? resiProprietaireId) {
    if (resiProprietaireId == null) {
      return false;
    }
    Utilisateur user = readUserData();
    return user.id == resiProprietaireId;
  }

  void cleanTmpData() {
    Box.remove("USER_TMP_KEY");
    Box.remove("IS_TMP_LOGGED");
  }

  bool isUserLogged() {
    var dd = Box.read("IS_LOGGED");
    print(
        "++++++++++++++++++++++++++++++++++++++++++++++++++++++++ SESSION HELPER isUserLogged? dd: $dd");
    if (dd == null) return false;
    return dd;
  }

  bool isTmpUserLogged() {
    var dd = Box.read("IS_TMP_LOGGED");
    print(
        "++++++++++++++++++++++++++++++++++++++++++++++++++++++++ SESSION HELPER isTmpUserLogged? dd: $dd");
    if (dd == null) return false;
    return dd;
  }

  bool isInvited() {
    return Box.read("IS_INVITE") ?? !isUserLogged();
  }

  void logout() {
    cleanTmpData();
    Box.remove("IS_LOGGED");
    Box.remove("USER_KEY");
    Box.erase();

    ///Redirect to home screen page
    Get.offAllNamed(Routes.INITIAL);
  }
}
