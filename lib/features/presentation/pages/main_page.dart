
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:khiat/features/presentation/cubit/auth/auth_cubit.dart';
import 'package:khiat/features/presentation/cubit/auth/auth_state.dart';
import 'package:khiat/features/presentation/widget/log_button.dart';
import 'package:khiat/routes/route_helper.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: BlocConsumer<AuthCubit,AuthState>(
        builder: (BuildContext context, state) {
          return Container(
            alignment: Alignment.center,
            child:  GestureDetector(onTap:()async=>{

              BlocProvider.of<AuthCubit>(context).loggedOut(),


              Get.offNamed(RouteHelper.getSignInPage())


            },child: const LogButton(text: "sign out",)),
          );
        },
        listener: (BuildContext context, Object? state) {

        },

      ),
    );
  }
}
