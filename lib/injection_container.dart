
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';
import 'package:khiat/features/data/remote/data_sources/firebase_remote_data_source.dart';
import 'package:khiat/features/data/remote/data_sources/firebase_remote_data_source_impl.dart';
import 'package:khiat/features/data/repositories/firebase_repository_impl.dart';
import 'package:khiat/features/domain/repositories/firebase_repository.dart';
import 'package:khiat/features/domain/use_cases/get_create_current_usecase.dart';
import 'package:khiat/features/domain/use_cases/get_current_uid_usecase.dart';
import 'package:khiat/features/domain/use_cases/is_sign_in_usecase.dart';
import 'package:khiat/features/domain/use_cases/sign_in_usecase.dart';
import 'package:khiat/features/domain/use_cases/sign_out_usecase.dart';
import 'package:khiat/features/domain/use_cases/sign_up_usecase.dart';
import 'package:khiat/features/presentation/cubit/auth/auth_cubit.dart';
import 'package:khiat/features/presentation/cubit/credential/credential_cubit.dart';


final sl= GetIt.instance;

Future<void> init() async{


  //Future bloc
  sl.registerFactory<AuthCubit>(
      ()=> AuthCubit(
          isSignInUseCase: sl.call(),
          getCurrentUIDUseCase: sl.call(),
          signOutUseCase: sl.call())
  );

  sl.registerFactory(()=> CredentialCubit(
      signInUseCase: sl.call(),
      signUpUseCase: sl.call(),
      getCreateCurrentUserCase: sl.call()));

  //UseCases
  sl.registerLazySingleton(()=>GetCreateCurrentUseCase(repository: sl.call()) );
  sl.registerLazySingleton(()=>GetCurrentUidUseCase(repository: sl.call()));
  sl.registerLazySingleton(()=> IsSignInUseCase(repository: sl.call()));
  sl.registerLazySingleton(()=> SignInUseCase(repository: sl.call()));
  sl.registerLazySingleton(()=> SignOutUseCase(repository: sl.call()));
  sl.registerLazySingleton(()=> SignUpUseCase(repository: sl.call()));


  //Repository
 // sl.registerLazySingleton(()=> FirebaseRepository);


/*
  final auth = FirebaseAuth.instance;

  final fireStore= FirebaseFirestore.instance;

  sl.registerLazySingleton(()=> aut h);
  sl.registerLazySingleton(()=> fireStore);


 */

  //Firebase.initializeApp();
  //Repository
  sl.registerLazySingleton<FirebaseRepository>(
          () => FirebaseRepositoryImpl(firebaseRemoteDataSource: sl.call()));

  //Remote DataSource
  sl.registerLazySingleton<FirebaseRemoteDataSource>(
          () => FirebaseRemoteDataSourceImpl(sl.call(), sl.call()));

  //External
  final auth = FirebaseAuth.instance;
  final fireStore = FirebaseFirestore.instance;




  sl.registerLazySingleton(() => auth);
  sl.registerLazySingleton(() => fireStore);




}