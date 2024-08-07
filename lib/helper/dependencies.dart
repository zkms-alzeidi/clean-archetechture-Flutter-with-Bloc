



import 'package:firebase_core/firebase_core.dart';
import 'package:khiat/firebase_options.dart';

Future<void> init() async{


  Firebase.initializeApp();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

}