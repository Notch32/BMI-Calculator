import 'package:bmi_cal/presentation/pages/gender_page.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    splashEffect();
  }

  void splashEffect() async {
    await Future.delayed(Duration(seconds: 3));
    Navigator.pushReplacement(
      mounted ? context : context,
      MaterialPageRoute(builder: (context) => GenderPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFF8F8F8),
      body: Center(child: Image.asset("assets/icons/image.png")),
    );
  }
}
