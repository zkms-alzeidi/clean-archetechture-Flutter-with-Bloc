
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
          height: 100,

          child:  const Column(
              children: [
                CircularProgressIndicator(),
                SizedBox(height: 5,),
                Text("please wait..")
              ]),
        ),
      );

  }
}
