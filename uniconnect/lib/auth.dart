import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:uniconnect/custom_widgets/error_message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Auth {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  ErrorMessage errorMessage = ErrorMessage();

  Future<void> signIn(
      BuildContext context, String email, String password) async {
    String? result;
    if (email.trim().isEmpty) {
      result = "Email boş bırakılamaz.";
    } else if (password.trim().isEmpty) {
      result = "Şifre boş bırakılamaz.";
    } else {
      try {
        await firebaseAuth.signInWithEmailAndPassword(
            email: email, password: password);
        result = "success";
      } on FirebaseAuthException catch (error) {
        result = error.message.toString();
      }
    }
    if (result ==
        "The password is invalid or the user does not have a password.") {
      return errorMessage.cherry_toast(
          context, "HATA", "Geçersiz parola.", Icons.info, Colors.red);
    } else if (result ==
        "There is no user record corresponding to this identifier. The user may have been deleted.") {
      return errorMessage.cherry_toast(
          context, "HATA", "Kullanıcı bulunamadı.", Icons.info, Colors.red);
    } else if (result == "Email boş bırakılamaz." ||
        result == "Şifre boş bırakılamaz.") {
      return errorMessage.cherry_toast(
          context, "HATA", result, Icons.info, Colors.red);
    } else if (result == "The email address is badly formatted.") {
      return errorMessage.cherry_toast(
          context, "HATA", "Geçersiz email.", Icons.info, Colors.red);
    }
  }

  Future<dynamic> addUser(
      BuildContext context, String name, String email, String password) async {
    String? result;
    if (name.trim().isEmpty) {
      result = "Ad Soyad boş bırakılamaz.";
    } else if (email.trim().isEmpty) {
      result = "Email boş bırakılamaz.";
    } else if (password.trim().isEmpty) {
      result = "Şifre boş bırakılamaz.";
    } else {
      try {
        var user = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        FirebaseFirestore.instance
            .collection('user')
            .doc(user.user!.uid)
            .set({'name': name, 'email': email});
        result = "success";
      } on FirebaseAuthException catch (error) {
        result = error.code;
      }
    }
    if (context.mounted) {
      if (result != "success") {
        errorMessage.cherry_toast(
            context, "HATA", result, Icons.info, Colors.red);
      } else {
        errorMessage.cherry_toast(context, "Aramıza Hoşgeldin",
            "Kayıt olduğun için teşekkürler.", Icons.check, Colors.green);
      }
    }
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
