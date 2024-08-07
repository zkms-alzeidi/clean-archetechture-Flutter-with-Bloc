

import 'package:khiat/features/domain/entities/user_entity.dart';

abstract class FirebaseRemoteDataSource {

  Future<void> getCreateCurrentUser(UserEntity user);
  Future<String> getCurrentUid();
  Future<void> signIn(UserEntity user);
  Future<void> signUp(UserEntity user);
  Future<void> signOut();
  Future<bool> isSignIn();


}