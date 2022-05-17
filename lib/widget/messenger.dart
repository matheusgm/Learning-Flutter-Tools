import 'package:flutter/material.dart';

class Messenger extends StatelessWidget {
  const Messenger({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: 20,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text("$index"),
              );
            },
          ),
        ),
        SizedBox(
          height: 60,
          child: DecoratedBox(
            decoration: const BoxDecoration(
              color: Colors.amber,
            ),
            child: Row(
              children: const [
                Text("Hello"),
                Text("Hello"),
              ],
            ),
          ),
        )
      ],
    );
  }
}
