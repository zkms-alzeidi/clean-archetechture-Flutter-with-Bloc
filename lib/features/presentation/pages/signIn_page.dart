import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
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
import 'package:khiat/routes/route_helper.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  
  final TextEditingController _emailController= TextEditingController();
  final TextEditingController _passwordController= TextEditingController();
  final bool _isShowPassword=true;


  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
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
            return const Scaffold( body:  Loading());
          }
          if (credentialState is CredentialSuccess) {
            return BlocBuilder<AuthCubit, AuthState>(
              builder: (context, authState) {
                if (authState is Authenticated) {
                  return const HomePage();
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
    return  SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 22),
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,

            children: [

              Container(alignment: Alignment.centerLeft, child: const Text("Sign In", style: TextStyle(color: Colors.green, fontSize: 35,fontWeight: FontWeight.bold),),),
              const SizedBox(height: 20,),
              customInputField(hint: "email", icon: Icons.email , textController: _emailController),
              const SizedBox(height: 10,),
              customInputField(hint: "password", icon: Icons.password, textController: _passwordController),
              const SizedBox(height: 10,),

              GestureDetector(onTap:()=>{

                _submitSignIn()

              },child: logButton(text: "SignIn")),


              Row(children: [
                const Text("reate a new"),
                TextButton(onPressed: ()=>{
                  Get.offNamed(RouteHelper.getSignUpPage())
                }, child: const Text("account"))

              ],)

            ],
          ),
        ),
      );

  }


  _submitSignIn(){

    if(_emailController.text.isEmpty){

      toast('enter your email');
      return;
    }
    if(_passwordController.text.isEmpty){

      toast('enter your password');
      return;

    }

    BlocProvider.of<CredentialCubit>(context).signInSubmit(UserEntity(
        email: _emailController.text,
        password: _passwordController.text
    ));

  }

}
