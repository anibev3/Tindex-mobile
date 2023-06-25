// import 'dart:convert';
// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:flutter_form_builder/flutter_form_builder.dart';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:mobile/app/data/models/utilisateur.model.dart';
// import 'package:mobile/app/data/services/utilisateur.service.dart';
// import 'package:mobile/app/utils/helpers/session.helper.dart';

// class UpdateProfileController extends GetxController {
//   //  --------------------------- SERVICES DEFINITION
//   UtilisateurService utilisateurService = UtilisateurService();
//   SessionManager prefs = SessionManager();
//   //  ----------------------------------------------------------------

//   final ImagePicker _picker = ImagePicker();
//   var currentUser = Utilisateur().obs;
//   //  -----------------------------------------------

//   GlobalKey<FormBuilderState> formUpdateProfileKey = GlobalKey();
//   var issubmitLoading = false.obs;
//   var currentImage = XFile("").obs;
//   var hasimage = false.obs;
//   var hasHttpimage = false.obs;

//   @override
//   void onReady() async {
//     currentUser(prefs.readUserData());
//     formUpdateProfileKey.currentState?.patchValue(
//         {'noms': "${currentUser.value.nom} ${currentUser.value.prenoms}"});
//     print(" --- check avatar ${currentUser.value.avatar} !! ");
//     print(" --- check value of avatar ${currentUser.value.avatar == ""} !! ");
//     if (currentUser.value.avatar != null && currentUser.value.avatar != "") {
//       currentImage(XFile(currentUser.value.avatar!));
//       print(" -- go for image...");
//       hasimage(true);
//       hasHttpimage(true);
//     } else {
//       hasimage(false);
//       hasHttpimage(false);
//     }
//     print(currentUser.value.otp);
//     print("args=====");

//     print("has image value ::: ===== ${hasimage.value}");

//     super.onReady();
//   }

//   addImages() async {
//     final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
//     print("updProfile123// ${image?.path}");
//     if (image != null) {
//       currentImage(image);
//       hasimage(true);
//       hasHttpimage(false);
//     }
//   }

//   bool validateForm() {
//     print(
//         "updProfile123// - Validaton of the form ${formUpdateProfileKey.currentState!.validate()}  !!!");
//     if (!(formUpdateProfileKey.currentState!.validate())) {
//       issubmitLoading(false);
//       return false;
//     }

//     formUpdateProfileKey.currentState!.save();
//     return true;
//   }

//   void submit() async {
//     if (!validateForm()) {
//       return;
//     }
//     issubmitLoading(true);

//     var values = formUpdateProfileKey.currentState!.value;
//     String nom = values['noms'].toString().split(" ").first;
//     String prenoms = values['noms'].toString().replaceFirst(nom, '').trim();
//     print("updProfile123// - user names implemented  !!!");
//     // casser le nom et prenoms
//     Utilisateur user = Utilisateur();
//     // read user data
//     user = prefs.readUserData();
//     user.nom = nom;
//     user.prenoms = prenoms;
//     user.contact = values['contact'];
//     // preparer le file
//     print("updProfile123// - içmage path ${currentImage.value.path}  !!!");
//     File item = File(currentImage.value.path);

//     print("updProfile123// - send object ${user.toJson()}  !!!");
//     dynamic response = await utilisateurService.updateProfile(user, item);
//     int statusCode = response.statusCode;
//     print("result :: ${response.data} | ${response.statusCode} ");
//     issubmitLoading(false);
//     if (statusCode == 200) {
//       // save user data
//       await prefs.saveUserData(Utilisateur.fromJson(jsonEncode(response.data)));
//       currentUser(prefs.readUserData());
//     }
//   }
// }
