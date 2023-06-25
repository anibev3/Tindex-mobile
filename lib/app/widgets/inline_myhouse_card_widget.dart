// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:getwidget/getwidget.dart';
// import 'package:tindex_mobile/app/data/models/demande.model.dart';
// import 'package:tindex_mobile/app/data/models/residence.model.dart';
// import 'package:tindex_mobile/app/data/page_models/reservation_page_model.dart';
// import 'package:tindex_mobile/app/data/services/preference_service.dart';
// import 'package:tindex_mobile/app/data/services/residence.service.dart';
// import 'package:tindex_mobile/app/modules/reservation/controller/mes_demandes_controller.dart';
// import 'package:tindex_mobile/app/modules/reservation/controller/mes_reservation_controller.dart';
// import 'package:tindex_mobile/app/modules/residence/controller/mes_residences_controller.dart';
// import 'package:tindex_mobile/app/routes/app_pages.dart';
// import 'package:tindex_mobile/app/utils/helpers/date.helper.dart';
// import 'package:tindex_mobile/app/utils/helpers/image.helper.dart';
// import 'package:tindex_mobile/app/utils/helpers/session.helper.dart';
// import 'package:tindex_mobile/app/utils/helpers/text.helper.dart';
// import 'package:tindex_mobile/app/utils/theme/app_button_style.dart';
// import 'package:unicons/unicons.dart';
// import 'package:loading_animation_widget/loading_animation_widget.dart';
// import 'package:tindex_mobile/app/utils/theme/Constant.dart';
// import 'package:tindex_mobile/app/utils/theme/app_global_style.dart';
// import 'package:tindex_mobile/app/utils/theme/app_text_style.dart';
// import 'package:unicons/unicons.dart';
// import 'package:unicons/unicons.dart';

// import 'package:unicons/unicons.dart';

// const String urlImage = "http://landmarkhunter.com/photos/62/47/624776-L.jpg";

// class InlineMyHouseCardWidget extends StatelessWidget {
//   final Residence residence;
//   final bool isOwner;

//   InlineCardController controller = Get.put(InlineCardController());

