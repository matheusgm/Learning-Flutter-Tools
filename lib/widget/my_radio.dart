import 'package:flutter/material.dart';

class MyRadio<T> extends StatefulWidget {
  final T? value;
  final T? groupValue;
  final String? name;
  final void Function(dynamic)? radioChange;
  const MyRadio({this.name, this.value, this.groupValue, this.radioChange, Key? key}) : super(key: key);

  @override
  State<MyRadio> createState() => _MyRadio();
}

class _MyRadio extends State<MyRadio> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Radio(
          value: widget.value,
          groupValue: widget.groupValue,
          onChanged: widget.radioChange,
          visualDensity: const VisualDensity(
            horizontal: VisualDensity.minimumDensity,
            vertical: VisualDensity.minimumDensity,
          ),
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        Text(widget.name ?? "Name NULL")
      ],
    );
  }
}
