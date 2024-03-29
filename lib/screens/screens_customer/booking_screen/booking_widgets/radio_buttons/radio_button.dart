import 'package:flutter/material.dart';

class RadioButton extends StatelessWidget {
  final String text;
  final int? groupValue;
  final int value;
  final Function(int?) onChanged;

  const RadioButton({
    Key? key,
    required this.text,
    required this.groupValue,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Theme(
        data: ThemeData(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent),
        child: ListTile(
          onTap: () {
            onChanged(value);
          },
          title: Text(
            text,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14,
              color: Colors.black,
            ),
          ),
          leading: Radio<int>(
            value: value,
            groupValue: groupValue,
            onChanged: onChanged,
            activeColor: Colors.green,
            fillColor: MaterialStateProperty.resolveWith<Color>((states) {
              if (states.contains(MaterialState.selected)) {
                return Colors.green; // Color when the radio button is selected
              }
              return Colors.grey; // Color when the radio button is unselected
            }),
          ),
        ),
      ),
    );
  }
}
