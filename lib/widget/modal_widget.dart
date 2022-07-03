import 'package:flutter/material.dart';
import 'dart:developer' as developer;

const modalScreen = "MODAL_SCREEN";

class Modal extends StatefulWidget {
  final String? headerTitle;
  final Widget? body;
  final ModalButtons modalButtons;
  final List<void Function()?> footerButtonTap;
  const Modal(
      {this.body, this.headerTitle, this.modalButtons = ModalButtons.ok, this.footerButtonTap = const [], Key? key})
      : super(key: key);

  @override
  State<Modal> createState() => _Modal();
}

class _Modal extends State<Modal> {
  @override
  Widget build(BuildContext context) {
    developer.log('buildr() was called! ', name: modalScreen);
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Container(
        constraints: const BoxConstraints(maxHeight: 500),
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
            widget.headerTitle ?? "Welcome",
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
    return widget.body ?? const Text("Body is null");
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
              if (widget.modalButtons == ModalButtons.noAndYes)
                ...noAndYesButtons()
              else if (widget.modalButtons == ModalButtons.cancelAndCreate)
                ...cancelAndCreateButtons()
              else if (widget.modalButtons == ModalButtons.cancelAndAccept)
                ...cancelAndAcceptButtons()
              else
                ...okButtons()
            ],
          )
        ],
      ),
    );
  }

  List<Widget> noAndYesButtons() {
    return [
      ElevatedButton(
        onPressed: widget.footerButtonTap.isNotEmpty ? widget.footerButtonTap[0] : () {},
        child: const Text("No"),
      ),
      ElevatedButton(
        onPressed:
            widget.footerButtonTap.isNotEmpty && widget.footerButtonTap.length > 1 ? widget.footerButtonTap[1] : () {},
        child: const Text("Yes"),
      )
    ];
  }

  List<Widget> cancelAndAcceptButtons() {
    return [
      ElevatedButton(
        onPressed: widget.footerButtonTap.isNotEmpty ? widget.footerButtonTap[0] : () {},
        child: const Text("Cancel"),
      ),
      ElevatedButton(
        onPressed:
            widget.footerButtonTap.isNotEmpty && widget.footerButtonTap.length > 1 ? widget.footerButtonTap[1] : () {},
        child: const Text("Accept"),
      )
    ];
  }

  List<Widget> cancelAndCreateButtons() {
    return [
      ElevatedButton(
        onPressed: widget.footerButtonTap.isNotEmpty ? widget.footerButtonTap[0] : () {},
        child: const Text("Cancel"),
      ),
      ElevatedButton(
        onPressed:
            widget.footerButtonTap.isNotEmpty && widget.footerButtonTap.length > 1 ? widget.footerButtonTap[1] : () {},
        child: const Text("Create"),
      )
    ];
  }

  List<Widget> okButtons() {
    return [
      ElevatedButton(
        onPressed: widget.footerButtonTap.isNotEmpty ? widget.footerButtonTap[0] : () {},
        child: const Text("Ok"),
      )
    ];
  }
}

enum ModalButtons { ok, noAndYes, cancelAndAccept, cancelAndCreate }
