import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:uniconnect/custom_widgets/alert.dart';

class Auth {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  alert _alertDialog = alert();

  Future<void> signIn(
      BuildContext context, String email, String password) async {
    String? result;
    if (email.trim().isEmpty) {
      result = "Email alanı boş bırakılamaz.";
    } else if (password.trim().isEmpty) {
      result = "Şifre alanı boş bırakılamaz.";
    } else {
      try {
        await firebaseAuth.signInWithEmailAndPassword(
            email: email, password: password);
        result = "success";
      } on FirebaseAuthException catch (error) {
        result = error.message.toString();
      }
    }
    print(result);
    if (result ==
        "The password is invalid or the user does not have a password.") {
      return _alertDialog.alertDialog(context, "HATA", "Geçersiz parola.");
    } else if (result ==
        "There is no user record corresponding to this identifier. The user may have been deleted.") {
      return _alertDialog.alertDialog(context, "HATA", "Kullanıcı bulunamadı.");
    } else if (result == "Email alanı boş bırakılamaz." ||
        result == "Şifre alanı boş bırakılamaz.") {
      return _alertDialog.alertDialog(context, "HATA", result);
    } else if (result == "The email address is badly formatted.") {
      return _alertDialog.alertDialog(context, "HATA", "Geçersiz email.");
    }
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
