import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tindex_mobile/app/utils/theme/Constant.dart';
import 'package:tindex_mobile/app/utils/theme/app_global_style.dart';
import 'package:tindex_mobile/app/utils/theme/app_text_style.dart';

class CalendarWidgetBuilder {
  static Widget withinRangeBuilder(context, day, focusedDay) {
    final text = DateFormat.d().format(day);
    return Container(
      height: 40,
      width: 40,
      margin: EdgeInsets.only(bottom: 7),
      decoration: GlobalCss.blackBox(Colors.grey.shade700, rad: 0.0),
      child: Center(
        child: Text(
          text,
          style: TextCss.dyncoloredBoldStyle(Colors.black, Cst.kbase),
        ),
      ),
    );
  }

  //  -------------------------------

  static Widget disabledBuilder(context, day, focusedDay) {
    final text = DateFormat.d().format(day);
    return Center(
      child: Text(
        text,
        style: TextCss.dyncoloredBoldStyle(Colors.grey.shade600, Cst.kbase,
            isfalse: true),
      ),
    );
  }

  //  ----------------------------------------

  static Widget todayBuilder(context, day, focusedDay) {
    final text = DateFormat.d().format(day);
    if (!day.isAtSameMomentAs(focusedDay)) {
      return Container(
        height: 40,
        width: 40,
        margin: EdgeInsets.only(bottom: 7),
        decoration:
            GlobalCss.blackBox(Colors.grey.shade100, rad: Cst.kMaxRaduis),
        child: Center(
          child: Text(
            text,
            style: TextCss.dyncoloredBoldStyle(Colors.black, Cst.kbase),
          ),
        ),
      );
    } else {
      return Container(
        height: 40,
        width: 40,
        margin: EdgeInsets.only(bottom: 7),
        decoration: GlobalCss.blackBox(Colors.black, rad: Cst.kMaxRaduis),
        child: Center(
          child: Text(
            text,
            style: TextCss.dyncoloredBoldStyle(Colors.white, Cst.kbase),
          ),
        ),
      );
    }
  }

  //  ----------------------------------------------------------------

  static Widget selectedBuilder(context, day, focusedDay) {
    final text = DateFormat.d().format(day);
    return Container(
      height: 40,
      width: 40,
      margin: EdgeInsets.only(bottom: 7),
      decoration: GlobalCss.blackBox(Colors.black, rad: Cst.kMaxRaduis),
      child: Center(
        child: Text(
          text,
          style: TextCss.dyncoloredBoldStyle(Colors.white, Cst.kbase),
        ),
      ),
    );
  }

  //  ----------------------------------------------------------------

  static Widget defaultBuilder(context, day, focusedDay) {
    final text = DateFormat.d().format(day);
    final now = DateTime.now().millisecondsSinceEpoch;
    if (day.millisecondsSinceEpoch == focusedDay.millisecondsSinceEpoch ||
        day.millisecondsSinceEpoch == now) {
      return Container(
        height: 40,
        width: 40,
        margin: EdgeInsets.only(bottom: 7),
        decoration: GlobalCss.blackBox(Colors.black, rad: Cst.kMaxRaduis),
        child: Center(
          child: Text(
            text,
            style: TextCss.dyncoloredBoldStyle(Colors.white, Cst.kbase),
          ),
        ),
      );
    } else {
      return Center(
        child: Text(
          text,
          style: TextCss.dyncoloredBoldStyle(Colors.black, Cst.kbase),
        ),
      );
    }
  }

  //  ---------------------------------

  static Widget dowBuilder(context, day) {
    final text = DateFormat.E().format(day);
    return Center(
      child: Text(
        text,
        style: TextStyle(color: Cst.kPrimaryColor),
      ),
    );
  }
}
