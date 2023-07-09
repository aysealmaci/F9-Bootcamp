import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:uniconnect/Firebase_method/store.dart';
import 'package:uniconnect/Provider/provider.dart';
import 'package:uniconnect/custom_widgets/error_message.dart';
import 'package:uniconnect/custom_widgets/image_picker.dart';
import 'package:uniconnect/model/userModel.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({Key? key}) : super(key: key);

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {

  Uint8List? _img;
  TextEditingController _postText = TextEditingController();
  bool isLoading = false;


  void _postAdd(
    String name,
    String photoUser,
    String uid
  ) async{
    setState(() {
      isLoading = true;
    });
    String res = await StoreMethod().postAdd(name, _postText.text, uid, photoUser, _img!);

    if(res == 'Başarılı'){
      setState(() {
        isLoading = false;
      });

      ErrorMessage().cherry_toast(context, 'Post', 'Paylaşıldı', Icons.pivot_table_chart_outlined, Colors.green);
    }else{
      setState(() {
        isLoading = false;
      });

      ErrorMessage().cherry_toast(context, 'Post', 'Paylaşılamadı', Icons.pivot_table_chart_outlined, Colors.red);
    }
  }

  _selectPost(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: Text("Bir Fotoğraf Seç"),
          children: [
            SimpleDialogOption(
              child: Text("Galeriden Seç"),
              onPressed: () async {
                Navigator.of(context).pop();
                Uint8List file = await selectPickImage(ImageSource.gallery);
                setState(() {
                  _img = file;
                });
              },
            ),
            SimpleDialogOption(
              child: Text("Kameradan Çek"),
              onPressed: () async {
                Navigator.of(context).pop();
                Uint8List file = await selectPickImage(ImageSource.camera);
                setState(() {
                  _img = file;
                });
              },
            ),
            SimpleDialogOption(
              child: Text("İptal"),
              onPressed: () async {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void clear(){
    setState(() {
      _img = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    final UserModel? user = Provider.of<AppProvider>(context).getUserDetails;
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          _img == null ? CupertinoButton(child: Icon(Icons.panorama_sharp), onPressed: () => _selectPost(context)) :
           CircleAvatar(
            maxRadius: 60,
            backgroundImage: MemoryImage(_img!),
          ),
          TextField(controller: _postText,),
          ElevatedButton(onPressed: () => _postAdd(user!.name!, user.photoUrl!, user.uid!), child: Text('Paylaş')),
          ElevatedButton(onPressed: clear, child: Text('iptal')),
        ],
      ),
    );
  }
}