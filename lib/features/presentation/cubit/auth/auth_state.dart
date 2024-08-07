
import 'package:equatable/equatable.dart';



abstract class AuthState extends Equatable{
  const AuthState();
}

class AuthInitial extends AuthState{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class Authenticated extends AuthState{

  final String uid;
  const Authenticated({required this.uid});

  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class UnAuthenticated extends AuthState{

  @override
  // TODO: implement props
  List<Object?> get props => [];

}