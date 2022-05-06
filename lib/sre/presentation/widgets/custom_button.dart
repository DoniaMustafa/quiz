import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
final String text;
final  Function onPress;
Color? color;
CustomButton({ this.color,required this.text,required this.onPress});
  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: ElevatedButton(onPressed:() =>onPress(),
        child: Text(text,style: TextStyle(color: Colors.white,fontSize: 20.0),),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(color)

      )),
    );
  }


}
