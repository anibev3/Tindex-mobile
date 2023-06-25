// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:getwidget/getwidget.dart';

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

// const String urlImage = "http://landmarkhunter.com/photos/62/47/624776-L.jpg";

// class InlineDemandeCardWidget extends StatelessWidget {
//   final Demande demande;
//   MesDemandesController controller = Get.put(MesDemandesController());

//   InlineDemandeCardWidget({super.key, required this.demande});

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
//                 width: Get.width * 0.25,
//                 height: 160,
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
//                         right: 0,
//                         top: 5,
//                         child: Container(
//                           width: 8,
//                           height: 50,
//                           color: Colors.orange,
//                         )),
//                   ],
//                 )),
//             SizedBox(width: 10),
//             SizedBox(
//               height: 160,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   SizedBox(height: 5),
//                   SizedBox(
//                       width: Get.width * 0.65,
//                       child: Row(
//                         mainAxisSize: MainAxisSize.max,
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                     "${demande.duree} Jour${(demande.duree! > 0) ? "s" : ""} ",
//                                     style: TextCss.dyncoloredBoldStyle(
//                                         Colors.black, Cst.kxl)),
//                                 Text(
//                                     "${TextHelper.formatPrice(demande.getResidence()!.residencehonoraire)} / jour",
//                                     style: TextCss.dyncoloredBoldStyle(
//                                         Colors.grey.shade600, Cst.ksm)),
//                               ]),

//                           //  prix total
//                           Text(
//                               TextHelper.formatPrice(
//                                   demande.getResidence()!.residencehonoraire),
//                               style: TextCss.dyncoloredBoldStyle(
//                                   Colors.black, Cst.kxl))
//                         ],
//                       )),
//                   SizedBox(height: 10),
//                   TextHelper.getTextIcon(UniconsLine.plane_arrival,
//                       'Arrivée      ${DateHelper.byformat(demande.arrivee)} ',
//                       color: Colors.black, size: Cst.kbase, iconSize: 17),
//                   TextHelper.getTextIcon(UniconsLine.plane_fly,
//                       'Départ      ${DateHelper.byformat(demande.depart)} ',
//                       color: Colors.black, size: Cst.kbase, iconSize: 17),
//                   Spacer(),
//                   SizedBox(
//                       height: 48,
//                       width: Get.width * 0.65,
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           // infos user client
//                           Visibility(
//                             visible: demande.getClient() != null,
//                             child: Container(
//                               // color: Colors.green,
//                               constraints: BoxConstraints(maxWidth: 120),
//                               child: ListTile(
//                                 contentPadding:
//                                     EdgeInsets.symmetric(horizontal: 4.0),
//                                 horizontalTitleGap: 2,
//                                 dense: true,
//                                 leading: Visibility(
//                                   visible: demande.getClient() != null &&
//                                       (demande.getClient()?.avatar != "" &&
//                                           demande.getClient()?.avatar != null),
//                                   replacement: Container(
//                                     width: 30,
//                                     height: 30,
//                                     decoration: GlobalCss.containerStyle(
//                                         Colors.grey.shade700,
//                                         rad: Cst.kMaxRaduis * 100),
//                                     child: const Icon(UniconsLine.user,
//                                         size: 20, color: Colors.white),
//                                   ),
//                                   child: GFAvatar(
//                                     backgroundImage: NetworkImage(
//                                         ImgeHelper.imgPath(
//                                             demande.getClient()?.avatar)),
//                                   ),
//                                 ),
//                                 title: Text(
//                                     "${demande.getClient()?.nom} ${demande.getClient()?.prenoms}"),
//                               ),
//                             ),
//                           ),

//                           //  ---- ligne de bouttons ----
//                           Row(
//                             children: [
//                               Visibility(
//                                 visible: demande.statut == "en attente",
//                                 child: ElevatedButton(
//                                     style: ButtonCss.defaultSquaredButtonStyle(
//                                         Colors.green),
//                                     onPressed: () {
//                                       controller.confirmReservation(
//                                           demande, true);
//                                     },
//                                     child: Column(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.center,
//                                       children: [
//                                         const Icon(
//                                           UniconsLine.check,
//                                           size: 21,
//                                         ),
//                                         Text(
//                                           'Accepter',
//                                           style: TextCss.dyncoloredNormalStyle(
//                                               Colors.white, Cst.ksm),
//                                         )
//                                       ],
//                                     )),
//                               ),
//                               Visibility(
//                                 visible: demande.statut == "validé",
//                                 child: ElevatedButton(
//                                     style: ButtonCss.defaultSquaredButtonStyle(
//                                         Colors.blue),
//                                     onPressed: () {
//                                       controller.confirmReservation(
//                                           demande, true);
//                                     },
//                                     child: Column(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.center,
//                                       children: [
//                                         const Icon(
//                                           UniconsLine.outgoing_call,
//                                           size: 21,
//                                         ),
//                                         Text(
//                                           'Contacter',
//                                           style: TextCss.dyncoloredNormalStyle(
//                                               Colors.white, Cst.ksm),
//                                         )
//                                       ],
//                                     )),
//                               ),
//                               Visibility(
//                                 visible: demande.statut == "en attente",
//                                 child: ElevatedButton(
//                                     style: ButtonCss.defaultSquaredButtonStyle(
//                                         Colors.orange.shade600),
//                                     onPressed: () {
//                                       controller.confirmReservation(
//                                           demande, false);
//                                     },
//                                     child: Column(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.center,
//                                       children: [
//                                         const Icon(
//                                           UniconsLine.times,
//                                           size: 18,
//                                         ),
//                                         Text('Refuser',
//                                             style:
//                                                 TextCss.dyncoloredNormalStyle(
//                                                     Colors.white, Cst.ksm))
//                                       ],
//                                     )),
//                               ),
//                             ],
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
