import 'package:flutter/material.dart';
import 'package:tindex_mobile/app/utils/theme/Constant.dart';
import 'package:tindex_mobile/app/utils/theme/app_global_style.dart';
import 'package:tindex_mobile/app/utils/theme/app_text_style.dart';

class LoginModButton extends StatelessWidget {
  final bool isactive;
  final String text;
  final Function onTap;

  const LoginModButton(
      {super.key,
      required this.isactive,
      required this.text,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        padding: isactive
            ? const EdgeInsets.symmetric(horizontal: 10, vertical: 10)
            : null,
        decoration: isactive
            ? GlobalCss.blackBox(Colors.white, rad: Cst.kMaxRaduis)
            : null,
        child: Text(
          text,
          style: TextCss.dyncoloredNormalStyle(Colors.black, Cst.kbase),
        ),
      ),
    );
  }
}
