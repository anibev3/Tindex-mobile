// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import 'package:getwidget/getwidget.dart';
// import 'package:tindex_mobile/app/data/models/residence.model.dart';
// import 'package:tindex_mobile/app/data/services/preference_service.dart';
// import 'package:tindex_mobile/app/routes/app_pages.dart';
// import 'package:tindex_mobile/app/utils/helpers/image.helper.dart';
// import 'package:tindex_mobile/app/utils/helpers/text.helper.dart';
// import 'package:tindex_mobile/app/utils/theme/app_button_style.dart';
// import 'package:loading_animation_widget/loading_animation_widget.dart';
// import 'package:tindex_mobile/app/utils/theme/Constant.dart';
// import 'package:tindex_mobile/app/utils/theme/app_global_style.dart';
// import 'package:tindex_mobile/app/utils/theme/app_text_style.dart';
// import 'package:unicons/unicons.dart';

// class HomeFavBoxWidget extends StatelessWidget {
//   final Residence residence;

//   HomeFavBoxWidget({super.key, required this.residence});

//   PreferencesService controller = Get.find<PreferencesService>();

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: (() {
//         Get.toNamed(Routes.DETAILRESIDENCE, arguments: residence.id);
//       }),
//       child: Container(
//           constraints: const BoxConstraints(maxHeight: 130, maxWidth: 150),
//           child: Stack(
//             children: [
//               Container(
//                 // constraints: BoxConstraints(minHeight: 180, minWidth: 100),
//                 decoration: BoxDecoration(
//                   borderRadius: const BorderRadius.all(
//                       Radius.circular(Cst.kDefaultRaduis)),
//                   image: DecorationImage(
//                       colorFilter: ColorFilter.mode(
//                           Colors.black.withOpacity(0.3), BlendMode.srcATop),
//                       image: NetworkImage(
//                           ImgeHelper.imgPath(residence.getFirstImage())),
//                       fit: BoxFit.cover),
//                 ),
//               ),
//               //  Prix
//               Positioned(
//                   right: 5,
//                   top: 5,
//                   child: Container(
//                     decoration: GlobalCss.containerStyle(Colors.white,
//                         rad: Cst.kDefaultRaduis),
//                     padding: const EdgeInsets.all(5),
//                     child: Text(
//                       TextHelper.formatPrice(residence.residencehonoraire),
//                       style: TextCss.dyncoloredBoldStyle(
//                           Colors.orange.shade700, Cst.kbase),
//                     ),
//                   )),

//               Positioned(
//                   left: 5,
//                   bottom: 5,
//                   child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Container(
//                           constraints: BoxConstraints(maxWidth: 140),
//                           child: Text(
//                               TextHelper.trunc(residence.residencelibelle),
//                               style: TextCss.dyncoloredBoldStyle(
//                                   Colors.white, Cst.kbase)),
//                         ),
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
//                                       color: Colors.white,
//                                       size: 15,
//                                     ),
//                                   )),
//                                   TextSpan(
//                                       text:
//                                           '${residence.residenceagrements?.douche}',
//                                       style: TextCss.dyncoloredSBoldStyle(
//                                           Colors.white, Cst.klg)),
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
//                                       color: Colors.white,
//                                       size: 15,
//                                     ),
//                                   )),
//                                   TextSpan(
//                                       text:
//                                           '${residence.residenceagrements?.chambre}',
//                                       style: TextCss.dyncoloredSBoldStyle(
//                                           Colors.white, Cst.ksm * 1.1)),
//                                 ],
//                               ),
//                               textAlign: TextAlign.center,
//                             ),
//                           ],
//                         )
//                       ])),
//             ],
//           )),
//     );
//   }
// }
