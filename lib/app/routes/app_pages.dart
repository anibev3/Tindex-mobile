import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tindex_mobile/app/modules/session/views/identification_screen.dart';
import 'package:tindex_mobile/app/modules/session/views/login_screen.dart';
import 'package:tindex_mobile/app/modules/session/views/splash_screen.dart';
import 'package:tindex_mobile/app/modules/session/views/test.dart';

part './app_routes.dart';

class AppPages {
  static final pages = [
    // ------------- Session
    // ++
    // ++
    // ++
    GetPage(
      name: Routes.INITIAL,
      page: () => SplashScreen(),
    ),
    // GetPage(
    //   name: Routes.WELCOME,
    //   page: () => WelcomeScreen(),
    // ),
    GetPage(
      name: Routes.IDENTIFICATION,
      page: () => IdentificationScreen(),
    ),

    GetPage(
      name: Routes.LOGIN,
      page: () => LoginScreen(),
    ),

    // GetPage(
    //   name: Routes.LOGINOTP,
    //   page: () => OtpLoginScreen(),
    // ),
    // GetPage(
    //   name: Routes.OTP,
    //   page: () => OtpScreen(),
    // ),

    // GetPage(
    //   name: Routes.COMPTECREE,
    //   page: () => CompteCreeScreen(),
    // ),

    // GetPage(
    //   name: Routes.UPDATEPROFILE,
    //   page: () => UpdateProfileScreen(),
    // ),

    // // ++
    // // ++
    // // ++
    // // --------------  home
    // // ++
    // // ++
    // // ++
    // GetPage(
    //   name: Routes.HOME,
    //   transition: Transition.noTransition,
    //   curve: Curves.easeInOut,
    //   page: () => HomeScreen(),
    // ),
    // GetPage(
    //   name: Routes.FAVORISHOME,
    //   transition: Transition.noTransition,
    //   curve: Curves.easeInOut,
    //   page: () => FavHomeScreen(),
    // ),
    // GetPage(
    //   name: Routes.SEARCHHOME,
    //   transition: Transition.noTransition,
    //   curve: Curves.easeInOut,
    //   page: () => SearchHomeScreen(),
    // ),
    // GetPage(
    //   name: Routes.CHATHOME,
    //   transition: Transition.noTransition,
    //   curve: Curves.easeInOut,
    //   page: () => ChatHomeScreen(),
    // ),
    // GetPage(
    //   name: Routes.PROFILEHOME,
    //   transition: Transition.noTransition,
    //   curve: Curves.easeInOut,
    //   page: () => ProfileHomeScreen(),
    // ),

    // GetPage(
    //   name: Routes.CATEGORIEHOME,
    //   transition: Transition.rightToLeftWithFade,
    //   transitionDuration: Duration(milliseconds: 300),
    //   curve: Curves.easeInOut,
    //   page: () => CategorieHomeScreen(),
    // ),

    // // ++
    // // ++
    // // ++
    // // --------------  Notifications
    // // ++
    // // ++
    // // ++
    // GetPage(
    //   name: Routes.NOTIFICATIONHOME,
    //   transition: Transition.upToDown,
    //   curve: Curves.easeInOut,
    //   transitionDuration: Duration(milliseconds: 400),
    //   page: () => NotificationHomeScreen(),
    // ),
    // // ++
    // // ++
    // // ++
    // // --------------  Residence
    // // ++
    // // ++
    // // ++
    // GetPage(
    //   name: Routes.DETAILRESIDENCE,
    //   transition: Transition.rightToLeftWithFade,
    //   curve: Curves.easeInOut,
    //   transitionDuration: Duration(milliseconds: 300),
    //   page: () => DetailResidenceScreen(),
    // ),
    // GetPage(
    //   name: Routes.CREATERESIDENCE,
    //   transition: Transition.rightToLeftWithFade,
    //   curve: Curves.easeInOut,
    //   transitionDuration: Duration(milliseconds: 400),
    //   page: () => ResidenceAddScreen(),
    // ),
    // GetPage(
    //   name: Routes.MESRESIDENCES,
    //   transition: Transition.rightToLeftWithFade,
    //   curve: Curves.easeInOut,
    //   transitionDuration: Duration(milliseconds: 300),
    //   page: () => MesResidencesScreen(),
    // ),

    // GetPage(
    //   name: Routes.NEWNOTE,
    //   transition: Transition.rightToLeftWithFade,
    //   curve: Curves.easeInOut,
    //   transitionDuration: Duration(milliseconds: 300),
    //   page: () => NoteResidenceScreen(),
    // ),

    // // ++
    // // ++
    // // ++
    // // --------------  Reservations
    // // ++
    // // ++
    // // ++
    // GetPage(
    //   name: Routes.RESERVATION,
    //   transition: Transition.cupertino,
    //   curve: Curves.easeInOut,
    //   transitionDuration: Duration(milliseconds: 1),
    //   page: () => ReservationScreen(),
    // ),
    // GetPage(
    //   name: Routes.MESRESERVATION,
    //   transition: Transition.noTransition,
    //   curve: Curves.easeInOut,
    //   // transitionDuration: Duration(milliseconds: 300),
    //   page: () => MesReservationScreen(),
    // ),
    // GetPage(
    //   name: Routes.MESDEMANDES,
    //   transition: Transition.noTransition,
    //   curve: Curves.easeInOut,
    //   // transitionDuration: Duration(milliseconds: 300),
    //   page: () => MesDemandesScreen(),
    // ),
    // // ++
    // // ++
    // // ++
    // // --------------  Chat
    // // ++
    // // ++
    // // ++
    // GetPage(
    //   name: Routes.CHATSESSION,
    //   transition: Transition.noTransition,
    //   curve: Curves.easeInOut,
    //   // transitionDuration: Duration(milliseconds: 00),
    //   page: () => ConversationScreen(),
    // ),
    // ++
    // ++
    // ++
    // --------------  Chat
    // ++
    // ++
    // ++
    GetPage(
      name: Routes.TEST,
      transition: Transition.noTransition,
      curve: Curves.easeInOut,
      // transitionDuration: Duration(milliseconds: 00),
      page: () => SignInOne(),
    ),
  ];
}
