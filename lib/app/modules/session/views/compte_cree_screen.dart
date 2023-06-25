// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:mobile/app/routes/app_pages.dart';
// import 'package:mobile/app/utils/theme/Constant.dart';
// import 'package:mobile/app/utils/theme/app_global_style.dart';
// import 'package:mobile/app/utils/theme/app_text_style.dart';
// import 'package:mobile/app/widgets/back_button_widget.dart';

// class CompteCreeScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: SafeArea(
//             child: SingleChildScrollView(
//       child: SizedBox(
//         height: Get.height * 0.9,
//         width: Get.width,
//         child: Column(
//           children: [
//             SizedBox(height: Get.height * 0.1),
//             SizedBox(
//               width: 180,
//               height: 180,
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(8.0),
//                 child: ColorFiltered(
//                   child: Image.asset(
//                     "assets/img/logo-with-bg.png",
//                   ),
//                   colorFilter: ColorFilter.mode(Colors.white, BlendMode.dst),
//                 ),
//               ),
//             ),
//             const SizedBox(
//               height: 10,
//             ),

//             ///Page Title
//             Text("Compte crée ",
//                 textAlign: TextAlign.center, style: TextCss.hStyle(Cst.k3xl)),

//             const SizedBox(
//               height: 10,
//             ),

//             Expanded(
//               child: Container(),
//             ),
//             BlackbuttonWidget(
//                 text: "Terminer",
//                 onTap: () {
//                   // controller.submit();
//                   Get.offAllNamed(Routes.HOME);
//                 }),

//             const SizedBox(
//               height: 60,
//             ),
//           ],
//         ),
//       ),
//     )));
//   }
// }
