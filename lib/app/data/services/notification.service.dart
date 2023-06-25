import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:get/state_manager.dart';

import 'package:dio/dio.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:tindex_mobile/app/data/models/receptionbay.model.dart';
import 'package:tindex_mobile/app/data/models/utilisateur.model.dart';
import 'package:tindex_mobile/app/data/provider/api.dart';
import 'package:tindex_mobile/app/utils/helpers/session.helper.dart';

class NotificationService extends GetxService {
  static Dio dio = Dio();
  final pb = PocketBase(ApiHelper.pbIp);

  //  --------------------------- SERVICES DEFINITION

  SessionManager prefs = SessionManager();
  //  ----------------------------------------------------------------

  var currentUser = Utilisateur().obs;
  var currentBox = ReceptionBay().obs;
  var currentBoxQte = 0.obs;
  var isNotificationsloading = false.obs;

  Future<NotificationService> init() async {
    //  init user prefs
    if (prefs.isUserLogged()) {
      // get user panier
      currentUser(prefs.readUserData());
      getNotifs(currentUser.value.id!);
    }
    return this;
  }

  Future getNotifs(String userId) async {
    if (prefs.isUserLogged()) {
      isNotificationsloading(true);
      dynamic response;
      try {
        response = await pb
            .collection(ApiHelper.receptionCollectionName)
            .getFirstListItem('owner = "$userId" ',
                expand: 'owner, notifications');
      } catch (e) {
        print(" -- On avance dans le deroulé des evenements ");
      }
      print("response from get reception box of user =:::: ${response}");
      if (response != null) {
        // ready to listen
        currentBox(ReceptionBay.fromRecord(response));
        showNotifs();
        print('---- ++ ready to listen');
        listenerInit();
      } else {
        response = await createBoxForUser();
        print("response from creating new Box =:::: ${response}");
        currentBox(ReceptionBay.fromRecord(response));
        listenerInit();
      }
    }
  }

  createBoxForUser() async {
    ReceptionBay notificationBox =
        ReceptionBay(notifications: [], owner: prefs.readUserData().id);
    return await pb
        .collection(ApiHelper.receptionCollectionName)
        .create(body: notificationBox.toMap());
  }

  listenerInit() {
    print("notifications // box ID : ${currentBox.value.id} ");
    pb.collection('receptionbay').subscribe('${currentBox.value.id}',
        (element) {
      currentBox(ReceptionBay.fromRecord(element.record!));

      print("------------ Boite de reception  ::: ${element.toJson()} ");
      showNotifs();
    });
  }

  void showNotifs() {
    currentBoxQte(currentBox.value.notifications!.length);
    for (var i = 0; i < currentBox.value.notifications!.length; i++) {
      var notificationItem = currentBox.value.notifications![i];
      print("------------ Notif itzam  ::: ${notificationItem.toJson()} ");
      print("------------ Notif itzam  ::: ${notificationItem.status} ");
      // if (notificationItem.status == "active") {
      AwesomeNotifications().createNotification(
          content: NotificationContent(
              id: notificationItem.id!,
              channelKey: "main_resi_channel",
              title: "${notificationItem.title}",
              body: notificationItem.content,
              notificationLayout: NotificationLayout.BigText));
      // }
    }
  }
}
