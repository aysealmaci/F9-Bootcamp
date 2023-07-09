import 'dart:typed_data';

import 'package:cherry_toast/cherry_toast.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uniconnect/auth.dart';
import 'package:uniconnect/custom_widgets/image_picker.dart';
import 'package:uniconnect/screens/login.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  static const Color darkBlue = Color(0xff294c92);
  static const Color lightBlue = Color(0xff00b0ff);
  static const Color textColor = Color(0xff2d279d);
  Uint8List? _img;
  bool isLoading = false;

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

  signUpUser() async {
    setState(() {
      isLoading = true;
    });
    if (_img == null) {
      return showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: Text('Lütfen bir resim seç'),
          );
        },
      );
    }

    var res = await Auth().addUser(
      context,
      namecontroller.text,
      emailcontroller.text,
      passwordcontroller.text,
      _img!,
    );

    switch (res) {
      case 'success':
        _selectPost(context);
        break;
      case 'fail':
        CherryToast(
          title: Text('Bir hata oluştu'),
          icon: Icons.photo,
          themeColor: Colors.white,
        );
        break;
      default:
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
        body: _img != null
            ? SafeArea(
                child: Center(
                child: SingleChildScrollView(
                  child: Stack(children: [
                    Column(
                      children: [
                        Container(
                            height: size.height / 5,
                            alignment: Alignment.center,
                            child: Text(
                              "UniConnect",
                              style: TextStyle(
                                  fontFamily: "Lobster",
                                  fontSize: 30,
                                  color: darkBlue),
                            )),
                        Container(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 60,
                                ),
                                Text("Merhaba, UniConnect'e Hoşgeldin!",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: textColor,
                                      fontWeight: FontWeight.bold,
                                    )),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Text(
                                      "Lütfen paylaşım yapabilmek için Kayıt Ol!",
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: darkBlue,
                                      )),
                                ),
                                SizedBox(height: 25),
                                Text("Kayıt Ol",
                                    style: TextStyle(
                                        color: textColor,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold)),
                                SizedBox(
                                  height: 20,
                                ),
                                _img == null
                                    ? GestureDetector(
                                        onTap: () => _selectPost(context),
                                        child: CircleAvatar(
                                          maxRadius: 30,
                                          backgroundImage: NetworkImage(
                                              'https://images.unsplash.com/photo-1682685795557-976f03aca7b2?ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1171&q=80'),
                                        ),
                                      )
                                    : GestureDetector(
                                        onTap: () => _selectPost(context),
                                        child: CircleAvatar(
                                          maxRadius: 30,
                                          backgroundImage: MemoryImage(_img!),
                                        ),
                                      ),
                                SizedBox(
                                  height: 12,
                                ),
                                Container(
                                  height: 40,
                                  width: 250,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1, color: Colors.white),
                                    color: Colors.transparent,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15.0),
                                    child: TextField(
                                      controller: namecontroller,
                                      obscureText: false,
                                      style: TextStyle(
                                          fontSize: 15, color: darkBlue),
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Ad Soyad",
                                        hintStyle: TextStyle(
                                          color: darkBlue,
                                        ),
                                        prefixIcon:
                                            Icon(Icons.person, color: darkBlue),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  height: 40,
                                  width: 250,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1, color: Colors.white),
                                    color: Colors.transparent,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15.0),
                                    child: TextField(
                                      controller: emailcontroller,
                                      obscureText: false,
                                      style: TextStyle(
                                          fontSize: 15, color: darkBlue),
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Email",
                                        hintStyle: TextStyle(color: darkBlue),
                                        prefixIcon:
                                            Icon(Icons.mail, color: darkBlue),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  height: 40,
                                  width: 250,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1, color: Colors.white),
                                    color: Colors.transparent,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15.0),
                                    child: TextField(
                                      controller: passwordcontroller,
                                      obscureText: true,
                                      style: TextStyle(
                                        color: darkBlue,
                                        fontSize: 15,
                                      ),
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Parola",
                                        hintStyle: TextStyle(color: darkBlue),
                                        prefixIcon: Icon(Icons.password,
                                            color: darkBlue),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  height: 40,
                                  width: 250,
                                  decoration: BoxDecoration(
                                    color: darkBlue,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                  ),
                                  child: OutlinedButton(
                                      onPressed: signUpUser,
                                      style: OutlinedButton.styleFrom(
                                        foregroundColor: darkBlue,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                      child: isLoading ? Center(child: CircularProgressIndicator(color: Colors.white,),) : Text(
                                        "Kayıt Ol",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                        ),
                                      )),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 10.0),
                                  child: Container(
                                    height: 1.0,
                                    width: 250.0,
                                    color: darkBlue,
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  " Ya da aşağıdaki yöntemlerle devam et",
                                  style: TextStyle(
                                      color: darkBlue,
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                SizedBox(
                                  width: 150,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Icon(
                                        Icons.facebook,
                                        color: darkBlue,
                                        size: 30,
                                      ),
                                      InkWell(
                                        onTap: () => Auth().signInWithGoogle(),
                                        child: Container(
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: darkBlue),
                                            height: 30,
                                            width: 30,
                                            child: Image.asset(
                                                "assets/images/google.png")),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Zaten bir hesabın var mı? ",
                                      style: TextStyle(
                                          color: textColor, fontSize: 13),
                                    ),
                                    InkWell(
                                        onTap: () => Navigator.of(context)
                                                .push(MaterialPageRoute(
                                              builder: (context) => LoginPage(),
                                            )),
                                        child: Text(
                                          "Giriş Yap!",
                                          style: TextStyle(
                                              color: textColor,
                                              fontSize: 13,
                                              fontWeight: FontWeight.bold),
                                        )),
                                  ],
                                ),
                              ]),
                          decoration: const BoxDecoration(
                            color: lightBlue,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50),
                              topRight: Radius.circular(50),
                            ),
                          ),
                          width: double.infinity,
                          height: size.height / 5 * 4,
                        ),
                      ],
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(top: size.height / 5 - 60, right: 10),
                      child: Container(
                          alignment: Alignment.bottomRight,
                          height: 120,
                          child: Image.asset(
                            "assets/images/ders_ici.png",
                            fit: BoxFit.cover,
                          )),
                    ),
                  ]),
                ),
              ))
            : Column(
              mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: _img == null
                        ? GestureDetector(
                            onTap: () => _selectPost(context),
                            child: CircleAvatar(
                              maxRadius: 60,
                              backgroundImage: NetworkImage(
                                  'https://images.unsplash.com/photo-1682685795557-976f03aca7b2?ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1171&q=80'),
                            ),
                          )
                        : GestureDetector(
                            onTap: () => _selectPost(context),
                            child: CircleAvatar(
                              maxRadius: 60,
                              backgroundImage: MemoryImage(_img!),
                            ),
                          ),
                  ),
                  Text('Profil Resmi Seç')
                ],
              ));
  }
}
