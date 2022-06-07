import 'package:flutter/material.dart';

class Message extends StatelessWidget {
  final String text;
  final bool alignmentRight;

  const Message(this.text, {Key? key, this.alignmentRight = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    //double deviceHeight = MediaQuery.of(context).size.height;
    return Row(
      mainAxisAlignment: alignmentRight == true
          ? MainAxisAlignment.end
          : MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.all(5.0),
          padding: const EdgeInsets.all(10.0),
          height: 50,
          constraints:
              BoxConstraints(maxWidth: deviceWidth * 0.75, minWidth: 0),
          decoration: BoxDecoration(
            color: alignmentRight == true ? Colors.greenAccent : Colors.grey,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Center(
            heightFactor: 1,
            widthFactor: 1,
            child: Text(
              text,
              textAlign: TextAlign.left,
            ),
          ),
        ),
      ],
    );
  }
}
