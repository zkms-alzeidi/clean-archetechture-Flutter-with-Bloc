import 'package:flutter/material.dart';

class LogButton extends StatelessWidget {

  final String? text;
  final Color? color;
  final Color? textColor;

   const LogButton({super.key, this.text, this.color= Colors.green, this.textColor= Colors.white });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
     width: 150,
      height: 55,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10)
      ),
      child: text!=null?Text(text!, style: TextStyle(color: textColor,fontSize: 20, fontWeight: FontWeight.bold)):const CircularProgressIndicator(),
    );
  }
}
