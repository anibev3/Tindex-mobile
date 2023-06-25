import 'dart:async';
import 'dart:convert';
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:sms_autofill/sms_autofill.dart';

import 'package:tindex_mobile/app/data/models/utilisateur.model.dart';
import 'package:tindex_mobile/app/data/provider/exceptions_pb.dart';
import 'package:tindex_mobile/app/data/services/utilisateur.service.dart';
import 'package:tindex_mobile/app/routes/app_pages.dart';
import 'package:tindex_mobile/app/utils/helpers/session.helper.dart';
import 'package:tindex_mobile/app/utils/theme/Constant.dart';

class LoginController extends GetxController {
  //  --------------------------- SERVICES DEFINITION
  UtilisateurService utilisateurService = UtilisateurService();
  SessionManager prefs = SessionManager();
  //  ----------------------------------------------------------------

  GlobalKey<FormBuilderState> formLoginKey = GlobalKey();
  var issubmitLoading = false.obs;
  var isPassword = true.obs;

  @override
  void onReady() {
    super.onReady();
  }

  void submit() {
    if (isPassword.value) {
      submitWithPassword();
    } else {
      submitWithNumber();
    }
  }

  void submitWithPassword() async {
    print("calling submit with password ...");
    issubmitLoading(true);
    if (!(formLoginKey.currentState!.validate())) {
      issubmitLoading(false);
      return;
    }
    print("form is valid ****");
    formLoginKey.currentState!.save();
    var values = formLoginKey.currentState!.value;

    dynamic response = await utilisateurService
        .loginWithPassword(values['email'], values['password'])
        .catchError(PbExceptions(message400: "Email ou mot de passe incorrect")
            .checkError);
    print(response);

    if (response != null) {
      prefs.saveUserData(Utilisateur.fromRecord(response.record));
      //  vers la page
      Get.toNamed(Routes.HOME);
    }
    issubmitLoading(false);
  }

  void submitWithNumber() async {
    print("calling submit with number...");
    String signature = await SmsAutoFill().getAppSignature;

    issubmitLoading(true);
    if (!(formLoginKey.currentState!.validate())) {
      issubmitLoading(false);
      return;
    }
    print("form is valid ****");
    formLoginKey.currentState!.save();
    var values = formLoginKey.currentState!.value;

    var response =
        await utilisateurService.loginWithNumber(values['contact'], signature);
    int statusCode = response.statusCode;
    print(statusCode);
    print(response);
    if (response == null) {
      // pas de connexion
      await Flushbar(
        backgroundColor: Cst.kWarningColor,
        title: "Problème de connexion internet",
        margin: EdgeInsets.only(top: 50),
        message: 'Verifiez votre connexion à internet',
        duration: Duration(seconds: 3),
        flushbarPosition: FlushbarPosition.TOP,
      ).show(Get.context!);
      return;
    }

    if (statusCode == 200 || statusCode == 201) {
      var resultUser = response.data;
      await Flushbar(
        backgroundColor: Cst.kSuccesColor,
        title: "OTP envoyé",
        margin: EdgeInsets.only(top: 20),
        message: 'veuillez verifier votre téléphone',
        duration: Duration(seconds: 3),
        flushbarPosition: FlushbarPosition.BOTTOM,
      ).show(Get.context!);

      Utilisateur loginUser = Utilisateur.fromJson(jsonEncode(resultUser));
      await prefs.saveTmpUserData(loginUser);
      Get.toNamed(Routes.LOGINOTP);
      return;
    } else {
      await Flushbar(
        backgroundColor: Colors.blueGrey.shade600,
        title: "Echec de la tentative de connexion",
        message: "Ce compte n'existe pas",
        duration: Duration(seconds: 3),
        flushbarPosition: FlushbarPosition.BOTTOM,
      ).show(Get.context!);
    }

    issubmitLoading(false);
  }
}
