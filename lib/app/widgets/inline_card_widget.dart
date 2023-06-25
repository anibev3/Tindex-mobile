// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import 'package:getwidget/getwidget.dart';
// import 'package:tindex_mobile/app/data/models/residence.model.dart';
// import 'package:tindex_mobile/app/data/services/preference_service.dart';
// import 'package:tindex_mobile/app/data/services/residence.service.dart';
// import 'package:tindex_mobile/app/modules/residence/controller/mes_residences_controller.dart';
// import 'package:tindex_mobile/app/routes/app_pages.dart';
// import 'package:tindex_mobile/app/utils/helpers/image.helper.dart';
// import 'package:tindex_mobile/app/utils/helpers/session.helper.dart';
// import 'package:tindex_mobile/app/utils/helpers/text.helper.dart';
// import 'package:tindex_mobile/app/utils/theme/app_button_style.dart';
// import 'package:unicons/unicons.dart';
// import 'package:loading_animation_widget/loading_animation_widget.dart';
// import 'package:tindex_mobile/app/utils/theme/Constant.dart';
// import 'package:tindex_mobile/app/utils/theme/app_global_style.dart';
// import 'package:tindex_mobile/app/utils/theme/app_text_style.dart';

// const String urlImage = "http://landmarkhunter.com/photos/62/47/624776-L.jpg";

// class InlineCardWidget extends StatelessWidget {
//   final Residence residence;
//   final bool isOwner;

//   // InlineCardController controller = Get.put(InlineCardController());

//   InlineCardWidget({super.key, required this.residence, this.isOwner = false});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         padding: EdgeInsets.symmetric(horizontal: Cst.kxl, vertical: Cst.kbase),
//         decoration:
//             GlobalCss.containerStyle(Colors.white, rad: Cst.kDefaultRaduis),
//         constraints: BoxConstraints(minHeight: 125),
//         child: Row(
//           children: [
//             Container(
//               width: Get.width * 0.27,
//               height: 90,
//               // constraints: BoxConstraints(minHeight: 180, minWidth: 100),
//               decoration: BoxDecoration(
//                 borderRadius:
//                     const BorderRadius.all(Radius.circular(Cst.kBorderRaduis)),
//                 image: DecorationImage(
//                     colorFilter: ColorFilter.mode(
//                         Colors.blueGrey.withOpacity(0.2), BlendMode.srcATop),
//                     image: NetworkImage(
//                         ImgeHelper.imgPath(residence.getFirstImage())),
//                     fit: BoxFit.cover),
//               ),
//             ),
//             SizedBox(width: 15),
//             Container(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(residence.getResidenceType(),
//                       style: TextCss.dyncoloredBoldStyle(
//                           Colors.grey.shade500, Cst.kbase)),
//                   SizedBox(
//                     width: Get.width * 0.5,
//                     child: Text(TextHelper.trunc(residence.residencelibelle),
//                         style:
//                             TextCss.dyncoloredBoldStyle(Colors.black, Cst.kxl)),
//                   ),
//                   SizedBox(height: 20),
//                   SizedBox(
//                     height: 30,
//                     width: Get.width * 0.53,
//                     child: Row(
//                       children: [
//                         TextHelper.getTextIcon(
//                             UniconsSolid.star, '${residence.noteGlobale} (598)',
//                             color: Colors.grey.shade800,
//                             size: Cst.ksm,
//                             iconSize: 14),
//                         Expanded(child: Container()),
//                         isOwner
//                             ? ElevatedButton(
//                                 style: ButtonCss.dyndefaultIconButtonStyle(
//                                     Colors.blue.shade900,
//                                     raduis: Cst.kBorderRaduis,
//                                     height: 30,
//                                     width: 40),
//                                 onPressed: () {
//                                   controller.editResidence(residence.id!);
//                                 },
//                                 child: const Icon(
//                                   UniconsLine.pen,
//                                   size: Cst.kxl,
//                                 ))
//                             : Container(),
//                         isOwner
//                             ? ElevatedButton(
//                                 style: ButtonCss.dyndefaultIconButtonStyle(
//                                     Colors.orange.shade600,
//                                     raduis: Cst.kBorderRaduis,
//                                     height: 30,
//                                     width: 40),
//                                 onPressed: () {
//                                   controller
//                                       .desactivateResidence(residence.id!);
//                                 },
//                                 child: const Icon(
//                                   UniconsLine.times_circle,
//                                   size: Cst.kxl,
//                                 ))
//                             : Container(),
//                         isOwner
//                             ? ElevatedButton(
//                                 style: ButtonCss.dyndefaultIconButtonStyle(
//                                     Colors.red.shade600,
//                                     raduis: Cst.kBorderRaduis,
//                                     height: 30,
//                                     width: 40),
//                                 onPressed: () {
//                                   controller.supprimerResidence(residence.id!);
//                                 },
//                                 child: const Icon(
//                                   UniconsLine.trash,
//                                   size: Cst.kxl,
//                                 ))
//                             : Container()
//                       ],
//                     ),
//                   )
//                 ],
//               ),
//             )
//           ],
//         ));
//   }
// }

// // class InlineCardController extends GetxController {
// //   //  --------------------------- SERVICES DEFINITION
// //   ResidenceService residenceService = ResidenceService();
// //   SessionManager prefs = SessionManager();
// //   //  ----------------------------------------------------------------
// //   //  )----------  controllers

// //   MesResidencesController resiController = Get.put(MesResidencesController());

// //   supprimerResidence(String residenceID) async {
// //     resiController.supprimerResidence(residenceID);
// //   }

// //   desactivateResidence(String residenceID) async {
// //     resiController.setactivateResidence(residenceID, false);
// //   }

// //   editResidence(String ResidenceID) async {
// //     Get.toNamed(Routes.CREATERESIDENCE,
// //         arguments: {"update": true, "id": ResidenceID});
// //   }
// // }
