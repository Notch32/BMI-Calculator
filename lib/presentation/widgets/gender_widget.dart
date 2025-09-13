import 'package:bmi_cal/data/notifier.dart';
import 'package:flutter/material.dart';

class GenderWidget extends StatefulWidget {
  final String imagePath;
  final String value;
  final bool select;
  const GenderWidget({
    super.key,
    required this.imagePath,
    required this.value,
    required this.select,
  });

  @override
  State<GenderWidget> createState() => _GenderWidgetState();
}

class _GenderWidgetState extends State<GenderWidget> {
  @override
  Widget build(BuildContext context) {
    double paddingValue = widget.select ? 15.0 : 10.0;
    return GestureDetector(
      onTap: () {
        genderValueNotifier.value = widget.value;
        debugPrint(genderValueNotifier.value);
      },
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        height: 235,
        child: AnimatedContainer(
          duration: Duration(milliseconds: 130),
          margin: EdgeInsets.only(
            top: 30.0,
            left: paddingValue,
            right: paddingValue,
            bottom: paddingValue,
          ),
          decoration: BoxDecoration(
            color: Color(0XFFFBF6EE),
            borderRadius: BorderRadius.circular(30.0),
            border: Border.all(
              color: widget.select ? Color(0XFF65B741) : Colors.transparent,
              width: 3.0,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black38,
                blurRadius: widget.select ? 5.0 : 0.0,
                offset: Offset(0, 5),
              ),
            ],
          ),
          child: Center(
            child: Image.asset(widget.imagePath, width: 283, height: 150),
          ),
        ),
      ),
    );
  }
}
