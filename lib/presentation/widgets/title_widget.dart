import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  final bool backButton;
  const TitleWidget({super.key, this.backButton = false});

  @override
  Widget build(BuildContext context) {
    return backButton
        ? Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 14.0, bottom: 4.0),
              child: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: Color(0XFF65B741),
                ),
              ),
            ),
            Row(
              children: [
                SizedBox(width: 42.0),
                Flexible(
                  child: Center(
                    child: Container(
                      margin: const EdgeInsets.only(
                        bottom: 40.0,
                        right: 89.0,
                        left: 47.0,
                      ),
                      child: Image.asset('assets/images/title.png'),
                    ),
                  ),
                ),
              ],
            ),
          ],
        )
        : Container(
          margin: const EdgeInsets.only(bottom: 40.0, right: 89.0, left: 89.0),
          child: Image.asset('assets/images/title.png'),
        );
  }
}
