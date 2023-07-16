import 'package:flutter/material.dart';

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
          ],
        ),
      ),
    );
  }
}
