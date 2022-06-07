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
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Row(
                  children: [
                    const Expanded(
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            border: UnderlineInputBorder(),
                            labelText: 'Enter your username',
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    DecoratedBox(
                      decoration: const BoxDecoration(
                        color: Colors.transparent,
                      ),
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        icon: const Icon(Icons.arrow_forward),
                        color: Colors.black,
                        iconSize: 40.0,
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
