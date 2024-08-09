import 'package:flutter/material.dart';

class customInputField extends StatelessWidget {

  final String hint;
  final IconData? icon;
  final TextEditingController textController;



  const customInputField({super.key, required this.hint,  this.icon, required this.textController });

  @override
  Widget build(BuildContext context) {
    return
    Container(
      height: 45,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.all(Radius.circular(10))
      ),


      child: TextField(
        textAlignVertical: TextAlignVertical.center,
        controller: textController,
        decoration:  InputDecoration(
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.1))
          ),
          filled: true,
          hintText: hint,
          prefixIcon: Icon(icon ?? Icons.circle)

        ),
      ) ,
    );
  }
}
