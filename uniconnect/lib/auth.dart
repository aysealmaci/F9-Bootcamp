import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:uniconnect/Firebase_method/storage.dart';
import 'package:uniconnect/custom_widgets/error_message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uniconnect/model/userModel.dart';
import 'package:uniconnect/screens/anasayfa.dart';
import 'package:uniconnect/screens/login.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Auth {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  ErrorMessage errorMessage = ErrorMessage();

  Future<UserModel> firebaseUserDetails() async {
    User? user = firebaseAuth.currentUser;

    DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
        .collection("user")
        .doc(user!.uid)
        .get();

    return UserModel.fromSnap(documentSnapshot);
  }

  Future<void> signIn(
      BuildContext context, String email, String password) async {
    String? result;
    if (email.trim().isEmpty) {
      result = "Email boş bırakılamaz.";
    } else if (password.trim().isEmpty) {
      result = "Parola boş bırakılamaz.";
    } else {
      try {
        await firebaseAuth.signInWithEmailAndPassword(
            email: email, password: password);
        result = "success";
      } on FirebaseAuthException catch (error) {
        result = error.message.toString();
      }
    }
    switch (result) {
      case "success":
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AnaSayfa()),
        );
        break;
      case "The password is invalid or the user does not have a password.":
        errorMessage.cherry_toast(
          context,
          "HATA",
          "Geçersiz parola.",
          Icons.info,
          Colors.red,
        );
        break;
      case "There is no user record corresponding to this identifier. The user may have been deleted.":
        errorMessage.cherry_toast(
          context,
          "HATA",
          "Kullanıcı bulunamadı.",
          Icons.info,
          Colors.red,
        );
        break;
      case "Email boş bırakılamaz.":
      case "Parola boş bırakılamaz.":
        errorMessage.cherry_toast(
          context,
          "HATA",
          result,
          Icons.info,
          Colors.red,
        );
        break;
      case "The email address is badly formatted.":
        errorMessage.cherry_toast(
          context,
          "HATA",
          "Geçersiz email.",
          Icons.info,
          Colors.red,
        );
        break;
      default:
        errorMessage.cherry_toast(
          context,
          "HATA",
          "",
          Icons.info,
          Colors.red,
        );
        break;
    }
  }

  Future<void> addUser(BuildContext context, String name, String email,
      String password, Uint8List file) async {
    String? result;
    if (name.trim().isEmpty) {
      result = "Ad soyad boş bırakılamaz.";
    } else if (email.trim().isEmpty) {
      result = "Email boş bırakılamaz.";
    } else if (password.trim().isEmpty) {
      result = "Parola boş bırakılamaz.";
    } else {
      try {
        var user = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);

        String photoUrl =
            await StorageMethod().photoAddStorage('userProfile', file, false);

        UserModel userModel = UserModel(
            name: name,
            email: email,
            password: password,
            photoUrl: photoUrl,
            uid: user.user!.uid);

        FirebaseFirestore.instance
            .collection('user')
            .doc(user.user!.uid)
            .set(userModel.toJson());
        result = "success";
      } on FirebaseAuthException catch (error) {
        result = error.code;
      }
    }
    if (context.mounted) {
      print("add user " + result);

      switch (result) {
        case "success":
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => LoginPage()));
          errorMessage.cherry_toast(context, "Aramıza Hoşgeldin",
              "Kayıt olduğun için teşekkürler.", Icons.check, Colors.green);
          break;

        case "invalid-email":
          errorMessage.cherry_toast(
              context, "HATA", "Geçersiz email.", Icons.info, Colors.red);
          break;

        case "Email boş bırakılamaz.":
        case "Parola boş bırakılamaz.":
        case "Ad soyad boş bırakılamaz.":
          errorMessage.cherry_toast(
              context, "HATA", result, Icons.info, Colors.red);
          break;

        case "weak-password":
          errorMessage.cherry_toast(context, "HATA",
              "Parola en az 6 karakter içermelidir.", Icons.info, Colors.red);
          break;

        case "email-already-in-use":
          errorMessage.cherry_toast(context, "HATA",
              "Bu email daha önce kullanılmıştır.", Icons.info, Colors.red);
          break;
        default:
          errorMessage.cherry_toast(
              context, "HATA", "", Icons.info, Colors.red);
          break;
      }
    }
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  Future resetPassword(BuildContext context, String email) async {
    var result;
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email.trim());
      result = "success";
    } on FirebaseAuthException catch (error) {
      result = error.message.toString();
    }
    print(result);
    switch (result) {
      case "The email address is badly formatted.":
        errorMessage.cherry_toast(
          context,
          "HATA",
          "Geçersiz email.",
          Icons.info,
          Colors.red,
        );
        break;
      case "Given String is empty or null":
        errorMessage.cherry_toast(
          context,
          "HATA",
          "Email boş bırakılamaz.",
          Icons.info,
          Colors.red,
        );
        break;

      case "There is no user record corresponding to this identifier. The user may have been deleted.":
        errorMessage.cherry_toast(
          context,
          "HATA",
          "Kullanıcı bulunamadı.",
          Icons.info,
          Colors.red,
        );
        break;
      case "success":
        errorMessage.cherry_toast(
          context,
          "BAŞARILI",
          "Parola sıfırlama linki mail adresine yollandı.",
          Icons.check,
          Colors.green,
        );
        break;
      default:
        errorMessage.cherry_toast(
          context,
          "HATA",
          "",
          Icons.info,
          Colors.red,
        );
        break;
    }
  }

  signInWithGoogle() async {
    final GoogleSignInAccount? user = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication auth = await user!.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: auth.accessToken,
      idToken: auth.idToken,
    );

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
