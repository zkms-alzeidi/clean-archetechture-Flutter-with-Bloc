

import 'package:khiat/features/domain/entities/user_entity.dart';
import 'package:khiat/features/domain/repositories/firebase_repository.dart';

class SignUpUseCase{


  final FirebaseRepository repository;

  SignUpUseCase({required this.repository});

  Future<void> call(UserEntity user) async{


    return await repository.signUp(user);

  }

}