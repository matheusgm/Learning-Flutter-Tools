import 'package:flutter/material.dart';
import 'dart:developer' as developer;

const homePage = "HOME_PAGE";

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _openMessenger() {
    developer.log('_openMessenger() was called!', name: homePage);
    Navigator.pushNamed(context, '/messenger');
  }

  @override
  void initState() {
    super.initState();
    developer.log('initState() was called!', name: homePage);
  }

  @override
  void dispose() {
    super.dispose();
    developer.log('dispose() was called!', name: homePage);
  }

  @override
  void activate() {
    super.activate();
    developer.log('activate() was called!', name: homePage);
  }

  @override
  void deactivate() {
    super.deactivate();
    developer.log('deactivate() was called!', name: homePage);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    developer.log('didChangeDependencies() was called!', name: homePage);
  }

  @override
  void didUpdateWidget(covariant MyHomePage oldWidget) {
    super.didUpdateWidget(oldWidget);
    developer.log('didUpdateWidget() was called!', name: homePage);
  }

  @override
  void reassemble() {
    super.reassemble();
    developer.log('reassemble() was called!', name: homePage);
  }

  @override
  Widget build(BuildContext context) {
    developer.log('buildr() was called!', name: homePage);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Hello World',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _openMessenger,
        tooltip: 'Open Messenger',
        child: const Icon(Icons.add),
      ),
    );
  }
}
