import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:khiat/features/presentation/cubit/auth/auth_cubit.dart';
import 'package:khiat/features/presentation/cubit/auth/auth_state.dart';
import 'package:khiat/features/presentation/cubit/credential/credential_cubit.dart';
import 'package:khiat/features/presentation/cubit/credential/credential_state.dart';
import 'package:khiat/features/presentation/pages/splash_screen.dart';
import 'package:khiat/providers/auth_provider.dart';
import 'package:khiat/routes/route_helper.dart';
import 'package:khiat/widget/log_button.dart';
import 'package:khiat/widget/textField.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  
  TextEditingController emailController= TextEditingController();
  TextEditingController passwordController= TextEditingController();
  final bool _isShowPassword=true;


  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();

  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<CredentialCubit,CredentialState>(
        listener: (context,credentialState){
          if(credentialState is CredentialSuccess){
            BlocProvider.of<AuthCubit>(context).loggedIn();
          }
          if(credentialState is CredentialFailure){
            print("wrong");
          }
        },

        builder: (BuildContext context, CredentialState credentialState) {
          if (credentialState is CredentialLoading) {
            return const Scaffold(
              body: Text("Loading"),
            );
          }
          if (credentialState is CredentialSuccess) {
            return BlocBuilder<AuthCubit, AuthState>(
              builder: (context, authState) {
                if (authState is Authenticated) {
                  return const SplashScreen();
                } else {
                  print("Unauthenticsted");
                  return _bodyWidget();
                }
              },
            );
          }

          return _bodyWidget();
        },
      )
    );
  }

  _bodyWidget(){
    return Column(
      children: [
        const SizedBox(height: 200,),
        customInputField(hint: "email", icon: Icons.email , textController: emailController),
        customInputField(hint: "password", icon: Icons.password, textController: passwordController),

        GestureDetector(onTap:()=>{
          Get.offNamed(RouteHelper.getInitial()),



          sign_up(email: emailController.text, password: passwordController.text)
        },child: logButton(text: "SignIn"))

      ],
    );
  }
}
