import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uniconnect/Firebase_method/storage.dart';
import 'package:uniconnect/model/postMethod.dart';
import 'package:uuid/uuid.dart';

class StoreMethod{
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> postAdd(
    String name,
    String description,
    String uid,
    String profImage,
    Uint8List file
  ) async{
    String res = 'Post paylaşırken hata oluştu';
    try {
      String photoUrl = await StorageMethod().photoAddStorage('DersiçiPost', file, true);

      String postId = Uuid().v1();

      PostModel postModel = PostModel(
        name: name,
        description: description,
        uid: uid,
        datePublished: DateTime.now(),
        postId: postId,
        postUrl: photoUrl,
        profImage: profImage,
        like: []
      );

      _firestore.collection('DersiçiPost').doc(postId).set(postModel.toJson());

      res = 'Başarılı';
    } catch (e) {
      res = e.toString();
    }
    return res;
  }


  Future<String> postAddTwo(
    String name,
    String description,
    String uid,
    String profImage,
    Uint8List file
  ) async{
    String res = 'Post paylaşırken hata oluştu';
    try {
      String photoUrl = await StorageMethod().photoAddStorage('DersdisiPost', file, true);

      String postId = Uuid().v1();

      PostModel postModel = PostModel(
        name: name,
        description: description,
        uid: uid,
        datePublished: DateTime.now(),
        postId: postId,
        postUrl: photoUrl,
        profImage: profImage,
        like: []
      );

      _firestore.collection('DersdisiPost').doc(postId).set(postModel.toJson());

      res = 'Başarılı';
    } catch (e) {
      res = e.toString();
    }
    return res;
  }
}