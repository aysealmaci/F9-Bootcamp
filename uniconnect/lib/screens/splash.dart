import 'dart:async';
import 'package:flutter/material.dart';
import 'package:uniconnect/screens/login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
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
    Timer(
        Duration(milliseconds: 4000),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LoginPage())));

    firstCircleController = AnimationController(
      vsync: this,
      duration: Duration(
        seconds: 2,
      ),
    );

    firstCircleRadiusAnimation = Tween<double>(begin: 60, end: 150).animate(
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

    secondCircleRadiusAnimation = Tween<double>(begin: 60, end: 150).animate(
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

    thirdCircleRadiusAnimation = Tween<double>(begin: 60, end: 150).animate(
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff00b0ff),
      body: Center(
          child: Stack(
        alignment: Alignment.center,
        children: [
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
          Text(
            'UniConnect',
            style: TextStyle(
              fontFamily: "Lobster",
              color: Color(0xff2d279d),
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      )),
    );
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
