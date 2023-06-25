import 'package:intl/intl.dart';
import 'package:tindex_mobile/app/data/models/intervaldate.model.dart';

class DateHelper {
  static String? format(DateTime? actualdate) {
    return actualdate == null
        ? null
        : DateFormat("yyyy-MM-dd HH:mm:ss").format(actualdate!);
  }

  static String? byformat(DateTime? actualdate) {
    return actualdate == null
        ? null
        : DateFormat("dd/MM à HH:mm").format(actualdate!);
  }

  static String now() {
    return DateFormat("yyyy-MM-dd HH:mm:ss").format(DateTime.now());
  }

  static bool isBetween(DateTime currDate, DateTime dataA, DateTime dataB) {
    if (dataA.isBefore(currDate) && dataB.isAfter(currDate)) {
      return true;
    } else {
      return false;
    }
  }

  static bool isInArrayOfDates(
      DateTime currDate, List<IntervalDate> listeOfDate) {
    bool ret = false;
    for (var i = 0; i < listeOfDate.length; i++) {
      IntervalDate curInterval = listeOfDate[i];
      if (isBetween(currDate, curInterval.start!, curInterval.end!)) {
        return true;
      }
    }
    return ret;
  }

  static bool hasOverlap(IntervalDate t1, IntervalDate t2) {
    return !(t1.end!.isBefore(t2.start!) || t1.start!.isAfter(t2.end!));
    ;
  }

  static bool containsArrayOfDates(
      IntervalDate currRange, List<IntervalDate> listeOfDate) {
    bool ret = false;

    for (var i = 0; i < listeOfDate.length; i++) {
      IntervalDate curInterval = listeOfDate[i];
      if (hasOverlap(currRange, curInterval)) {
        return true;
      }
    }
    return ret;
  }

  static int getDuration(IntervalDate i) {
    print(i.start!.difference(i.end!).inDays.abs());
    return i.start!.difference(i.end!).inDays.abs();
  }

  static String getBetween(IntervalDate i1) {
    return "Du ${i1.start!.day}/${i1.start!.month}/${i1.start!.year} au  ${i1.end!.day}/${i1.end!.month}/${i1.end!.year}";
  }
}
