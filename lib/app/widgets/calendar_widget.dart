// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import 'package:mobile/app/data/models/intervaldate.model.dart';
// import 'package:mobile/app/utils/helpers/calendar_builder.dart';
// import 'package:mobile/app/utils/helpers/date.helper.dart';
// import 'package:table_calendar/table_calendar.dart';

// import 'package:tindex_mobile/app/utils/theme/app_button_style.dart';
// import 'package:unicons/unicons.dart';
// import 'package:loading_animation_widget/loading_animation_widget.dart';
// import 'package:tindex_mobile/app/utils/theme/Constant.dart';
// import 'package:tindex_mobile/app/utils/theme/app_global_style.dart';
// import 'package:tindex_mobile/app/utils/theme/app_text_style.dart';

// class CalendarRangeController extends GetxController {
//   var focusedDay = DateTime.now().obs;
//   var startDay = DateTime.now().obs;
//   var endDay = DateTime.now().obs;
// }

// class CalendarRangeWidget extends StatelessWidget {
//   final List<IntervalDate> listeUsedDates;
//   final Function(IntervalDate data) onRangeSet;
//   CalendarRangeController controller = Get.put(CalendarRangeController());
//   CalendarRangeWidget(
//       {super.key, required this.listeUsedDates, required this.onRangeSet});
//   @override
//   Widget build(BuildContext context) {
//     print("Table of used dates ");
//     print(listeUsedDates);
//     return Obx(() {
//       return TableCalendar(
//         locale: 'fr_FR',

//         firstDay: DateTime.utc(2010, 10, 16),
//         lastDay: DateTime.utc(2030, 3, 14),
//         rangeStartDay: controller.startDay.value,
//         rangeEndDay: controller.endDay.value,
//         focusedDay: controller.focusedDay.value,
//         enabledDayPredicate: (day) {
//           bool res = DateHelper.isInArrayOfDates(day, listeUsedDates);
//           return !res;
//         },
//         // onDaySelected: (selectedDay, focusedDay) {
//         //   print("Update focused Date");
//         //   controller.focusedDay(selectedDay);
//         // },
//         onRangeSelected: (start, end, focusedDay) {
//           print("Start date is :::: ${DateHelper.format(start)}");
//           print("End date is :::: ${DateHelper.format(end)}");

//           controller.startDay(start);
//           controller.endDay(end);
//           print(
//               "Is end after start :::: ${controller.endDay.value.isAfter(start!)}");

//           if (!controller.endDay.value.isAfter(start)) {
//             DateTime temp = controller.endDay.value;
//             controller.endDay(controller.startDay.value);
//             controller.startDay(temp);
//           }
//           onRangeSet(IntervalDate(
//               end: controller.endDay.value, start: controller.startDay.value));
//         },
//         rangeSelectionMode: RangeSelectionMode.enforced,
//         calendarBuilders: const CalendarBuilders(
//             // withinRangeBuilder: CalendarWidgetBuilder.withinRangeBuilder,
//             disabledBuilder: CalendarWidgetBuilder.disabledBuilder,
//             todayBuilder: CalendarWidgetBuilder.todayBuilder,
//             selectedBuilder: CalendarWidgetBuilder.selectedBuilder,
//             defaultBuilder: CalendarWidgetBuilder.defaultBuilder,
//             dowBuilder: CalendarWidgetBuilder.dowBuilder),
//       );
//     });
//   }
// }
