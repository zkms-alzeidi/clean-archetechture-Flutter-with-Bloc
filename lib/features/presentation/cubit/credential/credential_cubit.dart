

import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:khiat/features/domain/entities/user_entity.dart';
import 'package:khiat/features/domain/use_cases/get_create_current_usecase.dart';
import 'package:khiat/features/domain/use_cases/sign_in_usecase.dart';
import 'package:khiat/features/domain/use_cases/sign_up_usecase.dart';
import 'package:khiat/features/presentation/cubit/credential/credential_state.dart';

class CredentialCubit extends Cubit<CredentialState>{

  final SignUpUseCase signUpUseCase;
  final SignInUseCase signInUseCase;
  final GetCreateCurrentUseCase getCreateCurrentUserCase;

  CredentialCubit({required this.signInUseCase, required this.signUpUseCase, required this.getCreateCurrentUserCase}): super(CredentialInitial());

  Future<void> signUpSubmit({required UserEntity user}) async{

    emit(CredentialLoading());
    try{

      await signUpUseCase.call(UserEntity(email: user.email, password: user.password));
      await getCreateCurrentUserCase.call(user);
      emit(CredentialSuccess());
    }
    on SocketException catch(_){
      emit(CredentialFailure());
    }
    catch(_){
      emit(CredentialFailure());
    }

  }




}