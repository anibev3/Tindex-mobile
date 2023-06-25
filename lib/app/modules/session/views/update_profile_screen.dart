// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:flutter_form_builder/flutter_form_builder.dart';
// import 'package:get/get.dart';
// import 'package:mobile/app/modules/session/controller/update_profile_controller.dart';
// import 'package:mobile/app/utils/helpers/image.helper.dart';
// import 'package:mobile/app/utils/theme/Constant.dart';
// import 'package:mobile/app/utils/theme/app_form_style.dart';
// import 'package:mobile/app/utils/theme/app_global_style.dart';
// import 'package:mobile/app/utils/theme/app_text_style.dart';
// import 'package:mobile/app/widgets/back_button_widget.dart';
// import 'package:unicons/unicons.dart';

// class UpdateProfileScreen extends StatelessWidget {
//   UpdateProfileController controller = Get.put(UpdateProfileController());
//   UpdateProfileScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//             onPressed: () {
//               Get.back();
//             },
//             icon: const Icon(
//               UniconsLine.arrow_left,
//               color: Colors.black,
//             )),
//         title: Text(
//           "Modifier le profile",
//           style: TextCss.dyncoloredBoldStyle(Colors.black, Cst.kxl),
//         ),
//         elevation: 1,
//         backgroundColor: Colors.white,
//       ),
//       body: SafeArea(
//           child: ListView(
//         padding: const EdgeInsets.symmetric(horizontal: Cst.k3xl),
//         children: [
//           const SizedBox(height: 20),
//           FormBuilder(
//               key: controller.formUpdateProfileKey,
//               child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     //  ---------------- AVATar --------------------------------

//                     Align(
//                         alignment: Alignment.center,
//                         child: Obx(() => Visibility(
//                               visible: controller.hasimage.value,
//                               replacement: Container(
//                                 width: 130,
//                                 height: 130,
//                                 decoration: GlobalCss.containerStyle(
//                                     Colors.grey.shade700,
//                                     rad: Cst.kMaxRaduis * 100),
//                                 child: const Icon(UniconsLine.image_plus,
//                                     size: 30, color: Colors.white),
//                               ),
//                               child: controller.hasHttpimage.value
//                                   ? Container(
//                                       width: 130,
//                                       height: 130,
//                                       decoration: BoxDecoration(
//                                         borderRadius: const BorderRadius.all(
//                                             Radius.circular(
//                                                 Cst.kMaxRaduis * 100)),
//                                         image: DecorationImage(
//                                           image: NetworkImage(
//                                               ImgeHelper.imgPath(controller
//                                                   .currentUser.value.avatar)),
//                                           fit: BoxFit.cover,
//                                         ),
//                                       ),
//                                     )
//                                   : Container(
//                                       width: 130,
//                                       height: 130,
//                                       decoration: BoxDecoration(
//                                         borderRadius: const BorderRadius.all(
//                                             Radius.circular(
//                                                 Cst.kMaxRaduis * 100)),
//                                         image: DecorationImage(
//                                           image: FileImage(File(controller
//                                               .currentImage.value.path)),
//                                           fit: BoxFit.cover,
//                                         ),
//                                       ),
//                                     ),
//                             ))),

//                     Align(
//                       alignment: Alignment.center,
//                       child: TextButton(
//                         onPressed: () {
//                           controller.addImages();
//                         },
//                         child: Text.rich(
//                           TextSpan(
//                             children: [
//                               TextSpan(
//                                   text: "Modifier l'avatar",
//                                   style: TextCss.dyncoloredSBoldStyle(
//                                       Colors.black, Cst.kbase)),
//                               WidgetSpan(
//                                   child: Padding(
//                                 padding: const EdgeInsets.only(left: 4),
//                                 child: Icon(
//                                   UniconsLine.pen,
//                                   color: Colors.black,
//                                   size: 15,
//                                 ),
//                               )),
//                             ],
//                           ),
//                           textAlign: TextAlign.center,
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 15),
//                     //  ------------------------------ nom & prenom ------------------------------
//                     Text("Nom complet",
//                         style: TextCss.dyncoloredBoldStyle(
//                             Colors.black, Cst.kbase)),
//                     SizedBox(height: 10),

//                     ///Textfield Noms prenoms
//                     FormBuilderTextField(
//                       style: TextCss.normalStyle,
//                       name: 'noms',
//                       validator: (value) {
//                         if (value == null) return "Le nom est obligatoire";
//                       },
//                       decoration:
//                           FormCss.defaultInputStyle(" ", "Entrer votre nom"),
//                     ),

//                     //  ------------------------------ contact ------------------------------
//                     SizedBox(height: 22),
//                     // Text("Contact",
//                     //     style: TextCss.dyncoloredBoldStyle(
//                     //         Colors.black, Cst.kbase)),
//                     // SizedBox(height: 10),

//                     // ///Textfield Noms prenoms
//                     // Row(
//                     //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     //   crossAxisAlignment: CrossAxisAlignment.start,
//                     //   mainAxisSize: MainAxisSize.max,
//                     //   children: [
//                     //     Container(
//                     //       width: Get.width * 0.18,
//                     //       height: 46,
//                     //       decoration: GlobalCss.containerStyleWithoutShadow(
//                     //           Colors.grey.shade50,
//                     //           rad: Cst.kDefaultRaduis,
//                     //           border: Border.all(
//                     //               color: Colors.blueGrey.shade100, width: 2)),
//                     //       child: Center(
//                     //         child: Text("+ 225",
//                     //             style: TextCss.dyncoloredBoldStyle(
//                     //                 Colors.black, Cst.kbase)),
//                     //       ),
//                     //     ),
//                     //     Container(
//                     //       width: Get.width * 0.7,
//                     //       child: FormBuilderTextField(
//                     //         style: TextCss.normalStyle,
//                     //         name: 'contact',
//                     //         validator: (value) {
//                     //           if (value == null)
//                     //             return "Le contact est obligatoire";
//                     //           if (!value.isNumericOnly)
//                     //             return "Le contact est incorrect";
//                     //         },
//                     //         decoration: FormCss.defaultInputStyle(
//                     //             " ", "Entrer votre numero"),
//                     //       ),
//                     //     ),
//                     //   ],
//                     // ),
//                   ])),
//           SizedBox(height: 15),
//           Container(
//             padding: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
//             width: Get.width,
//             child: Obx(() => BlackbuttonWidget(
//                 isloading: controller.issubmitLoading.value,
//                 text: "Mettre à jour",
//                 onTap: () {
//                   print("updProfile123// - button pressed !!!");
//                   controller.submit();
//                 })),
//           ),
//         ],
//       )),
//     );
//   }
// }
