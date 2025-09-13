import 'package:bmi_cal/data/notifier.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const ButtonWidget({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: genderValueNotifier,
      builder: (context, value, child) {
        return GestureDetector(
          onTap: onTap,
          child: AnimatedContainer(
            duration: Duration(milliseconds: 200),
            height: 70.0,
            margin: EdgeInsets.symmetric(
              horizontal: value == "Null" ? 20.0 : 30.0,
            ),
            decoration: BoxDecoration(
              color: value == "Null" ? Colors.grey : Color(0XFF65B741),
              borderRadius: BorderRadius.circular(25.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black38,
                  blurRadius: value == "Null" ? 0.0 : 5.0,
                  offset: Offset(0, 0),
                ),
              ],
            ),
            child: Center(
              child: Text(
                text,
                style: GoogleFonts.roboto(
                  fontSize: 32.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
