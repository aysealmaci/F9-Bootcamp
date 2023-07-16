import 'dart:typed_data';
import 'dart:async';
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

class _RegisterPageState extends State<RegisterPage>
    with TickerProviderStateMixin {
  late AnimationController firstCircleController;
  late AnimationController secondCircleController;
  late AnimationController thirdCircleController;
  late Animation<double> firstCircleRadiusAnimation;
  late Animation<double> firstCircleOpacityAnimation;
  late Animation<double> firstCircleWidthAnimation;
  late Animation<double> secondCircleRadiusAnimation;
  late Animation<double> secondCircleOpacityAnimation;
  late Animation<double> secondCircleWidthAnimation;
  late Animation<double> thirdCircleRadiusAnimation;
  late Animation<double> thirdCircleOpacityAnimation;
  late Animation<double> thirdCircleWidthAnimation;

  @override
  void initState() {
    firstCircleController = AnimationController(
      vsync: this,
      duration: Duration(
        seconds: 2,
      ),
    );

    firstCircleRadiusAnimation = Tween<double>(begin: 70, end: 150).animate(
      CurvedAnimation(
        parent: firstCircleController,
        curve: Curves.ease,
      ),
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          firstCircleController.repeat();
        } else if (status == AnimationStatus.dismissed) {
          firstCircleController.forward();
        }
      });

    firstCircleOpacityAnimation = Tween<double>(begin: 1, end: 0).animate(
      CurvedAnimation(
        parent: firstCircleController,
        curve: Curves.ease,
      ),
    );

    firstCircleWidthAnimation = Tween<double>(begin: 10, end: 0).animate(
      CurvedAnimation(
        parent: firstCircleController,
        curve: Curves.ease,
      ),
    );

    secondCircleController = AnimationController(
      vsync: this,
      duration: Duration(
        seconds: 2,
      ),
    );

    secondCircleRadiusAnimation = Tween<double>(begin: 70, end: 150).animate(
      CurvedAnimation(
        parent: secondCircleController,
        curve: Curves.ease,
      ),
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          secondCircleController.repeat();
        } else if (status == AnimationStatus.dismissed) {
          secondCircleController.forward();
        }
      });

    secondCircleOpacityAnimation = Tween<double>(begin: 1, end: 0).animate(
      CurvedAnimation(
        parent: secondCircleController,
        curve: Curves.ease,
      ),
    );

    secondCircleWidthAnimation = Tween<double>(begin: 10, end: 0).animate(
      CurvedAnimation(
        parent: secondCircleController,
        curve: Curves.ease,
      ),
    );

    thirdCircleController = AnimationController(
      vsync: this,
      duration: Duration(
        seconds: 2,
      ),
    );

    thirdCircleRadiusAnimation = Tween<double>(begin: 70, end: 150).animate(
      CurvedAnimation(
        parent: thirdCircleController,
        curve: Curves.ease,
      ),
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          thirdCircleController.repeat();
        } else if (status == AnimationStatus.dismissed) {
          thirdCircleController.forward();
        }
      });

    thirdCircleOpacityAnimation = Tween<double>(begin: 1, end: 0).animate(
      CurvedAnimation(
        parent: thirdCircleController,
        curve: Curves.ease,
      ),
    )..addListener(
        () {
          setState(() {});
        },
      );

    thirdCircleWidthAnimation = Tween<double>(begin: 10, end: 0).animate(
      CurvedAnimation(
        parent: thirdCircleController,
        curve: Curves.ease,
      ),
    );

    firstCircleController.forward();
    Timer(
      Duration(milliseconds: 765),
      () => secondCircleController.forward(),
    );

    Timer(
      Duration(milliseconds: 1050),
      () => thirdCircleController.forward(),
    );

    super.initState();
  }

  @override
  void dispose() {
    firstCircleController.dispose();
    secondCircleController.dispose();
    thirdCircleController.dispose();

    super.dispose();
  }

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

    await Auth().addUser(
      context,
      namecontroller.text,
      emailcontroller.text,
      passwordcontroller.text,
      _img!,
    );

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: _img == null ? lightBlue : Colors.white,
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
                                SizedBox(height: 20),
                                Text("Kayıt Ol",
                                    style: TextStyle(
                                        color: textColor,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold)),
                                SizedBox(
                                  height: 10,
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
                                      child: isLoading
                                          ? Center(
                                              child: CircularProgressIndicator(
                                                color: Colors.white,
                                              ),
                                            )
                                          : Text(
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
            : SafeArea(
                child: SingleChildScrollView(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            top: 100,
                            bottom: 20,
                          ),
                          child: Text('Başlamadan Önce',
                              style: TextStyle(
                                fontSize: 20,
                                color: textColor,
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.only(bottom: size.height / 2 - 200),
                          child: Text('Profil Resmi Seç',
                              style: TextStyle(
                                fontSize: 15,
                                color: textColor,
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                        _img == null
                            ? Stack(
                                alignment: Alignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: () => _selectPost(context),
                                    child: CircleAvatar(
                                      maxRadius: 60,
                                      backgroundImage: NetworkImage(
                                          'https://images.unsplash.com/photo-1682685795557-976f03aca7b2?ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1171&q=80'),
                                    ),
                                  ),
                                  CustomPaint(
                                    painter: MyPainter(
                                      firstCircleRadiusAnimation.value,
                                      firstCircleOpacityAnimation.value,
                                      firstCircleWidthAnimation.value,
                                      secondCircleRadiusAnimation.value,
                                      secondCircleOpacityAnimation.value,
                                      secondCircleWidthAnimation.value,
                                      thirdCircleRadiusAnimation.value,
                                      thirdCircleOpacityAnimation.value,
                                      thirdCircleWidthAnimation.value,
                                    ),
                                  ),
                                ],
                              )
                            : GestureDetector(
                                onTap: () => _selectPost(context),
                                child: CircleAvatar(
                                  maxRadius: 60,
                                  backgroundImage: MemoryImage(_img!),
                                ),
                              )
                      ],
                    ),
                  ),
                ),
              ));
  }
}

