import 'package:bmi_cal/presentation/pages/bmi_page.dart';
import 'package:bmi_cal/presentation/widgets/box_widget.dart';
import 'package:bmi_cal/presentation/widgets/button_widget.dart';
import 'package:bmi_cal/presentation/widgets/height_widget.dart';
import 'package:bmi_cal/presentation/widgets/title_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WidthAndHeightPage extends StatefulWidget {
  const WidthAndHeightPage({super.key});

  @override
  State<WidthAndHeightPage> createState() => _WidthAndHeightPageState();
}

class _WidthAndHeightPageState extends State<WidthAndHeightPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFF8F8F8),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 30.0),

            TitleWidget(backButton: true),

            Text(
              'Please Modify the values',
              style: GoogleFonts.roboto(
                fontSize: 24.0,
                fontWeight: FontWeight.w600,
              ),
            ),

            SizedBox(height: 30.0),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BoxWidget(index: 0, title: "Weight (kg)"),
                SizedBox(width: 10.0),
                BoxWidget(index: 1, title: "Age"),
              ],
            ),

            SizedBox(height: 30.0),

            HeightWidget(),

            SizedBox(height: 50.0),

            ButtonWidget(
              text: 'Calculate',
              onTap:
                  () => Navigator.push(
                    context,
                    CupertinoPageRoute(builder: (context) => BmiPage()),
                  ),
            ),

            SizedBox(height: 30.0),
          ],
        ),
      ),
    );
  }
}
