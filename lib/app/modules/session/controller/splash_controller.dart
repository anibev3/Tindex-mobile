import 'dart:async';
import 'package:get/get.dart';
import 'package:tindex_mobile/app/routes/app_pages.dart';
import 'package:tindex_mobile/app/utils/helpers/session.helper.dart';

class SplashController extends GetxController {
  SessionManager prefs = SessionManager();

  @override
  void onReady() {
    // TODO: implement onReady()
    // prefs.logout();
    // print(prefs.isUserLogged());
    if (prefs.isUserLogged()) {
      ///Go to Shop home Screen
      print("User is already logged");
      // Fluttertoast.showToast(msg: "Go to home page screen");
      // Timer(Duration(seconds: 3), onPageHome);
      onPageHome();
    } else {
      print("No User !!!");
      //   // Timer(Duration(seconds: 3), onPageStart);
      if (prefs.isTmpUserLogged()) {
        print("isTmpUserLogged !!!");
        Timer(Duration(seconds: 2), onAccountNotValid);
      } else {
        print("onPageStart !!!");
        // onPageStart();
        // Get.toNamed(Routes.WELCOME);
      }
    }
    super.onReady();
  }

  void onPageStart() {
    print("function to go to welcome page !!!");
    Get.offAndToNamed(Routes.WELCOME);
  }

  void onAccountNotValid() {
    Get.offAndToNamed(Routes.OTP);
  }

  void onPageHome() {
    Get.offAndToNamed(Routes.HOME);
  }
}
