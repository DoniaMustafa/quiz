import 'package:flutter/material.dart';

class CustomTextForm extends StatelessWidget {
  CustomTextForm(
      {Key? key,
      required this.controller,
      required this.label,
      required this.icon,required this.val})
      : super(key: key);
  final TextEditingController controller;
  final String val;
  final String label;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (String? validate){
        if (validate!.isEmpty) {
          return val;
        }
      },
      controller: controller,
      decoration:  InputDecoration(
        label: Text(label),
        labelStyle: TextStyle(color: Colors.black, fontSize: 15.0),
        prefixIcon: Icon(icon),

      ),
    );
  }
}
