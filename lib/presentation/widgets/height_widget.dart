import 'package:bmi_cal/data/notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_unit_ruler/scale_controller.dart';
import 'package:flutter_unit_ruler/scale_line.dart';
import 'package:flutter_unit_ruler/scale_unit.dart';
import 'package:flutter_unit_ruler/unit_ruler.dart';
import 'package:google_fonts/google_fonts.dart';

class HeightWidget extends StatefulWidget {
  const HeightWidget({super.key});

  @override
  State<HeightWidget> createState() => _HeightWidgetState();
}

class _HeightWidgetState extends State<HeightWidget> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: heightValueNotifier,
      builder: (context, value, child) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 10.0),
          width: 370.0,
          height: 250.0,
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
                'Height (cm)',
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

              UnitRuler(
                onValueChanged:
                    (newValue) => heightValueNotifier.value = newValue.toInt(),
                width: 320.0,
                backgroundColor: Colors.transparent,
                scaleUnit: UnitType.length.centimeter,
                scalePadding: EdgeInsets.only(
                  left: MediaQuery.sizeOf(context).width * 0.3,
                  right: MediaQuery.sizeOf(context).width * 0.372,
                ),
                scaleAlignment: Alignment.bottomCenter,
                scrollDirection: Axis.horizontal,
                scaleMarkerPositionTop: BorderSide.strokeAlignOutside,
                scaleMarkerPositionLeft: BorderSide.strokeAlignInside,
                height: 70.0,
                scaleIntervalTextStyle: GoogleFonts.roboto(
                  color: Color(0XFFCE922A),
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                ),
                scaleIntervalText: (index, rulerScaleValue) => '',
                scaleIntervalStyles: [
                  ScaleIntervalStyle(
                    scale: 0,
                    color: Color(0XFFCE922A),
                    width: 3,
                    height: 32,
                  ),
                  ScaleIntervalStyle(
                    color: Color(0XFFC4C4C4),
                    width: 1,
                    height: 20,
                  ),
                ],
                scaleIntervalTextPosition: 80,
                scaleMarker: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: MediaQuery.sizeOf(context).width * 0.26,
                      ),
                      child: Icon(
                        Icons.arrow_drop_down_rounded,
                        color: Color(0XFFCE922A),
                        size: 48.0,
                      ),
                    ),
                  ],
                ),
                controller: ScaleController(value: value),
              ),
            ],
          ),
        );
      },
    );
  }
}
