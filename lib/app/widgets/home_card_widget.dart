// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import 'package:getwidget/getwidget.dart';
// import 'package:tindex_mobile/app/data/models/residence.model.dart';
// import 'package:tindex_mobile/app/data/services/preference_service.dart';
// import 'package:tindex_mobile/app/routes/app_pages.dart';
// import 'package:tindex_mobile/app/utils/helpers/image.helper.dart';
// import 'package:tindex_mobile/app/utils/helpers/text.helper.dart';
// import 'package:tindex_mobile/app/utils/theme/app_button_style.dart';
// import 'package:unicons/unicons.dart';
// import 'package:loading_animation_widget/loading_animation_widget.dart';
// import 'package:tindex_mobile/app/utils/theme/Constant.dart';
// import 'package:tindex_mobile/app/utils/theme/app_global_style.dart';
// import 'package:tindex_mobile/app/utils/theme/app_text_style.dart';
// import 'package:unicons/unicons.dart';

// class HomeCardWidget extends StatelessWidget {
//   final Residence residence;

//   HomeCardWidget({super.key, required this.residence});

//   PreferencesService controller = Get.find<PreferencesService>();

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: (() {
//         Get.toNamed(Routes.DETAILRESIDENCE, arguments: residence.id);
//       }),
//       child: Container(
//         // margin: EdgeInsets.all(10),
//         decoration:
//             GlobalCss.containerStyle(Colors.white, rad: Cst.kDefaultRaduis),
//         constraints: BoxConstraints(minHeight: 255),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // 1 - imapge du produit en bg
//             Hero(
//               tag: "produit-tag-ss-${residence.id}",
//               child: Stack(children: [
//                 Container(
//                   width: Get.width,
//                   height: 160,
//                   // constraints: BoxConstraints(minHeight: 180, minWidth: 100),
//                   decoration: BoxDecoration(
//                     borderRadius: const BorderRadius.vertical(
//                         top: Radius.circular(Cst.kDefaultRaduis)),
//                     image: DecorationImage(
//                         colorFilter: ColorFilter.mode(
//                             Colors.blueGrey.withOpacity(0.2),
//                             BlendMode.srcATop),
//                         image: NetworkImage(
//                             ImgeHelper.imgPath(residence.getFirstImage())),
//                         fit: BoxFit.cover),
//                   ),
//                 ),
//                 Positioned(
//                     right: 10,
//                     top: 8,
//                     child: GestureDetector(
//                         onTap: () {
//                           controller.toggleFavorite(residence.id!);
//                         },
//                         child: Obx(
//                           () => controller.isFavorite(residence.id!)
//                               ? Container(
//                                   decoration: GlobalCss.containerStyle(
//                                       Colors.orangeAccent.shade700,
//                                       rad: Cst.kMaxRaduis),
//                                   padding: const EdgeInsets.all(5),
//                                   child: const Icon(UniconsLine.heart,
//                                       size: 20, color: Colors.white),
//                                 )
//                               : Container(
//                                   decoration: GlobalCss.containerStyle(
//                                       Colors.white,
//                                       rad: Cst.kMaxRaduis),
//                                   padding: const EdgeInsets.all(5),
//                                   child: Icon(UniconsLine.heart,
//                                       size: 20, color: Colors.grey.shade700),
//                                 ),
//                         ))),
//               ]),
//             ),
//             // 2 - Prix + CAtegorie + Note
//             const SizedBox(height: 10),
//             Container(
//                 padding: const EdgeInsets.symmetric(horizontal: Cst.kxs),
//                 child: Row(
//                   children: [
//                     // 1 - prix en bleu
//                     Text(
//                       TextHelper.formatPrice(residence.residencehonoraire),
//                       style: TextCss.dyncoloredBoldStyle(
//                           Cst.kPrimaryColor, Cst.klg),
//                     ),
//                     const SizedBox(width: 3),
//                     Text("/ nuit"),
//                     const SizedBox(width: 10),
//                     Text(residence.getResidenceType()),
//                     Expanded(child: Container()),
//                     Text.rich(
//                       TextSpan(
//                         children: [
//                           WidgetSpan(
//                               child: Padding(
//                             padding: EdgeInsets.only(right: 4),
//                             child: Icon(
//                               UniconsSolid.star,
//                               color: Colors.orange.shade400,
//                               size: 18,
//                             ),
//                           )),
//                           TextSpan(
//                               text: '${residence.noteGlobale}',
//                               style: TextCss.dyncoloredSBoldStyle(
//                                   Colors.orange.shade400, Cst.klg)),
//                         ],
//                       ),
//                       textAlign: TextAlign.center,
//                     )
//                   ],
//                 )),
//             const SizedBox(height: 3),
//             // 3 - Nom du produit
//             Container(
//                 padding: const EdgeInsets.symmetric(horizontal: Cst.kxs),
//                 child: Row(
//                   children: [
//                     Container(
//                       constraints: BoxConstraints(maxWidth: Get.width * 0.6),
//                       child: Text(TextHelper.trunc(residence.residencelibelle),
//                           style: TextCss.dyncoloredBoldStyle(
//                               Colors.black, Cst.kxl)),
//                     ),
//                     Expanded(child: Container()),
//                     Text.rich(
//                       TextSpan(
//                         children: [
//                           WidgetSpan(
//                               child: Padding(
//                             padding: EdgeInsets.only(right: 4),
//                             child: Icon(
//                               UniconsLine.bath,
//                               color: Colors.grey.shade500,
//                               size: 15,
//                             ),
//                           )),
//                           TextSpan(
//                               text: '${residence.residenceagrements?.douche}',
//                               style: TextCss.dyncoloredSBoldStyle(
//                                   Colors.grey.shade500, Cst.klg)),
//                         ],
//                       ),
//                       textAlign: TextAlign.center,
//                     ),
//                     SizedBox(width: 10),
//                     Text.rich(
//                       TextSpan(
//                         children: [
//                           WidgetSpan(
//                               child: Padding(
//                             padding: EdgeInsets.only(right: 4),
//                             child: Icon(
//                               UniconsLine.bed_double,
//                               color: Colors.grey.shade500,
//                               size: 15,
//                             ),
//                           )),
//                           TextSpan(
//                               text: '${residence.residenceagrements?.chambre}',
//                               style: TextCss.dyncoloredSBoldStyle(
//                                   Colors.grey.shade500, Cst.klg)),
//                         ],
//                       ),
//                       textAlign: TextAlign.center,
//                     ),
//                   ],
//                 )),

//             // 4 - Location
//             const SizedBox(height: 4),
//             Container(
//               padding: const EdgeInsets.symmetric(horizontal: 4),
//               child: Text.rich(
//                 TextSpan(
//                   children: [
//                     WidgetSpan(
//                         child: Padding(
//                       padding: EdgeInsets.only(right: 4),
//                       child: Icon(
//                         UniconsLine.map_marker,
//                         color: Colors.grey.shade400,
//                         size: 15,
//                       ),
//                     )),
//                     TextSpan(
//                         text: residence.getLocation(),
//                         style: TextCss.dyncoloredSBoldStyle(
//                             Colors.grey.shade400, Cst.kbase)),
//                   ],
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//             ),
//             const SizedBox(height: 8),
//           ],
//         ),
//       ),
//     );
//   }
// }
