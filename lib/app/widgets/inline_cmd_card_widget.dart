// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import 'package:getwidget/getwidget.dart';
// import 'package:tindex_mobile/app/data/models/demande.model.dart';
// import 'package:tindex_mobile/app/data/models/residence.model.dart';
// import 'package:tindex_mobile/app/data/page_models/reservation_page_model.dart';
// import 'package:tindex_mobile/app/data/services/preference_service.dart';
// import 'package:tindex_mobile/app/data/services/residence.service.dart';
// import 'package:tindex_mobile/app/modules/reservation/controller/mes_reservation_controller.dart';
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
// import 'package:unicons/unicons.dart';

// const String urlImage = "http://landmarkhunter.com/photos/62/47/624776-L.jpg";

// class InlineCmdCardWidget extends StatelessWidget {
//   final Demande demande;
//   MesReservationController controller = Get.find();

//   InlineCmdCardWidget({super.key, required this.demande});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         padding: EdgeInsets.symmetric(vertical: 0),
//         decoration:
//             GlobalCss.containerStyle(Colors.white, rad: Cst.kBorderRaduis),
//         constraints: BoxConstraints(minHeight: 130),
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Container(
//                 width: Get.width * 0.3,
//                 height: 130,
//                 decoration: BoxDecoration(
//                   borderRadius: const BorderRadius.horizontal(
//                       left: Radius.circular(Cst.kBorderRaduis)),
//                   image: DecorationImage(
//                       colorFilter: ColorFilter.mode(
//                           Colors.black.withOpacity(0.2), BlendMode.srcATop),
//                       image: NetworkImage(ImgeHelper.imgPath(
//                           demande.getResidence()?.getFirstImage())),
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
//                                 demande.getResidence()!.residencehonoraire),
//                             style: TextCss.dyncoloredBoldStyle(
//                                 Colors.white, Cst.kbase),
//                           ),
//                         )),
//                     Positioned(
//                         left: 5,
//                         top: 5,
//                         child: Container(
//                             constraints:
//                                 BoxConstraints(maxWidth: Get.width * 0.28),
//                             decoration: GlobalCss.containerStyle(Colors.white,
//                                 rad: Cst.kDefaultRaduis),
//                             padding: const EdgeInsets.all(5),
//                             child: Text.rich(
//                               TextSpan(
//                                 children: [
//                                   WidgetSpan(
//                                       child: Padding(
//                                     padding: EdgeInsets.only(right: 4),
//                                     child: Icon(
//                                       UniconsSolid.star,
//                                       color: Colors.orange.shade600,
//                                       size: 12,
//                                     ),
//                                   )),
//                                   TextSpan(
//                                       text:
//                                           '${demande.getResidence()!.noteGlobale}',
//                                       style: TextCss.dyncoloredSBoldStyle(
//                                           Colors.orange.shade600, Cst.ksm)),
//                                 ],
//                               ),
//                               textAlign: TextAlign.center,
//                             ))),
//                   ],
//                 )),
//             SizedBox(width: 10),
//             SizedBox(
//               height: 130,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   SizedBox(height: 5),
//                   Text(
//                       "${demande.duree} Jour${(demande.duree! > 0) ? "s" : ""} ",
//                       style: TextCss.dyncoloredBoldStyle(
//                           Cst.kPrimaryColor, Cst.ksm * 1.1)),
//                   SizedBox(
//                     width: Get.width * 0.55,
//                     child: Text(
//                         TextHelper.trunc(
//                             demande.getResidence() == null
//                                 ? ""
//                                 : demande.getResidence()!.residencelibelle,
//                             max: 50),
//                         style: TextCss.dyncoloredBoldStyle(
//                             Colors.black, Cst.kbase * 1.1)),
//                   ),
//                   TextHelper.getTextIcon(
//                       UniconsSolid.star, '${demande.statut} ',
//                       color: Colors.blue.shade800,
//                       size: Cst.ksm * 1.1,
//                       iconSize: 12),
//                   Spacer(),
//                   SizedBox(
//                       height: 48,
//                       width: (Get.width * 0.622),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         children: [
//                           Visibility(
//                             visible: true,
//                             child: ElevatedButton(
//                                 style: ButtonCss.defaultSquaredButtonStyle(
//                                     Colors.black),
//                                 onPressed: () {
//                                   Get.toNamed(Routes.DETAILRESIDENCE,
//                                       arguments: demande.getResidence()!.id);
//                                 },
//                                 child: Column(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     const Icon(
//                                       UniconsLine.eye,
//                                       size: 19,
//                                     ),
//                                     Text(
//                                       'Détails',
//                                       style: TextCss.dyncoloredNormalStyle(
//                                           Colors.white, Cst.ksm),
//                                     )
//                                   ],
//                                 )),
//                           ),
//                           Visibility(
//                             visible: demande.statut == "validé",
//                             child: ElevatedButton(
//                                 style: ButtonCss.defaultSquaredButtonStyle(
//                                     Colors.lightBlue),
//                                 onPressed: () {},
//                                 child: Column(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     const Icon(
//                                       UniconsLine.outgoing_call,
//                                       size: 18,
//                                     ),
//                                     Text('Contacter',
//                                         style: TextCss.dyncoloredNormalStyle(
//                                             Colors.white, Cst.ksm))
//                                   ],
//                                 )),
//                           ),
//                           Visibility(
//                             visible: demande.statut == "en attente",
//                             replacement: ElevatedButton(
//                                 style: ButtonCss.defaultSquaredButtonStyle(
//                                     Colors.indigo.shade700),
//                                 onPressed: () {
//                                   Get.toNamed(Routes.NEWNOTE,
//                                       arguments: ReservationPageModel(
//                                           residenceID:
//                                               demande.getResidence()?.id));
//                                 },
//                                 child: Column(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     const Icon(
//                                       UniconsLine.comment_alt_lines,
//                                       size: 18,
//                                     ),
//                                     Text('Noter',
//                                         style: TextCss.dyncoloredNormalStyle(
//                                             Colors.white, Cst.ksm))
//                                   ],
//                                 )),
//                             child: ElevatedButton(
//                                 style: ButtonCss.defaultSquaredButtonStyle(
//                                     Colors.red),
//                                 onPressed: () {
//                                   controller.cancelReservation(demande.id!);
//                                 },
//                                 child: Column(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     const Icon(
//                                       UniconsLine.times_circle,
//                                       size: 18,
//                                     ),
//                                     Text('Annuler',
//                                         style: TextCss.dyncoloredNormalStyle(
//                                             Colors.white, Cst.ksm))
//                                   ],
//                                 )),
//                           )
//                         ],
//                       ))
//                 ],
//               ),
//             )
//           ],
//         ));
//   }
// }
