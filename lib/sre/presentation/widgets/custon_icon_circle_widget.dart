import 'package:flutter/material.dart';

class CustomIconCircleWidget extends StatelessWidget {
  const CustomIconCircleWidget(
      {Key? key, required this.iconData, required this.onTap})
      : super(key: key);
  final GestureTapCallback onTap;
  final IconData iconData;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        key: key,
        radius: 25.0,
        child: Icon(iconData, size: 50),
      ),
    );
  }
}
