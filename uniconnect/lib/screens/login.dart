import 'package:flutter/material.dart';
import 'package:uniconnect/auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Auth authService = Auth();
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xff5de4ff), Color(0xffCC8df7)])),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
              child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.transparent,
                          border: Border.all(
                              width: 1, color: Colors.white.withOpacity(0.5))),
                      width: 350,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.transparent,
                          border: Border.all(
                              width: 1, color: Colors.white.withOpacity(0.5))),
                      width: 300,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.transparent,
                          border: Border.all(
                              width: 1, color: Colors.white.withOpacity(0.5))),
                      width: 250,
                    ),
                    Container(
                      child: Column(children: [
                        SizedBox(height: 35),
                        Text("Giriş Yap",
                            style: TextStyle(
                                color: Color(0xff294c92),
                                fontSize: 20,
                                fontWeight: FontWeight.bold)),
                        SizedBox(
                          height: 25,
                        ),
                        Container(
                          height: 40,
                          width: 250,
                          decoration: BoxDecoration(
                            border:
                                Border.all(width: 1, color: Color(0xff294c92)),
                            color: Colors.transparent,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 15.0),
                            child: TextField(
                              controller: emailcontroller,
                              obscureText: false,
                              style: TextStyle(
                                  fontSize: 15, color: Color(0xff294c92)),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Email",
                                hintStyle: TextStyle(color: Color(0xff294c92)),
                                prefixIcon:
                                    Icon(Icons.mail, color: Color(0xff294c92)),
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
                            border:
                                Border.all(width: 1, color: Color(0xff294c92)),
                            color: Colors.transparent,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 15.0),
                            child: TextField(
                              controller: passwordcontroller,
                              obscureText: true,
                              style: TextStyle(
                                color: Color(0xff294c92),
                                fontSize: 15,
                              ),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Şifre",
                                hintStyle: TextStyle(color: Color(0xff294c92)),
                                prefixIcon: Icon(Icons.password,
                                    color: Color(0xff294c92)),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.only(right: 135),
                          child: GestureDetector(
                              /*onTap: () => Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => sifremiUnuttum(),
                                  )),*/
                              child: Text("Şifreni mi Unuttun?",
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Color(0xff294c92),
                                  ))),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 40,
                          width: 250,
                          decoration: BoxDecoration(
                            color: Color(0xff294c92),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: OutlinedButton(
                              onPressed: () {
                                authService.signIn(
                                    context,
                                    emailcontroller.text,
                                    passwordcontroller.text);
                              },
                              style: OutlinedButton.styleFrom(
                                foregroundColor: Color(0xff4187f4),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: Text(
                                "Giriş Yap",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                              )),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.0),
                              child: Container(
                                height: 1.0,
                                width: 60.0,
                                color: Color(0xff294c92),
                              ),
                            ),
                            Text(
                              " Ya da ",
                              style: TextStyle(
                                  color: Color(0xff294c92),
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.0),
                              child: Container(
                                height: 1.0,
                                width: 60.0,
                                color: Color(0xff294c92),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        SizedBox(
                          width: 180,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Icon(
                                Icons.facebook,
                                color: Color(0xff294c92),
                                size: 30,
                              ),
                              GestureDetector(
                                child: Container(
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Color(0xff294c92)),
                                    height: 30,
                                    width: 30,
                                    child: Icon(
                                      Icons.email,
                                      color: Colors.white,
                                      size: 20,
                                    )),
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
                              "Hesabın yok mu? ",
                              style: TextStyle(
                                  color: Color(0xff294c92), fontSize: 13),
                            ),
                            GestureDetector(
                                child: Text(
                              "Şimdi Kaydol!",
                              style: TextStyle(
                                  color: Color(0xff294c92),
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold),
                            )),
                          ],
                        )
                      ]),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.white.withOpacity(0.65),
                      ),
                      width: 340,
                      height: 415,
                    ),
                  ],
                ),
              ),
            ),
          )),
        ),
      ),
    );
  }
}
