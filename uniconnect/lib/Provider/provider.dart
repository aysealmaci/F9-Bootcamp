import 'package:flutter/material.dart';
import 'package:uniconnect/auth.dart';
import 'package:uniconnect/model/userModel.dart';

class AppProvider with ChangeNotifier{
  UserModel? _userModel;
  final Auth auth = Auth();

  UserModel? get getUserDetails => _userModel;

  Future<void> providerUserGet() async{
    _userModel = await auth.firebaseUserDetails();
    notifyListeners();
  }
}