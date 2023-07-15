import 'package:flutter/material.dart';
import 'package:uniconnect/auth.dart';
import 'package:uniconnect/screens/register.dart';
import 'package:uniconnect/screens/reset_password.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  static const Color darkBlue = Color(0xff294c92);
  static const Color lightBlue = Color(0xff00b0ff);
  static const Color textColor = Color(0xff2d279d);
  bool isLoading = false;

  void login() async {
    setState(() {
      isLoading = true;
    });
    await Auth().signIn(
      context,
      emailcontroller.text,
      passwordcontroller.text,
    );
    setState(() {
      isLoading = false;
    });
  }

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
                        Text("Merhaba, UniConnect'e Hoşgeldin!",
                            style: TextStyle(
                              fontSize: 20,
                              color: textColor,
                              fontWeight: FontWeight.bold,
                            )),
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child:
                              Text("Lütfen paylaşım yapabilmek için Giriş Yap!",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: darkBlue,
                                  )),
                        ),
                        SizedBox(height: 25),
                        Text("Giriş Yap",
                            style: TextStyle(
                                color: textColor,
                                fontSize: 18,
                                fontWeight: FontWeight.bold)),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 40,
                          width: 250,
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
                          height: 10,
                        ),
                        Container(
                          height: 40,
                          width: 250,
                          decoration: BoxDecoration(
                            border: Border.all(width: 1, color: Colors.white),
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
                                color: darkBlue,
                                fontSize: 15,
                              ),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Parola",
                                hintStyle: TextStyle(color: darkBlue),
                                prefixIcon:
                                    Icon(Icons.password, color: darkBlue),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.only(right: 135),
                          child: InkWell(
                              onTap: () =>
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => ResetPassword(),
                                  )),
                              child: Text("Şifreni mi Unuttun?",
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: textColor,
                                  ))),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 40,
                          width: 250,
                          decoration: BoxDecoration(
                            color: darkBlue,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: OutlinedButton(
                              onPressed: login,
                              style: OutlinedButton.styleFrom(
                                foregroundColor: darkBlue,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: isLoading
                                  ? Center(
                                      child: CircularProgressIndicator(
                                        color: Colors.white,
                                      ),
                                    )
                                  : Text(
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
                                width: 93.0,
                                color: darkBlue,
                              ),
                            ),
                            Text(
                              " Ya da ",
                              style: TextStyle(
                                  color: darkBlue,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.0),
                              child: Container(
                                height: 1.0,
                                width: 93.0,
                                color: darkBlue,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          width: 150,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                              "Hesabın yok mu? ",
                              style: TextStyle(color: textColor, fontSize: 13),
                            ),
                            InkWell(
                                onTap: () => Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (context) => RegisterPage(),
                                    )),
                                child: Text(
                                  "Şimdi Kaydol!",
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
              padding: EdgeInsets.only(top: size.height / 5 - 60, right: 10),
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
      )),
    );
  }
}
