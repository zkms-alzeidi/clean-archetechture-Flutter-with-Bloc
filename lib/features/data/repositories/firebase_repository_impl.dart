import 'package:khiat/features/data/remote/data_sources/firebase_remote_data_source.dart';
import 'package:khiat/features/domain/entities/user_entity.dart';
import 'package:khiat/features/domain/repositories/firebase_repository.dart';

class FirebaseRepositoryImpl implements FirebaseRepository{

  final FirebaseRemoteDataSource firebaseRemoteDataSource;
  FirebaseRepositoryImpl({required this.firebaseRemoteDataSource});


  @override
  Future<void> getCreateCurrentUser(UserEntity user) async {
    return  await firebaseRemoteDataSource.getCreateCurrentUser(user);
  }

  @override
  Future<String> getCurrentUid() async {
    return await firebaseRemoteDataSource.getCurrentUid();
  }

  @override
  Future<bool> isSignIn() async {

    return await firebaseRemoteDataSource.isSignIn();
  }

  @override
  Future<void> signIn(UserEntity user) async{
    print("worked in firebase");
    return await firebaseRemoteDataSource.signIn(user);
  }

  @override
  Future<void> signOut() async {
    return await firebaseRemoteDataSource.signOut();
  }

  @override
  Future<void> signUp(UserEntity user) async{
    print("worked in firebase");
    return await firebaseRemoteDataSource.signUp(user);
  }


}