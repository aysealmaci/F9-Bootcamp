import 'package:flutter/material.dart';
import 'package:uniconnect/screens/anasayfa.dart';
import 'package:uniconnect/screens/login.dart';

class OpeningPage extends StatelessWidget {
  const OpeningPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Image.asset(
              "assets/images/opening.png",
              fit: BoxFit.cover,
            ),
            SizedBox(
                height: 50,
                width: 200,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 43, 43, 71),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5))),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => LoginPage(),
                      ));
                    },
                    child: Text(
                      "Giriş Yap",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ))),
            SizedBox(
                height: 50,
                width: 200,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 43, 43, 71),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5))),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => AnaSayfa(),
                      ));
                    },
                    child: Text(
                      "Giriş Yapmadan Devam et",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ))),
          ],
        ),
      ),
    );
  }
}
