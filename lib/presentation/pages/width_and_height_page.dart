import 'dart:ui';

import 'package:bmi_cal/data/notifier.dart';
import 'package:bmi_cal/presentation/widgets/box_widget.dart';
import 'package:bmi_cal/presentation/widgets/button_widget.dart';
import 'package:bmi_cal/presentation/widgets/height_widget.dart';
import 'package:bmi_cal/presentation/widgets/text_info_widget.dart';
import 'package:bmi_cal/presentation/widgets/title_widget.dart';
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
              onTap: () {
                showAdaptiveDialog(
                  context: context,
                  builder: (context) {
                    double bmi =
                        weightAndAgeValueNotifier.value[0].value /
                        ((heightValueNotifier.value / 100) *
                            (heightValueNotifier.value / 100));
                    return Scaffold(
                      backgroundColor: Colors.transparent,
                      body: Stack(
                        children: [
                          BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
                            child: Container(color: Colors.black12),
                          ),

                          Center(
                            child: Container(
                              width: 370,
                              height: 500,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30.0),
                                color: Color(0XFFF0F8EC),

                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 6.0,
                                    spreadRadius: 1.0,
                                    offset: Offset(0, 2),
                                  ),
                                ],
                              ),

                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                spacing: 15.0,
                                children: [
                                  Text(
                                    'Your BMI:',
                                    style: GoogleFonts.roboto(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    bmi.toStringAsFixed(1),
                                    style: GoogleFonts.roboto(
                                      fontSize: 64.0,
                                      fontWeight: FontWeight.bold,
                                      color:
                                          bmi <= 18
                                              ? Color(0XFF84CDEE)
                                              : (bmi > 18 && bmi <= 26)
                                              ? Color(0XFF519234)
                                              : (bmi > 26 && bmi <= 30)
                                              ? Color(0XFFFFDF32)
                                              : Color(0XFFF5554A),
                                    ),
                                  ),

                                  Container(
                                    height: 50.0,
                                    width: 100.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),

                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black12,
                                          blurRadius: 6.0,
                                          spreadRadius: 1.0,
                                          offset: Offset(0, 2),
                                        ),
                                      ],
                                      color:
                                          bmi <= 18
                                              ? Color(0XFF84CDEE)
                                              : (bmi > 18 && bmi <= 26)
                                              ? Color(0XFF519234)
                                              : (bmi > 26 && bmi <= 30)
                                              ? Color(0XFFFFDF32)
                                              : Color(0XFFF5554A),
                                    ),
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: FittedBox(
                                          child: Text(
                                            bmi <= 18
                                                ? 'Under Weight'
                                                : (bmi > 18 && bmi <= 26)
                                                ? 'Normal'
                                                : (bmi > 26 && bmi <= 30)
                                                ? 'Over Weight'
                                                : 'Obese',
                                            style: GoogleFonts.roboto(
                                              fontSize: 24.0,
                                              fontWeight: FontWeight.w800,
                                              color: Color(0XFFFBF6EE),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Row(
                                    spacing: 25.0,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      TextInfoWidget(
                                        title: 'Weight',
                                        text:
                                            '${weightAndAgeValueNotifier.value[0].value} kg',
                                      ),
                                      TextInfoWidget(
                                        title: 'Height',
                                        text: '${heightValueNotifier.value} cm',
                                      ),
                                      TextInfoWidget(
                                        title: 'Age',
                                        text:
                                            '${weightAndAgeValueNotifier.value[1].value}',
                                      ),
                                      TextInfoWidget(
                                        title: 'Gender',
                                        text: genderValueNotifier.value,
                                      ),
                                    ],
                                  ),
                                  Text(
                                    'Healthy weight for the height:',
                                    style: GoogleFonts.roboto(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                  Text(
                                    '${(((heightValueNotifier.value / 100) * (heightValueNotifier.value / 100)) * 18.5).toStringAsFixed(1)} - ${(((heightValueNotifier.value / 100) * (heightValueNotifier.value / 100)) * 24.5).toStringAsFixed(1)}',
                                    style: GoogleFonts.roboto(
                                      color: Color(0XFF519234),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0,
                                    ),
                                  ),

                                  ButtonWidget(
                                    text: "Close",
                                    onTap: () => Navigator.pop(context),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),

            SizedBox(height: 30.0),
          ],
        ),
      ),
    );
  }
}
