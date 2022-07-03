import 'package:flutter/material.dart';

class Modal extends StatelessWidget {
  final String? headerTitle;
  final Widget? body;
  final ModalButtons modalButtons;
  const Modal({this.body, this.headerTitle, this.modalButtons = ModalButtons.ok, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Container(
        constraints: const BoxConstraints(maxHeight: 300),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              modalHeader(),
              modalBody(),
              modalFooter(),
            ],
          ),
        ),
      ),
    );
  }

  Widget modalHeader() {
    return Align(
      alignment: FractionalOffset.topCenter,
      child: Column(
        children: <Widget>[
          Text(
            headerTitle ?? "Welcome",
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
          const Divider(
            thickness: 1,
            indent: 10,
            endIndent: 10,
            color: Color.fromARGB(255, 208, 208, 208),
          ),
        ],
      ),
    );
  }

  Widget modalBody() {
    return Expanded(
      child: body ?? const Text("Body is null"),
    );
  }

  Widget modalFooter() {
    return Align(
      alignment: FractionalOffset.bottomCenter,
      child: Column(
        children: <Widget>[
          const Divider(
            thickness: 1,
            indent: 10,
            endIndent: 10,
            color: Color.fromARGB(255, 208, 208, 208),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              if (modalButtons == ModalButtons.noAndYes) ...[
                ElevatedButton(
                  onPressed: () {},
                  child: const Text("No"),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text("Yes"),
                )
              ] else if (modalButtons == ModalButtons.cancelAndAccept) ...[
                ElevatedButton(
                  onPressed: () {},
                  child: const Text("Cancel"),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text("Accept"),
                )
              ] else ...[
                ElevatedButton(
                  onPressed: () {},
                  child: const Text("Ok"),
                )
              ]
            ],
          )
        ],
      ),
    );
  }
}

enum ModalButtons { ok, noAndYes, cancelAndAccept }