//   InlineMyHouseCardWidget(
//       {super.key, required this.residence, this.isOwner = false});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         constraints: BoxConstraints(maxHeight: 200),
//         decoration:
//             GlobalCss.containerStyle(Colors.white, rad: Cst.kBorderRaduis),
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Container(
//                 width: Get.width * 0.3,
//                 height: 125,
//                 decoration: BoxDecoration(
//                   borderRadius: const BorderRadius.horizontal(
//                       left: Radius.circular(Cst.kBorderRaduis)),
//                   image: DecorationImage(
//                       colorFilter: ColorFilter.mode(
//                           Colors.black.withOpacity(0.2), BlendMode.srcATop),
//                       image: NetworkImage(
//                           ImgeHelper.imgPath(residence.getFirstImage())),
//                       fit: BoxFit.cover),
//                 ),
//                 child: Stack(
//                   children: [
//                     Positioned(
//                         left: 5,
//                         bottom: 5,
//                         child: Container(
//                           constraints:
//                               BoxConstraints(maxWidth: Get.width * 0.28),
//                           decoration: GlobalCss.containerStyle(
//                               Colors.transparent,
//                               rad: Cst.kDefaultRaduis),
//                           padding: const EdgeInsets.all(5),
//                           child: Text(
//                             TextHelper.formatPrice(
//                                 residence.residencehonoraire),
//                             style: TextCss.dyncoloredBoldStyle(
//                                 Colors.white, Cst.kbase),
//                           ),
//                         )),
//                   ],
//                 )),
//             SizedBox(width: 10),
//             Expanded(
//               child: Container(
//                 padding: EdgeInsets.only(right: 9),
//                 height: 125,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     SizedBox(height: 5),
//                     Text("${residence.getResidenceType()} ",
//                         style: TextCss.dyncoloredBoldStyle(
//                             Cst.kPrimaryColor, Cst.ksm * 1.1)),
//                     SizedBox(
//                       child: Text(
//                           TextHelper.trunc(residence.residencelibelle, max: 50),
//                           style: TextCss.dyncoloredBoldStyle(
//                               Colors.black, Cst.kbase * 1.1)),
//                     ),
//                     SizedBox(height: 5),
//                     Row(
//                       children: [
//                         Text.rich(
//                           TextSpan(
//                             children: [
//                               WidgetSpan(
//                                   child: Padding(
//                                 padding: EdgeInsets.only(right: 4),
//                                 child: Icon(
//                                   UniconsLine.bath,
//                                   color: Colors.grey.shade500,
//                                   size: 15,
//                                 ),
//                               )),
//                               TextSpan(
//                                   text:
//                                       '${residence.residenceagrements?.douche}',
//                                   style: TextCss.dyncoloredSBoldStyle(
//                                       Colors.grey.shade500, Cst.klg)),
//                             ],
//                           ),
//                           textAlign: TextAlign.center,
//                         ),
//                         SizedBox(width: 10),
//                         Text.rich(
//                           TextSpan(
//                             children: [
//                               WidgetSpan(
//                                   child: Padding(
//                                 padding: EdgeInsets.only(right: 4),
//                                 child: Icon(
//                                   UniconsLine.bed_double,
//                                   color: Colors.grey.shade500,
//                                   size: 15,
//                                 ),
//                               )),
//                               TextSpan(
//                                   text:
//                                       '${residence.residenceagrements?.chambre}',
//                                   style: TextCss.dyncoloredSBoldStyle(
//                                       Colors.grey.shade500, Cst.klg)),
//                             ],
//                           ),
//                           textAlign: TextAlign.center,
//                         ),
//                         Spacer(),
//                         Text.rich(
//                           TextSpan(
//                             children: [
//                               WidgetSpan(
//                                   child: Padding(
//                                 padding: EdgeInsets.only(right: 4),
//                                 child: Icon(
//                                   UniconsSolid.star,
//                                   color: Colors.orange.shade400,
//                                   size: 18,
//                                 ),
//                               )),
//                               TextSpan(
//                                   text: '${residence.noteGlobale}',
//                                   style: TextCss.dyncoloredSBoldStyle(
//                                       Colors.orange.shade400, Cst.klg)),
//                             ],
//                           ),
//                           textAlign: TextAlign.center,
//                         ),
//                       ],
//                     ),
//                     Spacer(),
//                     SizedBox(
//                         height: 50,
//                         child: ListView(
//                           scrollDirection: Axis.horizontal,
//                           children: [
//                             Visibility(
//                               visible: true,
//                               child: ElevatedButton(
//                                   style: ButtonCss.defaultSquaredButtonStyle(
//                                       Colors.black),
//                                   onPressed: () {
//                                     Get.toNamed(Routes.DETAILRESIDENCE,
//                                         arguments: residence.id);
//                                   },
//                                   child: Column(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       const Icon(
//                                         UniconsLine.eye,
//                                         size: 21,
//                                       ),
//                                       Text(
//                                         'Détails',
//                                         style: TextCss.dyncoloredNormalStyle(
//                                             Colors.white, Cst.ksm),
//                                       )
//                                     ],
//                                   )),
//                             ),
//                             Visibility(
//                               visible: true,
//                               child: ElevatedButton(
//                                   style: ButtonCss.defaultSquaredButtonStyle(
//                                       Colors.blue),
//                                   onPressed: () {
//                                     controller.editResidence(residence.id!);
//                                   },
//                                   child: Column(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       const Icon(
//                                         UniconsLine.pen,
//                                         size: 21,
//                                       ),
//                                       Text(
//                                         'Modifier',
//                                         style: TextCss.dyncoloredNormalStyle(
//                                             Colors.white, Cst.ksm),
//                                       )
//                                     ],
//                                   )),
//                             ),
//                             Visibility(
//                               visible:
//                                   residence.activated == true ? true : false,
//                               replacement: ElevatedButton(
//                                   style: ButtonCss.defaultSquaredButtonStyle(
//                                       Colors.green),
//                                   onPressed: () {
//                                     controller.activateResidence(residence.id!);
//                                   },
//                                   child: Column(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       const Icon(
//                                         UniconsLine.check,
//                                         size: 21,
//                                       ),
//                                       Text(
//                                         'Activer',
//                                         style: TextCss.dyncoloredNormalStyle(
//                                             Colors.white, Cst.ksm),
//                                       )
//                                     ],
//                                   )),
//                               child: ElevatedButton(
//                                   style: ButtonCss.defaultSquaredButtonStyle(
//                                       Colors.grey),
//                                   onPressed: () {
//                                     controller
//                                         .desactivateResidence(residence.id!);
//                                   },
//                                   child: Column(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       const Icon(
//                                         UniconsLine.archive,
//                                         size: 21,
//                                       ),
//                                       Text(
//                                         'Desactiver',
//                                         style: TextCss.dyncoloredNormalStyle(
//                                             Colors.white, Cst.ksm),
//                                       )
//                                     ],
//                                   )),
//                             ),
//                             Visibility(
//                               visible: true,
//                               child: ElevatedButton(
//                                   style: ButtonCss.defaultSquaredButtonStyle(
//                                       Colors.red.shade600),
//                                   onPressed: () {
//                                     controller
//                                         .supprimerResidence(residence.id!);
//                                   },
//                                   child: Column(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       const Icon(
//                                         UniconsLine.trash_alt,
//                                         size: 18,
//                                       ),
//                                       Text('Supprimer',
//                                           style: TextCss.dyncoloredNormalStyle(
//                                               Colors.white, Cst.ksm))
//                                     ],
//                                   )),
//                             ),
//                           ],
//                         ))
//                   ],
//                 ),
//               ),
//             )
//           ],
//         ));
//   }
// }

// class InlineCardController extends GetxController {
//   //  --------------------------- SERVICES DEFINITION
//   ResidenceService residenceService = ResidenceService();
//   SessionManager prefs = SessionManager();
//   //  ----------------------------------------------------------------
//   //  )----------  controllers

//   MesResidencesController resiController = Get.put(MesResidencesController());

//   supprimerResidence(String residenceID) async {
//     resiController.supprimerResidence(residenceID);
//   }

//   desactivateResidence(String residenceID) async {
//     resiController.setactivateResidence(residenceID, false);
//   }

//   activateResidence(String residenceID) async {
//     resiController.setactivateResidence(residenceID, true);
//   }

//   editResidence(String ResidenceID) async {
//     Get.toNamed(Routes.CREATERESIDENCE,
//         arguments: {"update": true, "id": ResidenceID});
//   }
// }
