import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tindex_mobile/app/utils/theme/Constant.dart';
import 'package:tindex_mobile/app/utils/theme/app_global_style.dart';

class Animate {
  static void showLoadingAnimation() {
    Get.dialog(
        Material(
          color: Colors.blueGrey.shade300.withOpacity(0.3),
          child: Center(
              child: Container(
            decoration: GlobalCss.containerStyle(Colors.white),
            height: 80,
            width: 80,
            child: const Padding(
              padding: EdgeInsets.all(Cst.kxl),
              child: CircularProgressIndicator(
                  color: Color.fromARGB(255, 76, 87, 175)),
            ),
          )),
        ),
        barrierDismissible: false);
  }
}
