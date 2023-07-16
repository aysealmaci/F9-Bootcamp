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
import 'package:uniconnect/screens/profile_page.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({Key? key}) : super(key: key);

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  Uint8List? _img;
  TextEditingController _postText = TextEditingController();
  bool isLoading = false;

  void _postAdd(String name, String photoUser, String uid) async {
    setState(() {
      isLoading = true;
    });
    String res = await StoreMethod()
        .postAdd(name, _postText.text, uid, photoUser, _img!);

    if (res == 'Başarılı') {
      setState(() {
        isLoading = false;
      });

      ErrorMessage().cherry_toast(context, 'Post', 'Paylaşıldı',
          Icons.pivot_table_chart_outlined, Colors.green);
    } else {
      setState(() {
        isLoading = false;
      });

      ErrorMessage().cherry_toast(context, 'Post', 'Paylaşılamadı',
          Icons.pivot_table_chart_outlined, Colors.red);
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

  void clear() {
    setState(() {
      _img = null;
    });
  }

  static const Color darkBlue = Color(0xff294c92);
  static const Color lightBlue = Color(0xff00b0ff);
  static const Color textColor = Color(0xff2d279d);
  @override
  Widget build(BuildContext context) {
    Size appSize = MediaQuery.of(context).size;
    final UserModel? user = Provider.of<AppProvider>(context).getUserDetails;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: appSize.height / 2.5,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 154, 223, 255),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.zero,
                        topRight: Radius.zero,
                        bottomLeft: Radius.circular(50),
                        bottomRight: Radius.circular(50))),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Text(
                        "UniConnect",
                        style: TextStyle(
                            fontFamily: "Lobster",
                            fontSize: 30,
                            color: darkBlue),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Container(
                            height: 37,
                            width: 70,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30)),
                            child: TextButton(
                                onPressed: () {},
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.arrow_back_ios,
                                      color: Colors.black,
                                    ),
                                    Text(
                                      "Geri",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ],
                                )),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ProfilePage()));
                            },
                            child: CircleAvatar(
                              backgroundColor: Color(0xffE6E6E6),
                              radius: 30,
                              child: Icon(
                                Icons.person,
                                size: 35,
                                color: Color.fromARGB(255, 53, 73, 255),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Ne Düşünüyorsun?",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color:
                                        const Color.fromARGB(255, 7, 33, 72)),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                "Toplulukla bir şeyler\npaylaş!",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            height: 100,
                            child: Image.asset(
                              "assets/images/Arrow2.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                          Container(
                            height: 70,
                            child: Image.asset(
                              "assets/images/post.png",
                              fit: BoxFit.cover,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                  height: 200,
                  width: appSize.width - 50,
                  decoration: BoxDecoration(
                      border: Border.all(color: lightBlue),
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    children: [
                      _img == null
                          ? CupertinoButton(
                              child: Icon(Icons.panorama_sharp),
                              onPressed: () => _selectPost(context))
                          : CircleAvatar(
                              maxRadius: 60,
                              backgroundImage: MemoryImage(_img!),
                            ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: _postText,
                          decoration: new InputDecoration.collapsed(
                              hintText: 'Bir şeyler paylaş',
                              hintStyle: TextStyle(fontSize: 12)),
                        ),
                      ),
                    ],
                  )),
              Padding(
                padding: const EdgeInsets.only(left: 25, right: 25, top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                        child: Container(
                            height: 40,
                            width: 120,
                            child: Align(
                                child: Text(
                                  'Paylaş',
                                  style: TextStyle(color: Colors.white),
                                ),
                                alignment: Alignment.center),
                            decoration: BoxDecoration(
                                color: darkBlue,
                                borderRadius: BorderRadius.circular(10))),
                        onTap: () =>
                            _postAdd(user!.name!, user.photoUrl!, user.uid!)),
                    InkWell(
                        child: Container(
                            height: 40,
                            width: 120,
                            child: Align(
                                child: Text(
                                  'İptal',
                                  style: TextStyle(color: Colors.white),
                                ),
                                alignment: Alignment.center),
                            decoration: BoxDecoration(
                                color: darkBlue,
                                borderRadius: BorderRadius.circular(10))),
                        onTap: () => clear),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
