import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextInfoWidget extends StatelessWidget {
  final String title;
  final String text;
  const TextInfoWidget({super.key, required this.title, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 5.0,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: GoogleFonts.roboto(
            color: Color(0XFF519234),
            fontWeight: FontWeight.w600,
            fontSize: 20.0,
          ),
        ),

        Text(
          title,
          style: GoogleFonts.roboto(
            color: Color(0XFFACACAC),
            fontWeight: FontWeight.w600,
            fontSize: 16.0,
          ),
        ),
      ],
    );
  }
}
