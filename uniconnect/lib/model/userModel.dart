import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel{
  final String? name;
  final String? email;
  final String? password;
  final String? photoUrl;
  final String? uid;

  UserModel({
    required this.name,
    required this.email,
    required this.password,
    required this.photoUrl,
    required this.uid,

  });

  Map<String,dynamic> toJson() => {
    "name":name,
    "email":email,
    "password":password,
    "photoUrl":photoUrl,
    "uid":uid,
  };

  static UserModel fromSnap(DocumentSnapshot documentSnapshot){
    var snap = documentSnapshot.data() as Map<String,dynamic>?;

    return UserModel(
      name: snap?["name"],
      email: snap?["email"],
      password: snap?["password"],
      photoUrl: snap?["photoUrl"],
      uid: snap?["uid"],
    );
  }
}