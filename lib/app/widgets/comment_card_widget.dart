// import 'package:flutter/material.dart';
// import 'package:getwidget/getwidget.dart';
// import 'package:tindex_mobile/app/utils/helpers/image.helper.dart';
// import 'package:tindex_mobile/app/utils/helpers/text.helper.dart';
// import 'package:tindex_mobile/app/utils/theme/app_button_style.dart';
// import 'package:unicons/unicons.dart';
// import 'package:loading_animation_widget/loading_animation_widget.dart';
// import 'package:tindex_mobile/app/utils/theme/Constant.dart';
// import 'package:tindex_mobile/app/utils/theme/app_global_style.dart';
// import 'package:tindex_mobile/app/utils/theme/app_text_style.dart';

// const imgPro =
//     "https://i.pinimg.com/originals/40/ea/19/40ea19b3d87c276b5a6bd57b3b7c9296.jpg";

// class CommentCardWidget extends StatelessWidget {
//   final String auteur;
//   final String date;
//   final String? comment;
//   final String? avatar;
//   const CommentCardWidget({
//     Key? key,
//     required this.auteur,
//     required this.date,
//     required this.comment,
//     this.avatar,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         margin: EdgeInsets.only(right: 10),
//         decoration: GlobalCss.containerStyle(Colors.white,
//             rad: Cst.kDefaultRaduis,
//             border: Border.all(color: Colors.grey.shade400)),
//         constraints: const BoxConstraints(maxHeight: 100, maxWidth: 250),
//         child: Column(
//           children: [
//             ListTile(
//               dense: true,
//               leading: GFAvatar(
//                 size: 22,
//                 backgroundImage: avatar == null
//                     ? NetworkImage(imgPro)
//                     : NetworkImage(ImgeHelper.imgPath(avatar)),
//               ),
//               title: Text(auteur,
//                   style: TextCss.dyncoloredBoldStyle(Colors.black, Cst.klg)),
//               subtitle: Text("$date"),
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: Cst.kbase),
//               child: Container(
//                 width: 200,
//                 // color: Colors.red,
//                 child: Text(
//                   TextHelper.trunc(comment, max: 60),
//                   textAlign: TextAlign.left,
//                   style: TextCss.dyncoloredNormalStyle(Colors.black, Cst.kbase),
//                 ),
//               ),
//             )
//           ],
//         ));
//   }
// }
