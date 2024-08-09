
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:khiat/features/data/remote/data_sources/firebase_remote_data_source.dart';
import 'package:khiat/features/data/remote/models/user_model.dart';
import 'package:khiat/features/domain/entities/user_entity.dart';

class FirebaseRemoteDataSourceImpl implements FirebaseRemoteDataSource{
 
  final FirebaseFirestore fireStore;
  final FirebaseAuth auth;
  
  FirebaseRemoteDataSourceImpl(this.fireStore, this.auth);
 
  @override
  Future<void> getCreateCurrentUser(UserEntity user) async {
    
    final userCollection = fireStore.collection("users");
    final uid= await getCurrentUid();

    userCollection.doc(uid).get().then(
        (userDoc){
          final newUser= UserModel(
            name: user.name,
            email: user.email,
            phoneNumber: user.phoneNumber,
            profileUrl: user.profileUrl,
            uid: user.uid
          ).toDocument();

          if(!userDoc.exists){
            userCollection.doc(uid).set(newUser);
            return;
          }else{
            userCollection.doc(uid).update(newUser);
            print("user already exist");
            return;
          }

        }
    ).catchError((error){
      print(error);
    });

    
    
  }

  @override
  Future<String> getCurrentUid() async {

    return auth.currentUser!.uid;
  }

  @override
  Future<bool> isSignIn() async{

    return auth.currentUser?.uid!=null;
  }

  @override
  Future<void> signIn(UserEntity user) async {
    print("is working");
     await auth.signInWithEmailAndPassword(email: user.email, password: user.password);


  }

  @override
  Future<void> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }

  @override
  Future<void> signUp(UserEntity user) async {
    print("is working");
    await auth.createUserWithEmailAndPassword(email: user.email, password: user.password);

  }
  
}