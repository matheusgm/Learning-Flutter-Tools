import 'package:flutter/material.dart';
import 'dart:developer' as developer;
import 'widget/messenger.dart';

const secondScreen = "SECOND_SCREEN";

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  void initState() {
    super.initState();
    developer.log('initState() was called!', name: secondScreen);
  }

  @override
  void dispose() {
    super.dispose();
    developer.log('dispose() was called!', name: secondScreen);
  }

  @override
  void activate() {
    super.activate();
    developer.log('activate() was called!', name: secondScreen);
  }

  @override
  void deactivate() {
    super.deactivate();
    developer.log('deactivate() was called!', name: secondScreen);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    developer.log('didChangeDependencies() was called!', name: secondScreen);
  }

  @override
  void didUpdateWidget(covariant SecondScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    developer.log('didUpdateWidget() was called!', name: secondScreen);
  }

  @override
  void reassemble() {
    super.reassemble();
    developer.log('reassemble() was called!', name: secondScreen);
  }

  @override
  Widget build(BuildContext context) {
    developer.log('buildr() was called!', name: secondScreen);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Screen'),
      ),
      body: const Center(
        child: Messenger(),
      ),
    );
  }
}