class MyPainter extends CustomPainter {
  final double firstCircleRadius;
  final double firstCircleOpacity;
  final double firstCircleStrokeWidth;
  final double secondCircleRadius;
  final double secondCircleOpacity;
  final double secondCircleStrokeWidth;
  final double thirdCircleRadius;
  final double thirdCircleOpacity;
  final double thirdCircleStrokeWidth;

  MyPainter(
    this.firstCircleRadius,
    this.firstCircleOpacity,
    this.firstCircleStrokeWidth,
    this.secondCircleRadius,
    this.secondCircleOpacity,
    this.secondCircleStrokeWidth,
    this.thirdCircleRadius,
    this.thirdCircleOpacity,
    this.thirdCircleStrokeWidth,
  );

  @override
  void paint(Canvas canvas, Size size) {
    Color myColor = Colors.white;

    Paint firstPaint = Paint();
    firstPaint.color = myColor.withOpacity(firstCircleOpacity);
    firstPaint.style = PaintingStyle.stroke;
    firstPaint.strokeWidth = firstCircleStrokeWidth;

    canvas.drawCircle(Offset.zero, firstCircleRadius, firstPaint);

    Paint secondPaint = Paint();
    secondPaint.color = myColor.withOpacity(secondCircleOpacity);
    secondPaint.style = PaintingStyle.stroke;
    secondPaint.strokeWidth = secondCircleStrokeWidth;

    canvas.drawCircle(Offset.zero, secondCircleRadius, secondPaint);

    Paint thirdPaint = Paint();
    thirdPaint.color = myColor.withOpacity(thirdCircleOpacity);
    thirdPaint.style = PaintingStyle.stroke;
    thirdPaint.strokeWidth = thirdCircleStrokeWidth;

    canvas.drawCircle(Offset.zero, thirdCircleRadius, thirdPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
