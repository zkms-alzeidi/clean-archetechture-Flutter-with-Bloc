import 'package:flutter/material.dart';

class logButton extends StatelessWidget {

  String? text;
  Color? color;
  Color? textColor;

   logButton({super.key, this.text, this.color= Colors.blueGrey, this.textColor= Colors.black });

  @override
  Widget build(BuildContext context) {
    return Container(
     width: 150,
      height: 70,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10)
      ),
      child: text!=null?Text(text!, style: TextStyle(color: textColor)):const CircularProgressIndicator(),
    );
  }
}
