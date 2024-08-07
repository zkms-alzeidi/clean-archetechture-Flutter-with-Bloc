


import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:khiat/features/domain/use_cases/get_current_uid_usecase.dart';
import 'package:khiat/features/domain/use_cases/is_sign_in_usecase.dart';
import 'package:khiat/features/domain/use_cases/sign_out_usecase.dart';
import 'package:khiat/features/presentation/cubit/auth/auth_state.dart';


class AuthCubit extends Cubit<AuthState>{

  final IsSignInUseCase isSignInUseCase;
  final SignOutUseCase signOutUseCase;
  final GetCurrentUidUseCase getCurrentUIDUseCase;


  AuthCubit({required this.isSignInUseCase, required this.getCurrentUIDUseCase, required this.signOutUseCase}): super(AuthInitial());

  Future<void> appStart() async{

    try{

      bool isSignIn= await isSignInUseCase.call();
      print("is Sign in? $isSignIn");

      if(isSignIn){

        final uid= await getCurrentUIDUseCase.call();

        emit(Authenticated(uid: uid));
      }else{
        emit(UnAuthenticated());
      }


    }
    catch(_){
      emit(UnAuthenticated());
    }

  }

  Future<void> loggedIn() async{

    try{
      final uid= await getCurrentUIDUseCase.call();
      print("user Id $uid");

      emit(Authenticated(uid: uid));
    }
    catch(_){
      print("user Id null");
      emit(UnAuthenticated());
    }

  }

  Future<void> loggedOut()async {
    try {
      await signOutUseCase.call();
      emit(UnAuthenticated());
    } catch (_) {
      emit(UnAuthenticated());
    }
  }


}