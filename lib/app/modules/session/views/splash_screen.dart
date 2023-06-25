import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tindex_mobile/app/modules/session/controller/splash_controller.dart';
import 'package:tindex_mobile/app/utils/theme/Constant.dart';

class SplashScreen extends StatelessWidget {
  SplashController controller = Get.put(SplashController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Colors.white,
      child: Center(
        child: SizedBox(
            width: 200,
            height: Get.height * 0.8,
            child: Column(
              children: [
                Expanded(child: Container()),
                // ColorFiltered(
                //     colorFilter:
                //         ColorFilter.mode(Cst.kPrimaryColor, BlendMode.srcIn),
                //     child: Image.asset(
                //       "assets/img/logo-bg-none.png",
                //     )),
                Expanded(child: Container()),
                CircularProgressIndicator(
                  color: Cst.kPrimaryColor,
                )
              ],
            )),
      ),
    ));
  }
}
