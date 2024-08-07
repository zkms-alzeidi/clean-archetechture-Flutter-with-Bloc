import 'package:flutter/material.dart';

class customInputField extends StatelessWidget {

  final String hint;
  final IconData icon;
  final TextEditingController textController;



  const customInputField({super.key, required this.hint, required this.icon, required this.textController });

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.all(8),
    child: Material(

      elevation:3.5,
      color: Colors.black,
      shadowColor: Colors.transparent,

      child: TextField(
        textAlignVertical: TextAlignVertical.center,
        controller: textController,
        decoration:  InputDecoration(
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.1))
          ),
          filled: true,
          hintText: hint,

        ),
      ) ,
    ),);
  }
}
