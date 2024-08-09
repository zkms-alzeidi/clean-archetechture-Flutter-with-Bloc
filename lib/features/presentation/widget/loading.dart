
import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: SizedBox(
          height: 100,

          child:  Column(
              children: [
                CircularProgressIndicator(),
                SizedBox(height: 5,),
                Text("please wait..")
              ]),
        ),
      );

  }
}
