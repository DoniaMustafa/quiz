import 'package:flutter/material.dart';

class CustomCheckBox extends StatefulWidget {
  const CustomCheckBox({Key? key}) : super(key: key);

  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
bool isSelect =false;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Checkbox(
        onChanged: (i) {
          isSelect = !isSelect;
          setState(() {});
        },
        value: isSelect,
      ),
      const  SizedBox(
        width: 10.0,
      ),
      const   Expanded(
        child:  Text(
           'is confirmation',
          style: TextStyle(fontSize: 15.0),
        ),
      ),
    ]);
  }
}
