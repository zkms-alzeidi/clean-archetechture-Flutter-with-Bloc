import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:khiat/common.dart';
import 'package:khiat/features/domain/entities/user_entity.dart';
import 'package:khiat/features/presentation/cubit/auth/auth_cubit.dart';
import 'package:khiat/features/presentation/cubit/auth/auth_state.dart';
import 'package:khiat/features/presentation/cubit/credential/credential_cubit.dart';
import 'package:khiat/features/presentation/cubit/credential/credential_state.dart';
import 'package:khiat/features/presentation/pages/main_page.dart';
import 'package:khiat/features/presentation/widget/loading.dart';
import 'package:khiat/features/presentation/widget/log_button.dart';
import 'package:khiat/features/presentation/widget/textField.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {


  final TextEditingController _nameController= TextEditingController();
  final TextEditingController _emailController= TextEditingController();
  final TextEditingController _passwordController= TextEditingController();
  final TextEditingController _phoneNumController= TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<CredentialCubit,CredentialState>(

        listener: ( context,  state) {
          print("we are in Listener");
          if(state is CredentialSuccess){
            print("loged in");
          }
          if(state is CredentialFailure){
            print("failer");
          }
        },
        builder:(context, credentialState) {
          if(credentialState is CredentialLoading){
            print("we are in Loading");
            return const Loading();
          }
          if(credentialState is CredentialSuccess){
            return BlocBuilder<AuthCubit, AuthState>(
              builder: (context, authState) {
                if (authState is Authenticated) {
                  print(" we are in Authenticated");
                  return HomePage();
                } else {
                  print("Unauthenticsted");
                  return _signUpWidget();
                }
              },
            );
          }
          print("we are in the default return");
          return _signUpWidget();
        },
      ),
    );
  }


 Widget  _signUpWidget(){
    return SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 35, horizontal: 22),
          child: Column(

              children:<Widget> [

                Container(alignment: Alignment.centerLeft, child: const Text("Sign Up", style: TextStyle(color: Colors.green, fontSize: 35,fontWeight: FontWeight.bold),),),
                const SizedBox(height: 20,),
                customInputField(hint: "name", icon: Icons.person, textController: _nameController),
                const SizedBox(height: 10,),
                customInputField(hint: "email", icon: Icons.email, textController: _emailController),
                const SizedBox(height: 10,),
                customInputField(hint: "password", icon: Icons.password, textController: _passwordController),
                const SizedBox(height: 10,),
                customInputField(hint: "phone Number", icon: Icons.phone, textController: _phoneNumController),

                const SizedBox(height: 15,),
                GestureDetector(onTap: ()=>{

                  _submitSignUp()

                },child: logButton(text: "Sign Up"))



              ]
          ),
        ));
  }



  _submitSignUp() {

    if(_nameController.text.isEmpty){

      toast('enter your name');
      return;

    }
    if(_emailController.text.isEmpty){

      toast('enter your email');
      return;
    }
    if(_passwordController.text.isEmpty){

      toast('enter your password');
      return;

    }
    if(_phoneNumController.text.isEmpty){

      toast('enter your phone Number');
      return;

    }

    BlocProvider.of<CredentialCubit>(context).signUpSubmit( user:
      UserEntity(
        name: _nameController.text,
        email: _emailController.text,
        phoneNumber: _phoneNumController.text,
        password: _passwordController.text
      )
    );

  }

}

