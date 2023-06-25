// import 'dart:convert';

// import 'package:another_flushbar/flushbar.dart';
// import 'package:flutter/material.dart';

// import 'package:get/get.dart';
// import 'package:mobile/app/data/models/utilisateur.model.dart';
// import 'package:mobile/app/data/services/utilisateur.service.dart';
// import 'package:mobile/app/routes/app_pages.dart';
// import 'package:mobile/app/utils/helpers/session.helper.dart';
// import 'package:mobile/app/utils/theme/Constant.dart';
// import 'package:sms_autofill/sms_autofill.dart';

// class OtpLoginController extends GetxController {
//   //  ---------   SERVICES ----------
//   UtilisateurService utilisateurService = UtilisateurService();

// //  -----------------------------------
//   SessionManager prefs = SessionManager();
//   var isLoginLoading = false.obs;
//   var currentUser = Utilisateur().obs;

//   GlobalKey<FormState> formKey = GlobalKey();

//   TextEditingController tecOtp = TextEditingController();
//   @override
//   void onInit() async {
//     print("------ donnees enregistrees");
//     currentUser(prefs.readTempUserData());
//     print(currentUser.value.otp);
//     print("args=====");

//     super.onInit();
//   }

// //  renew OTP
//   renewOTP() async {
//     var signature = await SmsAutoFill().getAppSignature;

//     var response = await utilisateurService.renewOTP(
//         currentUser.value.contact!, signature);
//     if (response == null) {
//       // pas de connexion
//       await Flushbar(
//         backgroundColor: Cst.kWarningColor,
//         title: "Problème de connexion internet",
//         margin: EdgeInsets.only(top: 50),
//         message: 'Verifiez votre connexion à internet',
//         duration: Duration(seconds: 3),
//         flushbarPosition: FlushbarPosition.TOP,
//       ).show(Get.context!);
//       return;
//     }
//     int statusCode = response.statusCode;
//     print(statusCode);
//     print(response);
//     if (statusCode == 200 || statusCode == 201) {
//       var resultUser = response.data;
//       await Flushbar(
//         backgroundColor: Cst.kSuccesColor,
//         title: "OTP renvoyé",
//         margin: EdgeInsets.only(top: 20),
//         message: 'veuillez verifier votre téléphone',
//         duration: Duration(seconds: 3),
//         flushbarPosition: FlushbarPosition.BOTTOM,
//       ).show(Get.context!);

//       Utilisateur loginUser = Utilisateur.fromJson(jsonEncode(resultUser));
//       await prefs.saveTmpUserData(loginUser);
//       currentUser(prefs.readTempUserData());
//     }
//   }

// //  new
//   validateAccount() async {
//     if (tecOtp.text.trim().length != 4) {
//       await Flushbar(
//         backgroundColor: Cst.kWarningColor,
//         title: "OTP non renseigné",
//         margin: EdgeInsets.only(top: 50),
//         message: 'Verifiez le OTP reçu par SMS ',
//         duration: Duration(seconds: 3),
//         flushbarPosition: FlushbarPosition.TOP,
//       ).show(Get.context!);
//       return;
//     }
//     isLoginLoading(true);
//     print("validation de compte");
//     print(tecOtp.text.trim());
//     print(currentUser.value.otp!.trim());

//     if (currentUser.value.otp!.trim() == tecOtp.text.trim()) {
//       // le connecté ou demander son inscription
//       await prefs.saveUserData(currentUser.value);
//       prefs.cleanTmpData();
//       Get.offAllNamed(Routes.HOME);
//       // prefs.cleanTmpData();
//     } else {
//       await Flushbar(
//         backgroundColor: Cst.kWarningColor,
//         title: "OTP erroné",
//         margin: EdgeInsets.only(top: 50),
//         message: 'Verifiez le OTP reçu par SMS',
//         duration: Duration(seconds: 3),
//         flushbarPosition: FlushbarPosition.TOP,
//       ).show(Get.context!);
//     }
//     isLoginLoading(false);
//   }

//   void cancelValidation() {
//     prefs.logout();
//   }
// }
