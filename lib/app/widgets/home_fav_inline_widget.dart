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
// import 'package:unicons/unicons.dart';

// class InlineFavCardWidget extends StatelessWidget {
//   final Residence residence;

//   InlineFavCardWidget({super.key, required this.residence});

//   PreferencesService controller = Get.find<PreferencesService>();

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//         onTap: (() {
//           Get.toNamed(Routes.DETAILRESIDENCE, arguments: residence.id);
//         }),
//         child: Container(
//             constraints: BoxConstraints(maxHeight: 200),
//             decoration:
//                 GlobalCss.containerStyle(Colors.white, rad: Cst.kBorderRaduis),
//             child: Row(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Container(
//                     width: Get.width * 0.3,
//                     height: 125,
//                     decoration: BoxDecoration(
//                       borderRadius: const BorderRadius.horizontal(
//                           left: Radius.circular(Cst.kBorderRaduis)),
//                       image: DecorationImage(
//                           colorFilter: ColorFilter.mode(
//                               Colors.black.withOpacity(0.2), BlendMode.srcATop),
//                           image: NetworkImage(
//                               ImgeHelper.imgPath(residence.getFirstImage())),
//                           fit: BoxFit.cover),
//                     ),
//                     child: Stack(
//                       children: [
//                         Positioned(
//                             left: 5,
//                             bottom: 5,
//                             child: Container(
//                               constraints:
//                                   BoxConstraints(maxWidth: Get.width * 0.28),
//                               decoration: GlobalCss.containerStyle(
//                                   Colors.transparent,
//                                   rad: Cst.kDefaultRaduis),
//                               padding: const EdgeInsets.all(5),
//                               child: Text(
//                                 TextHelper.formatPrice(
//                                     residence.residencehonoraire),
//                                 style: TextCss.dyncoloredBoldStyle(
//                                     Colors.white, Cst.kbase),
//                               ),
//                             )),
//                         Positioned(
//                             left: 5,
//                             top: 5,
//                             child: GestureDetector(
//                                 onTap: () {
//                                   controller.toggleFavorite(residence.id!);
//                                 },
//                                 child: Obx(
//                                   () => controller.isFavorite(residence.id!)
//                                       ? Container(
//                                           decoration: GlobalCss.containerStyle(
//                                               Colors.orangeAccent.shade700,
//                                               rad: Cst.kMaxRaduis),
//                                           padding: const EdgeInsets.all(5),
//                                           child: const Icon(UniconsLine.heart,
//                                               size: 18, color: Colors.white),
//                                         )
//                                       : Container(
//                                           decoration: GlobalCss.containerStyle(
//                                               Colors.white,
//                                               rad: Cst.kMaxRaduis),
//                                           padding: const EdgeInsets.all(5),
//                                           child: Icon(UniconsLine.heart,
//                                               size: 18,
//                                               color: Colors.grey.shade700),
//                                         ),
//                                 ))),
//                       ],
//                     )),
//                 SizedBox(width: 10),
//                 Expanded(
//                   child: Container(
//                     padding: EdgeInsets.only(right: 9),
//                     height: 125,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         SizedBox(height: 5),
//                         Text("${residence.getResidenceType()} ",
//                             style: TextCss.dyncoloredBoldStyle(
//                                 Cst.kPrimaryColor, Cst.ksm * 1.1)),
//                         SizedBox(
//                           child: Text(
//                               TextHelper.trunc(residence.residencelibelle,
//                                   max: 50),
//                               style: TextCss.dyncoloredBoldStyle(
//                                   Colors.black, Cst.kbase * 1.1)),
//                         ),
//                         SizedBox(height: 5),
//                         Row(
//                           children: [
//                             Text.rich(
//                               TextSpan(
//                                 children: [
//                                   WidgetSpan(
//                                       child: Padding(
//                                     padding: EdgeInsets.only(right: 4),
//                                     child: Icon(
//                                       UniconsLine.bath,
//                                       color: Colors.grey.shade500,
//                                       size: 15,
//                                     ),
//                                   )),
//                                   TextSpan(
//                                       text:
//                                           '${residence.residenceagrements?.douche}',
//                                       style: TextCss.dyncoloredSBoldStyle(
//                                           Colors.grey.shade500, Cst.klg)),
//                                 ],
//                               ),
//                               textAlign: TextAlign.center,
//                             ),
//                             SizedBox(width: 10),
//                             Text.rich(
//                               TextSpan(
//                                 children: [
//                                   WidgetSpan(
//                                       child: Padding(
//                                     padding: EdgeInsets.only(right: 4),
//                                     child: Icon(
//                                       UniconsLine.bed_double,
//                                       color: Colors.grey.shade500,
//                                       size: 15,
//                                     ),
//                                   )),
//                                   TextSpan(
//                                       text:
//                                           '${residence.residenceagrements?.chambre}',
//                                       style: TextCss.dyncoloredSBoldStyle(
//                                           Colors.grey.shade500, Cst.klg)),
//                                 ],
//                               ),
//                               textAlign: TextAlign.center,
//                             ),
//                             Spacer(),
//                             Text.rich(
//                               TextSpan(
//                                 children: [
//                                   WidgetSpan(
//                                       child: Padding(
//                                     padding: EdgeInsets.only(right: 4),
//                                     child: Icon(
//                                       UniconsSolid.star,
//                                       color: Colors.orange.shade400,
//                                       size: 18,
//                                     ),
//                                   )),
//                                   TextSpan(
//                                       text: '${residence.noteGlobale}',
//                                       style: TextCss.dyncoloredSBoldStyle(
//                                           Colors.orange.shade400, Cst.klg)),
//                                 ],
//                               ),
//                               textAlign: TextAlign.center,
//                             ),
//                           ],
//                         ),
//                         Spacer(),
//                         Text.rich(
//                           TextSpan(
//                             children: [
//                               WidgetSpan(
//                                   child: Padding(
//                                 padding: EdgeInsets.only(right: 4),
//                                 child: Icon(
//                                   UniconsLine.map_marker,
//                                   color: Colors.grey.shade400,
//                                   size: 15,
//                                 ),
//                               )),
//                               TextSpan(
//                                   text: residence.getLocation(),
//                                   style: TextCss.dyncoloredSBoldStyle(
//                                       Colors.grey.shade400, Cst.kbase)),
//                             ],
//                           ),
//                           textAlign: TextAlign.left,
//                         ),
//                         SizedBox(height: 5)
//                       ],
//                     ),
//                   ),
//                 )
//               ],
//             )));
//   }
// }
