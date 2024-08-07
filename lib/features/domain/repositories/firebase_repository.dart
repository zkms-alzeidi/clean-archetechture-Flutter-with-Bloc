

import 'package:khiat/features/domain/entities/user_entity.dart';

abstract class FirebaseRepository{

  Future<void> getCreateCurrentUser(UserEntity user);
  Future<void> signIn(UserEntity user);
  Future<void> signUp(UserEntity user);
  Future<void> signOut();
  Future<String> getCurrentUid();
  Future<bool> isSignIn();


}