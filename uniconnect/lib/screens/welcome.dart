import 'package:flutter/material.dart';
import 'dart:async';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage>
    with TickerProviderStateMixin {
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
            child: Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // Circles(),
                  Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.transparent,
                        border: Border.all(width: 1, color: Colors.white)),
                    width: 350,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.transparent,
                        border: Border.all(width: 1, color: Colors.white)),
                    width: 300,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.transparent,
                        border: Border.all(width: 1, color: Colors.white)),
                    width: 250,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.white,
                              Colors.white,
                              Color(0xffcc8df7)
                            ])),
                    height: 200,
                    width: 200,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Text("Merhaba!",
                              style: TextStyle(
                                  fontSize: 17,
                                  color: Color(0xff294c92),
                                  fontWeight: FontWeight.bold)),
                          SizedBox(
                            height: 10,
                          ),
                          Text("Daha fazla erişim için",
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xff294c92),
                              )),
                          SizedBox(
                            height: 10,
                          ),
                          OutlinedButton(
                              onPressed: null,
                              style: OutlinedButton.styleFrom(
                                backgroundColor: Color(0xff294c92),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              child: Text(
                                " Giriş Yap ",
                                style: TextStyle(
                                    fontSize: 10, color: Colors.white),
                              )),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle, color: Colors.white),
                              height: 40,
                              width: 40,
                              child: Icon(
                                Icons.person,
                                color: Color(0xff294c92),
                                size: 35,
                              ))
                        ]),
                  )
                ],
              ),
            ),
          )),
        ),
      ),
    );
  }
}

class Circles extends StatefulWidget {
  const Circles({Key? key}) : super(key: key);

  @override
  State<Circles> createState() => _CirclesState();
}

class _CirclesState extends State<Circles> with TickerProviderStateMixin {
  late AnimationController firstRippleController;
  late AnimationController secondRippleController;
  late AnimationController thirdRippleController;
  late Animation<double> firstRippleRadiusAnimation;
  late Animation<double> firstRippleOpacityAnimation;
  late Animation<double> firstRippleWidthAnimation;
  late Animation<double> secondRippleRadiusAnimation;
  late Animation<double> secondRippleOpacityAnimation;
  late Animation<double> secondRippleWidthAnimation;
  late Animation<double> thirdRippleRadiusAnimation;
  late Animation<double> thirdRippleOpacityAnimation;
  late Animation<double> thirdRippleWidthAnimation;

