import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  final String? text;
  final List<Widget>? footerBody;
  final Widget? body;
  final Widget? headerTitle;

  const MyDrawer({Key? key, this.text, this.footerBody, this.body, this.headerTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          myDrawerHeader(),
          myDrawerList(),
          myDrawerFooter(),
        ],
      ),
    );
  }

  Widget myDrawerHeader() {
    return DrawerHeader(
      child: headerTitle ?? const Text("Header Title is NULL"),
      decoration: const BoxDecoration(color: Colors.blueGrey),
    );
  }

  Widget myDrawerList() {
    return Expanded(
      child: body ?? const Text("Body is NULL"),
    );
  }

  Widget myDrawerFooter() {
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
          ...footerBody ?? [Container()]
        ],
      ),
    );
  }
}
