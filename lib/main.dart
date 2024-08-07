import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:khiat/features/presentation/cubit/auth/auth_cubit.dart';
import 'package:khiat/features/presentation/cubit/credential/credential_cubit.dart';
import 'package:khiat/routes/route_helper.dart';
import 'injection_container.dart' as di;




Future<void> main() async {

  //await init();
  //await Firebase.initializeApp();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await di.init();






  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(

      providers: [
        BlocProvider(create: (_)=> di.sl<AuthCubit>()..appStart()),
        BlocProvider(create: (_)=> di.sl<CredentialCubit>())
      ],
      child: GetMaterialApp(

        debugShowCheckedModeBanner: false,
        initialRoute: RouteHelper.getSplashScreen(),
        getPages: RouteHelper.routes,
      ),
    );
  }
}

