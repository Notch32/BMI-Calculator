import 'package:bmi_cal/data/notifier.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BoxWidget extends StatefulWidget {
  final int index;
  final String title;
  const BoxWidget({super.key, required this.index, required this.title});

  @override
  State<BoxWidget> createState() => _BoxWidgetState();
}

class _BoxWidgetState extends State<BoxWidget> {
  double minusRadius = 20.0, plusRadius = 20.0;
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: weightAndAgeValueNotifier.value[widget.index],
      builder: (context, value, child) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 10.0),
          width: 170.0,
          height: 184.0,
          decoration: BoxDecoration(
            color: Color(0XFFFBF6EE),
            borderRadius: BorderRadius.circular(30.0),
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
            children: [
              Text(
                widget.title,
                style: GoogleFonts.roboto(
                  color: Color(0XFFACACAC),
                  fontWeight: FontWeight.w600,
                  fontSize: 16.0,
                ),
              ),

              SizedBox(height: 15.0),

              Text(
                "$value",
                style: GoogleFonts.roboto(
                  color: Color(0XFFCE922A),
                  fontWeight: FontWeight.bold,
                  fontSize: 48.0,
                ),
              ),

              SizedBox(
                width: 110.0,
                height: 40.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () async {
                        weightAndAgeValueNotifier.value[widget.index].value--;
                        setState(() => minusRadius -= 2);

                        await Future.delayed(Duration(milliseconds: 200));

                        setState(() => minusRadius += 2);
                      },
                      child: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        radius: minusRadius,
                        child: Image.asset(
                          'assets/icons/minus.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        weightAndAgeValueNotifier.value[widget.index].value++;
                        setState(() => plusRadius -= 2);

                        await Future.delayed(Duration(milliseconds: 200));

                        setState(() => plusRadius += 2);
                      },
                      child: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        radius: plusRadius,
                        child: Image.asset(
                          'assets/icons/plus.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
