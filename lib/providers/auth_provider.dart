


import 'package:firebase_auth/firebase_auth.dart';

Future<void> sign_up({required String  email, required String password}) async{


  try{

    final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);

    print ("done");
  }on FirebaseAuthException catch(e){
    print("error: $e");
  }

}