  @override
  void initState() {
    firstRippleController = AnimationController(
      vsync: this,
      duration: Duration(
        seconds: 2,
      ),
    );

    firstRippleRadiusAnimation = Tween<double>(begin: 0, end: 150).animate(
      CurvedAnimation(
        parent: firstRippleController,
        curve: Curves.ease,
      ),
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          firstRippleController.repeat();
        } else if (status == AnimationStatus.dismissed) {
          firstRippleController.forward();
        }
      });

    firstRippleOpacityAnimation = Tween<double>(begin: 1, end: 0).animate(
      CurvedAnimation(
        parent: firstRippleController,
        curve: Curves.ease,
      ),
    );

    firstRippleWidthAnimation = Tween<double>(begin: 10, end: 0).animate(
      CurvedAnimation(
        parent: firstRippleController,
        curve: Curves.ease,
      ),
    );

    secondRippleController = AnimationController(
      vsync: this,
      duration: Duration(
        seconds: 2,
      ),
    );

    secondRippleRadiusAnimation = Tween<double>(begin: 0, end: 150).animate(
      CurvedAnimation(
        parent: secondRippleController,
        curve: Curves.ease,
      ),
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          secondRippleController.repeat();
        } else if (status == AnimationStatus.dismissed) {
          secondRippleController.forward();
        }
      });

    secondRippleOpacityAnimation = Tween<double>(begin: 1, end: 0).animate(
      CurvedAnimation(
        parent: secondRippleController,
        curve: Curves.ease,
      ),
    );

    secondRippleWidthAnimation = Tween<double>(begin: 10, end: 0).animate(
      CurvedAnimation(
        parent: secondRippleController,
        curve: Curves.ease,
      ),
    );

    thirdRippleController = AnimationController(
      vsync: this,
      duration: Duration(
        seconds: 2,
      ),
    );

    thirdRippleRadiusAnimation = Tween<double>(begin: 0, end: 150).animate(
      CurvedAnimation(
        parent: thirdRippleController,
        curve: Curves.ease,
      ),
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          thirdRippleController.repeat();
        } else if (status == AnimationStatus.dismissed) {
          thirdRippleController.forward();
        }
      });

    thirdRippleOpacityAnimation = Tween<double>(begin: 1, end: 0).animate(
      CurvedAnimation(
        parent: thirdRippleController,
        curve: Curves.ease,
      ),
    );

    thirdRippleWidthAnimation = Tween<double>(begin: 10, end: 0).animate(
      CurvedAnimation(
        parent: thirdRippleController,
        curve: Curves.ease,
      ),
    );

    firstRippleController.forward();
    Timer(
      Duration(milliseconds: 765),
      () => secondRippleController.forward(),
    );

    Timer(
      Duration(milliseconds: 1030),
      () => thirdRippleController.forward(),
    );

    super.initState();
  }

  @override
  void dispose() {
    firstRippleController.dispose();
    secondRippleController.dispose();
    thirdRippleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: MyPainter(
        firstRippleRadiusAnimation.value,
        firstRippleOpacityAnimation.value,
        firstRippleWidthAnimation.value,
        secondRippleRadiusAnimation.value,
        secondRippleOpacityAnimation.value,
        secondRippleWidthAnimation.value,
        thirdRippleRadiusAnimation.value,
        thirdRippleOpacityAnimation.value,
        thirdRippleWidthAnimation.value,
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  final double firstRippleRadius;
  final double firstRippleOpacity;
  final double firstRippleStrokeWidth;
  final double secondRippleRadius;
  final double secondRippleOpacity;
  final double secondRippleStrokeWidth;
  final double thirdRippleRadius;
  final double thirdRippleOpacity;
  final double thirdRippleStrokeWidth;

  MyPainter(
    this.firstRippleRadius,
    this.firstRippleOpacity,
    this.firstRippleStrokeWidth,
    this.secondRippleRadius,
    this.secondRippleOpacity,
    this.secondRippleStrokeWidth,
    this.thirdRippleRadius,
    this.thirdRippleOpacity,
    this.thirdRippleStrokeWidth,
  );

  @override
  void paint(Canvas canvas, Size size) {
    Color myColor = Colors.white;

    Paint firstPaint = Paint();
    firstPaint.color = myColor.withOpacity(firstRippleOpacity);
    firstPaint.style = PaintingStyle.stroke;
    firstPaint.strokeWidth = firstRippleStrokeWidth;

    canvas.drawCircle(Offset.zero, firstRippleRadius, firstPaint);

    Paint secondPaint = Paint();
    secondPaint.color = myColor.withOpacity(secondRippleOpacity);
    secondPaint.style = PaintingStyle.stroke;
    secondPaint.strokeWidth = secondRippleStrokeWidth;

    canvas.drawCircle(Offset.zero, secondRippleRadius, secondPaint);

    Paint thirdPaint = Paint();
    thirdPaint.color = myColor.withOpacity(thirdRippleOpacity);
    thirdPaint.style = PaintingStyle.stroke;
    thirdPaint.strokeWidth = thirdRippleStrokeWidth;

    canvas.drawCircle(Offset.zero, thirdRippleRadius, thirdPaint);

    Paint fourthPaint = Paint();
    fourthPaint.color = myColor;
    fourthPaint.style = PaintingStyle.fill;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
