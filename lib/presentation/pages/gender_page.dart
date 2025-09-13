import 'package:bmi_cal/data/notifier.dart';
import 'package:bmi_cal/presentation/pages/width_and_height_page.dart';
import 'package:bmi_cal/presentation/widgets/button_widget.dart';
import 'package:bmi_cal/presentation/widgets/gender_widget.dart';
import 'package:bmi_cal/presentation/widgets/title_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GenderPage extends StatefulWidget {
  const GenderPage({super.key});

  @override
  State<GenderPage> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<GenderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFF8F8F8),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 30.0),

            //! Title
            TitleWidget(),

            Text(
              'Please choose your gender',
              style: GoogleFonts.roboto(
                fontSize: 24.0,
                fontWeight: FontWeight.w600,
              ),
            ),

            ValueListenableBuilder(
              valueListenable: genderValueNotifier,
              builder: (context, value, child) {
                return Column(
                  children: [
                    //! Male Option
                    GenderWidget(
                      imagePath: 'assets/images/male_gender.png',
                      value: "Male",
                      select: value == "Null" ? false : value == "Male",
                    ),

                    //! Female Option
                    GenderWidget(
                      imagePath: 'assets/images/female_gender.png',
                      value: "Female",
                      select: value == "Null" ? false : value == "Female",
                    ),
                    SizedBox(height: 60.0),

                    ButtonWidget(
                      text: "Continue",
                      onTap: () {
                        value == 'Null'
                            ? ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                duration: Duration(milliseconds: 600),
                                behavior: SnackBarBehavior.floating,
                                content: Text(
                                  "Select Gender First !",
                                  style: GoogleFonts.roboto(
                                    color: Colors.white,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                backgroundColor: Colors.redAccent,
                              ),
                            )
                            : Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (context) => WidthAndHeightPage(),
                              ),
                            );
                      },
                    ),

                    SizedBox(height: 30.0),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
