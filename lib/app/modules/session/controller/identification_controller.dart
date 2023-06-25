import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:tindex_mobile/app/data/models/utilisateur.model.dart';
import 'package:tindex_mobile/app/data/provider/exceptions_pb.dart';
import 'package:tindex_mobile/app/data/services/utilisateur.service.dart';
import 'package:tindex_mobile/app/routes/app_pages.dart';
import 'package:tindex_mobile/app/utils/helpers/session.helper.dart';

class IdentificationController extends GetxController {
  //  --------------------------- SERVICES DEFINITION
  UtilisateurService utilisateurService = UtilisateurService();
  SessionManager prefs = SessionManager();
  //  ----------------------------------------------------------------

  GlobalKey<FormBuilderState> formIdentificationeKey = GlobalKey();
  var issubmitLoading = false.obs;

  @override
  void onReady() {
    super.onReady();
  }

  void submit() async {
    issubmitLoading(true);
    if (!(formIdentificationeKey.currentState!.validate())) {
      issubmitLoading(false);
      return;
    }

    formIdentificationeKey.currentState!.save();
    var values = formIdentificationeKey.currentState!.value;
    String nom = values['noms'].toString().split(" ").first;
    String prenoms = values['noms'].toString().replaceFirst(nom, '').trim();

    // casser le nom et prenoms
    Utilisateur user = Utilisateur();
    user.nom = nom;
    user.prenoms = prenoms;
    user.contact = values['contact'];
    user.password = values['password'];
    user.passwordConfirm = values['password'];
    user.email = values['email'];
    user.roles = ['client'];
    dynamic response = await utilisateurService
        .registerUser(user)
        .catchError(PbExceptions().checkError);

    if (response != null) {
      prefs.saveTmpUserData(Utilisateur.fromRecord(response));
      print("Finish saviing .... Temp User --------------------------------");
      print(prefs.readTempUserData().toJson());

      await Flushbar(
        backgroundColor: Colors.black,
        title: "Compte crée",
        margin: EdgeInsets.only(top: 50),
        message: 'Veuillez vous connecter',
        duration: Duration(seconds: 3),
        flushbarPosition: FlushbarPosition.BOTTOM,
      ).show(Get.context!);
      issubmitLoading(false);
      //  vers la page
      Get.toNamed(Routes.OTP);
      return;
    } else {
      await Flushbar(
        backgroundColor: Colors.indigoAccent,
        title: "Echec de la requête",
        message: 'Verifiez les données entrées',
        duration: Duration(seconds: 3),
        flushbarPosition: FlushbarPosition.BOTTOM,
      ).show(Get.context!);
    }
  }
}
