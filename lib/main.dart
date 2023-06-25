import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/date_symbol_data_local.dart';
// import 'package:intl/date_symbol_data_http_request.dart';
// import 'package:intl/date_symbol_data_file.dart';
import 'package:tindex_mobile/app/data/services/notification.service.dart';
import 'package:tindex_mobile/app/data/services/preference_service.dart';
import 'package:tindex_mobile/app/routes/app_pages.dart';
import 'package:tindex_mobile/app/utils/theme/app_theme.dart';

void main() async {
  await initServices();
  // initializeDateFormatting().then((_) => runApp(MyApp()));

  runApp(MyApp());
}

Future<bool> initServices() async {
  print('starting services ...');

  WidgetsFlutterBinding.ensureInitialized();
  // AwesomeNotifications().isNotificationAllowed().then(
  //   (isAllowed) {
  //     if (!isAllowed) {
  //       // This is just a basic example. For real apps, you must show some
  //       // friendly dialog box before call the request method.
  //       // This is very important to not harm the user experience
  //       AwesomeNotifications().requestPermissionToSendNotifications();
  //     }
  //     AwesomeNotifications().initialize(
  //         null,
  //         [
  //           NotificationChannel(
  //               channelGroupKey: 'main_resi_channel_group',
  //               channelKey: 'main_resi_channel',
  //               channelName: 'Main notifications',
  //               channelDescription: 'Notification channel for basic tests',
  //               defaultColor: Color(0xFF9D50DD),
  //               ledColor: Colors.white)
  //         ],
  //         debug: true);
  //   },
  // );

  /// Here is where you put get_storage, hive, shared_pref initialization.
  await GetStorage.init();
  await Get.putAsync(() => PreferencesService().init());
  // await Get.putAsync(() => NotificationService().init());
  print('All services started...');
  return true;
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.INITIAL,
      theme: appThemeData,
      defaultTransition: Transition.fade,
      getPages: AppPages.pages,
      locale: Locale('fr', 'FR'),
      // translationsKeys: AppTranslation.translations,
    );
  }
}
