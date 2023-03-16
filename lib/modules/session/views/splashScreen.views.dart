import 'package:flutter/material.dart';
import 'package:projet_mars_nan/modules/session/views/authentification.views.dart';

class SplashScreenViews extends StatefulWidget {
  const SplashScreenViews({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenViewsState createState() => _SplashScreenViewsState();
}

class _SplashScreenViewsState extends State<SplashScreenViews> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/images/logoSplash.png',
          width: 280,
        ),
        // Text(
        //   'Splash Screen',
        //   style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        // ),
      ),
    );
  }
}
