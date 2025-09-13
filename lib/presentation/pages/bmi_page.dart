import 'package:bmi_cal/presentation/widgets/title_widget.dart';
import 'package:flutter/material.dart';

class BmiPage extends StatefulWidget {
  const BmiPage({super.key});

  @override
  State<BmiPage> createState() => _BmiPageState();
}

class _BmiPageState extends State<BmiPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 30.0),
           
           //! title
            TitleWidget(backButton: true),
           
           
            SizedBox(height: 30.0),
          ],
        ),
      ),
    );
  }
}
