import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tindex_mobile/app/modules/other/constants/color_constants.dart';
import 'package:tindex_mobile/app/modules/other/constants/global_constants.dart';
import 'package:tindex_mobile/app/modules/other/constants/utils.dart';
import 'package:tindex_mobile/app/modules/other/widgets/custom_button.dart';
import 'package:tindex_mobile/app/routes/app_pages.dart';

class WelcomeScreen extends StatelessWidget {
  static const String route = "/onboarding-screen";
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: value20),
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Center(
                  //   child: SizedBox(
                  //     width: isTablet ? screenWidth / 1.5 : screenWidth,
                  //     height: isTablet ? heightValue280 : heightValue275,
                  //     child: Stack(
                  //       children: [
                  //         Padding(
                  //           padding: EdgeInsets.symmetric(horizontal: value20),
                  //           child: Container(
                  //             height: heightValue275,
                  //             width: screenWidth,
                  //             decoration: BoxDecoration(
                  //               borderRadius: BorderRadius.circular(value45),
                  //               color: const Color(0xFF2248A9),
                  //             ),
                  //           ),
                  //         ),
                  //         Padding(
                  //           padding: EdgeInsets.symmetric(horizontal: value10),
                  //           child: Container(
                  //             height: heightValue260,
                  //             width: screenWidth,
                  //             decoration: BoxDecoration(
                  //                 borderRadius: BorderRadius.circular(value40),
                  //                 color: const Color(0xFFEBB850)),
                  //           ),
                  //         ),
                  //         Stack(
                  //           children: [
                  //             // Container(
                  //             //   height: heightValue240,
                  //             //   width: screenWidth,
                  //             //   decoration: BoxDecoration(
                  //             //     borderRadius: BorderRadius.circular(value30),
                  //             //     color: defaultAppColor,
                  //             //   ),
                  //             //   child: Image.asset(
                  //             //     "assets/img/1.png",
                  //             //   ),
                  //             // ),
                  //             SizedBox(
                  //               height: heightValue240,
                  //             ),
                  //             Align(
                  //               alignment: Alignment.topRight,
                  //               child: ClipRRect(
                  //                 borderRadius: BorderRadius.only(
                  //                   topRight: Radius.circular(
                  //                     heightValue30,
                  //                   ),
                  //                 ),
                  //                 child: CustomPaint(
                  //                   size: Size(
                  //                     heightValue180,
                  //                     (heightValue180 * 0.5567901611328125)
                  //                         .toDouble(),
                  //                   ),
                  //                   painter: CurvedContainerPath(isFirst: true),
                  //                 ),
                  //               ),
                  //             ),
                  //           ],
                  //         ),
                  //         Padding(
                  //           padding: EdgeInsets.only(top: heightValue100),
                  //           child: const Text("Send & request payments"),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),

                  SizedBox(
                    height: heightValue50,
                  ),
                  Text(
                    "Bienvenu sur Tindex",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: heightValue30,
                    ),
                  ),
                  SizedBox(
                    height: heightValue10,
                  ),
                  Text(
                    "rencontrer de nouvelles personnes tout en etant assis chez vous.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: heightValue18,
                      color: greyScale500,
                    ),
                  )
                ],
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: EdgeInsets.only(top: heightValue30),
                  child: Column(
                    children: [
                      // Image.asset(
                      //   "assets/img/1.png",
                      //   height: heightValue100,
                      // ),
                      SizedBox(
                        height: heightValue100,
                      ),
                      // SizedBox(
                      //   height: heightValue10,
                      // ),
                      // Text(
                      //   "The Best Way to Transfer Money Safely",
                      //   style: TextStyle(
                      //     fontSize: heightValue15,
                      //     color: greyScale500,
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.only(bottom: heightValue20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomButton(
                          buttonText: "Créer un compte",
                          buttonColor: defaultAppColor,
                          buttonTextColor: whiteColor,
                          onTap: () {
                            Get.toNamed(Routes.IDENTIFICATION);
                          }),
                      SizedBox(
                        height: heightValue10,
                      ),
                      TextButton(
                        onPressed: () {
                          Get.toNamed(Routes.LOGIN);
                          print("partir");
                        },
                        child: Text(
                          "Vous avez deja un compte ?",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: heightValue18,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
