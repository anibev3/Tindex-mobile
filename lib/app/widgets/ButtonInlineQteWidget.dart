import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tindex_mobile/app/utils/theme/app_button_style.dart';
import 'package:unicons/unicons.dart';
import 'package:tindex_mobile/app/utils/theme/Constant.dart';
import 'package:tindex_mobile/app/utils/theme/app_text_style.dart';

class ButtonInlineQteWidget extends StatelessWidget {
  final String id;
  final void Function(int value) update;

  ButtonInlineQteWidget({Key? key, required this.id, required this.update})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ButtonInlineQteController controller =
        Get.put(ButtonInlineQteController(), tag: "ButtonInlineQte-${id}");
    return Row(
      children: [
        // 1 - Bouton moins
        ElevatedButton(
            style: ButtonCss.dyndefaultIconButtonStyle(Colors.black,
                raduis: Cst.kDefaultRaduis, width: 40, height: 20),
            onPressed: () {
              controller.minusOne();
              update(controller.currentValue.value);
            },
            child: Icon(UniconsLine.minus, size: 18)),
        SizedBox(
          width: 30,
          child: Obx(() {
            return Center(
                child: Text(
              "${controller.currentValue.value}",
              style: TextCss.dyncoloredBoldStyle(Colors.black, Cst.kxl),
            ));
          }),
        ),
        ElevatedButton(
            style: ButtonCss.dyndefaultIconButtonStyle(Colors.black,
                raduis: Cst.kDefaultRaduis, width: 40, height: 20),
            onPressed: () {
              controller.addOne();
              update(controller.currentValue.value);
            },
            child: Icon(UniconsLine.plus, size: 18))
      ],
    );
  }
}

class ButtonInlineQteController extends GetxController {
  var currentValue = 0.obs;

  addOne() {
    currentValue(currentValue.value + 1);
  }

  minusOne() {
    if (currentValue.value > 0) {
      currentValue(currentValue.value - 1);
    }
  }
}
