


import 'package:khiat/features/domain/entities/user_entity.dart';

class UserModel extends UserEntity {

 const UserModel({
  super.name= "username",
  super.email,
  super.phoneNumber,
  super.uid,
  super.profileUrl,

});

 factory UserModel.fromJson( Map<String, dynamic> json){
  return UserModel(
  name: json['name'],
   profileUrl: json['profileUrl'],
   email: json['email'],
   phoneNumber: json['phoneNumber'],
   uid: json['uid'],

  );
 }

 Map<String, dynamic> toDocument(){

  return{
   "name": name,
   "email": email,
   "phoneNumber": phoneNumber,
   "profileUrl": profileUrl,
   "uid": uid,

  };

 }

 }