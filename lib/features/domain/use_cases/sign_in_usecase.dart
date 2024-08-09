

import 'package:khiat/features/domain/entities/user_entity.dart';
import 'package:khiat/features/domain/repositories/firebase_repository.dart';

class SignInUseCase{

  final FirebaseRepository repository;

  SignInUseCase({required this.repository});

  Future<void> call(UserEntity user) async{
    print("worked in repository");
    return await repository.signIn(user);

  }


}