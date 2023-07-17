import 'package:flutter/material.dart';
import 'package:uniconnect/auth.dart';
import 'package:uniconnect/screens/login.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final TextEditingController emailcontroller = TextEditingController();
  static const Color darkBlue = Color(0xff294c92);
  static const Color lightBlue = Color(0xff00b0ff);
  static const Color textColor = Color(0xff2d279d);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
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
                          fontFamily: "Lobster", fontSize: 30, color: darkBlue),
                    )),
                Container(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 60,
                        ),
                        Text("Girişte sorun mu yaşıyorsun?",
                            style: TextStyle(
                              fontSize: 20,
                              color: textColor,
                              fontWeight: FontWeight.bold,
                            )),
                        Padding(
                          padding: const EdgeInsets.only(top: 25),
                          child: SizedBox(
                            width: size.width - 90,
                            child: Text(
                                "Lütfen parolanızı sıfırlamak için aşağıdaki alana email adresinizi giriniz.",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                )),
                          ),
                        ),
                        SizedBox(height: 25),
                        SizedBox(
                          width: size.width - 90,
                          child: Text("Email adresiniz",
                              style: TextStyle(
                                  color: textColor,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold)),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          height: 40,
                          width: size.width - 90,
                          decoration: BoxDecoration(
                            border: Border.all(width: 1, color: Colors.white),
                            color: Colors.transparent,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 15.0),
                            child: TextField(
                              controller: emailcontroller,
                              obscureText: false,
                              style: TextStyle(fontSize: 15, color: darkBlue),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Email",
                                hintStyle: TextStyle(color: darkBlue),
                                prefixIcon: Icon(Icons.mail, color: darkBlue),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          height: 40,
                          width: size.width - 90,
                          decoration: BoxDecoration(
                            color: darkBlue,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: OutlinedButton(
                              onPressed: () {
                                Auth().resetPassword(
                                    context, emailcontroller.text);
                              },
                              style: OutlinedButton.styleFrom(
                                foregroundColor: darkBlue,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: Text(
                                "Parola Sıfırla",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 50, bottom: 25),
                          child: Container(
                            height: 1.0,
                            width: size.width - 90,
                            color: darkBlue,
                          ),
                        ),
                        InkWell(
                          onTap: () =>
                              Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => LoginPage(),
                          )),
                          child: Text(
                            "Giriş Yap'a Geri dön",
                            style: TextStyle(
                                color: textColor,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
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
              padding: EdgeInsets.only(top: size.height / 5 - 40),
              child: Container(
                alignment: Alignment.center,
                height: 80,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  border: Border.all(width: 1, color: lightBlue),
                ),
                child: Icon(Icons.lock_outlined, size: 40),
              ),
            ),
          ]),
        ),
      )),
    );
  }
}
