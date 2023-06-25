import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:tindex_mobile/app/routes/app_pages.dart';
import 'package:tindex_mobile/app/utils/theme/Constant.dart';
import 'package:tindex_mobile/app/utils/theme/app_global_style.dart';

const imgPro =
    "https://i.pinimg.com/originals/40/ea/19/40ea19b3d87c276b5a6bd57b3b7c9296.jpg";

class MessageTileWidget extends StatelessWidget {
  const MessageTileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        onTap: () {
          Get.toNamed(Routes.CHATSESSION);
        },
        leading: Container(
          padding: EdgeInsets.all(1.3),
          margin: EdgeInsets.all(1),
          decoration:
              GlobalCss.blackBox(Colors.red.shade700, rad: Cst.kMaxRaduis * 2),
          child: const GFAvatar(
            backgroundImage: NetworkImage(imgPro),
          ),
        ),
        title: Text("nom du correspondant"),
        subtitle: Text("dernier message tronqueé"),
        trailing: SizedBox(
          width: 40,
          height: 40,
          child: Center(
            child:
                // Badge(
                //   badgeColor: Cst.kPrimaryColor,
                //   badgeContent: Text("1"),
                //   child:
                Container(),
            // ),
          ),
        ),
      ),
    );
  }
}
