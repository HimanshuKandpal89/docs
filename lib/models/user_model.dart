import 'dart:convert';

class UserModel{
  final String name;
  final String email;
  final String profilepic;
  final String token;
  final String  uid;

  UserModel({
  required this.name,
  required this.email,
  required this.profilepic,
  required  this.uid,
  required this.token}
    );
 
 Map<String, dynamic> toMap(){
  return {
   'name': name,  
   'email' : email ,
   'profile_picture' : profilepic,
    'uid' : uid,
    'token': token
 };
}

factory UserModel.fromMap(Map<String,dynamic> map){
  return UserModel(
    name: map['name'] ?? '',
     email:  map['email'] ?? '', 
     profilepic:  map['profilepic'] ?? '', 
     uid:  map['uid'] ?? '', 
     token:  map['token'] ?? '');
}

String toJson() => json.encode(toMap());

factory UserModel.fromjson(String source) => UserModel.fromMap(json.decode(source));

UserModel copyWith({
  String? name,
  String? email,      
  String? profilepic,
  String? uid,
  String? token,
}){
  return UserModel(
    name: name ?? this.name,
    email: email?? this.email, 
    profilepic: profilepic ?? this.profilepic,
    uid: uid ?? this.uid,
    token: token ?? this.token
  );
}
 
}