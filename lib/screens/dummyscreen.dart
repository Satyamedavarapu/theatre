import 'package:flutter/material.dart';

class DummyScreen extends StatelessWidget {
  final String title;

  DummyScreen(this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Text('This is just a sample screen'),
      ),
    );
  }
}
