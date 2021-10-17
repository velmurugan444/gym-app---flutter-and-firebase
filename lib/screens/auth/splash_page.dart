import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:gym_app/screens/auth/login_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  Animation<double> opacity;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: Duration(seconds: 3), vsync: this);
    timeDilation = 0.5;
    opacity = Tween<double>(begin: 1.0, end: 0.0).animate(controller)
      ..addListener(() {
        setState(() {});
      });
    controller.forward().then((_) {
      navigationPage();
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void navigationPage() {
    Navigator.of(context)
        .pushReplacement((MaterialPageRoute(builder: (_) => LoginScreen())));
  }

  Widget build(BuildContext context) {
    return Container(
      child: Container(
        decoration: BoxDecoration(color: Color.fromRGBO(0, 12, 24, 0.7)),
        child: SafeArea(
          child: new Scaffold(
            backgroundColor: Color.fromRGBO(0, 12, 24, 0.7),
            body: Column(
              children: <Widget>[
                Expanded(
                  child: Opacity(
                      opacity: opacity.value,
                      child: new Image.asset('assets/splashlogo.png')),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
