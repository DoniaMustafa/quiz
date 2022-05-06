import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

enum ToastColors { SUCCESS, ERROR, WARNING }

setToastColor(ToastColors color) {
  Color basicColor;
  switch (color) {
    case ToastColors.SUCCESS:
      basicColor = Colors.green;
      break;
    case ToastColors.ERROR:
      basicColor = Colors.red;
      break;
    case ToastColors.WARNING:
      basicColor = Colors.yellow;
      break;
  }
  return basicColor;
}

showToast({
  required String text,
  required ToastColors tColor,
  // required ToastGravities gravity
}) {
  Fluttertoast.showToast(
      msg: text,
      fontSize: 14,
      backgroundColor: setToastColor(tColor),
      toastLength: Toast.LENGTH_LONG,
      gravity:ToastGravity.BOTTOM
  );
}