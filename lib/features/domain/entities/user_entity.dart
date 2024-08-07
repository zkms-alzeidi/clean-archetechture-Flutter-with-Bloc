

import 'package:equatable/equatable.dart';

class UserEntity extends Equatable{

  final String name;
  final String email;
  final String phoneNumber;
  final bool isOnline;
  final String uid;
  final String password;
  final String profileUrl;
  final String gender;

  const UserEntity({
   this.name="",
   this.email="",
   this.password="",
   this.uid="",
    this.gender="",
    this.isOnline=false,
    this.phoneNumber="",
    this.profileUrl="",
});

  @override
  // TODO: implement props
  List<Object?> get props =>[
    name,
    email,
    phoneNumber,
    isOnline,
    password,
    uid,
    gender,
    profileUrl,
  ];

}