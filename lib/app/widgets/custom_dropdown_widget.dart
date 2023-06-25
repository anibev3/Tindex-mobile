import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class CustomDropdownWidget<T> extends StatelessWidget {
  final List<T> items;
  final T selected;
  final void Function(dynamic value) onChange;
  final Widget Function(T? value) child;
  final String label;

  CustomDropdownWidget(
      {super.key,
      required this.items,
      required this.selected,
      required this.onChange,
      required this.label,
      required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      // margin: const EdgeInsets.all(20),
      child: DropdownButtonHideUnderline(
        child: GFDropdown(
          padding: const EdgeInsets.all(15),
          borderRadius: BorderRadius.circular(5),
          border: const BorderSide(color: Colors.black12, width: 1),
          dropdownButtonColor: Colors.white,
          value: selected,
          onChanged: onChange,
          items: items
              .map((value) => DropdownMenuItem(
                    value: value,
                    child: child(value),
                  ))
              .toList(),
        ),
      ),
    );
  }
}
