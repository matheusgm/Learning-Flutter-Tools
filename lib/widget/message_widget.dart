import 'package:flutter/material.dart';
import 'package:sprintf/sprintf.dart';

class MessageWidget extends StatelessWidget {
  final String text;
  final DateTime dateTime;
  final bool alignmentRight;

  const MessageWidget(this.text, this.dateTime, {Key? key, this.alignmentRight = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    //double deviceHeight = MediaQuery.of(context).size.height;

    return Row(
      mainAxisAlignment: alignmentRight == true ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Stack(
          children: [
            Container(
              margin: const EdgeInsets.all(5.0),
              padding: const EdgeInsets.all(10.0),
              constraints: BoxConstraints(maxWidth: deviceWidth * 0.75, minWidth: 80, minHeight: 50),
              decoration: BoxDecoration(
                color: alignmentRight == true ? const Color(0xff005c4b) : const Color(0xff202c33),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Text(
                text,
                style: const TextStyle(color: Color(0xffe9edef)),
              ),
            ),
            Positioned(
              bottom: 10,
              right: 12,
              child: Text(
                sprintf("%02i:%02i", [dateTime.hour, dateTime.minute]),
                style: const TextStyle(color: Color(0xff89b3ac), fontSize: 12),
              ),
            )
          ],
        ),
      ],
    );
  }
}
