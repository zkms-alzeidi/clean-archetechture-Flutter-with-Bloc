import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:khiat/features/presentation/cubit/auth/auth_cubit.dart';
import 'package:khiat/firebase_options.dart';
import 'package:khiat/routes/route_helper.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});


  @override
  State<SplashScreen> createState() => _SplashScreenState();

}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState(){
    super.initState();
    Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    bool isSignIn=false;
    Timer( const Duration(seconds: 2), ()async{

       isSignIn= await  BlocProvider.of<AuthCubit>(context).isSignInUseCase.call();
      if(isSignIn){
        Get.offNamed(RouteHelper.getInitial());
      }
      else{
        Get.offNamed(RouteHelper.getSignInPage());
      }



    });

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          alignment: Alignment.center,
          child: const Text("splash screen"),
        ),
      );
  }


}

