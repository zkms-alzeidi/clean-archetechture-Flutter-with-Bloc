


import 'package:get/get.dart';
import 'package:khiat/features/presentation/pages/main_page.dart';
import 'package:khiat/features/presentation/pages/signIn_page.dart';
import 'package:khiat/features/presentation/pages/signup_page.dart';
import 'package:khiat/features/presentation/pages/splash_screen.dart';

class RouteHelper{


  static const String splashScreen= "/splash_screen";
  static const String initial= "/";
  static const String signUpScreen="/signUp_screen";
  static const String signInScreen= "/signin_screen";

  static String getSplashScreen()=> splashScreen;
  static String getInitial()=> initial;
  static String getSignUpPage()=> signUpScreen;
  static String getSignInPage()=> signInScreen;

  static List<GetPage> routes= [
    GetPage(name: initial, page: ()=> const HomePage()),
    GetPage(name: splashScreen, page: ()=> const SplashScreen()),
    GetPage(name: signInScreen, page: ()=> const SignInPage()),
    GetPage(name: signUpScreen, page: ()=> const SignUpPage())
  ];




}