

import 'package:khiat/features/domain/entities/user_entity.dart';
import 'package:khiat/features/domain/repositories/firebase_repository.dart';

class GetCreateCurrentUseCase{

  final FirebaseRepository repository;

  GetCreateCurrentUseCase({required this.repository});

  Future<void> call(UserEntity user) async{

    return repository.getCreateCurrentUser(user);

  }


}