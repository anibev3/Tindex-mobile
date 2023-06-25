import 'package:flutter/material.dart';
import 'package:tindex_mobile/app/utils/theme/Constant.dart';
import 'package:tindex_mobile/app/utils/theme/app_text_style.dart';

class TextHelper {
  static String trunc(String? texte, {int max = 30}) {
    return texte == null
        ? ""
        : texte.length > max
            ? texte.substring(0, max) + "..."
            : texte;
  }

  static String formatPrice(int? prix) {
    String text = "$prix";
    int nbVirgules = (text.length % 3 == 0)
        ? (text.length / 3).floor() - 1
        : (text.length / 3).floor();
    int position = text.length;
    for (var i = 1; i <= nbVirgules; i++) {
      text =
          "${text.substring(0, position - 3)},${text.substring(position - 3, text.length)}";
      position = position - 3;
    }
    return "$text FCFA";
  }

  static int getSize(dynamic value) {
    String texte = value.toString();
    return texte.length;
  }

  static Widget getTextIcon(IconData icon, String text,
      {double size = Cst.kbase,
      Color color = Colors.grey,
      double iconSize = 18,
      double spaceBetween = 4}) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: Text.rich(
        TextSpan(
          children: [
            WidgetSpan(
                alignment: PlaceholderAlignment.middle,
                child: Padding(
                  padding: EdgeInsets.only(right: spaceBetween),
                  child: Icon(
                    icon,
                    color: color,
                    size: iconSize,
                  ),
                )),
            TextSpan(
                text: text, style: TextCss.dyncoloredSBoldStyle(color, size)),
          ],
        ),
        textAlign: TextAlign.start,
      ),
    );
  }
}
