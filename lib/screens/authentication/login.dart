import 'package:flutter/material.dart';
import 'package:theatre/screens/home/home_screen.dart';
import 'package:theatre/utils/util_colors.dart';
import 'package:theatre/utils/util_widgets.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  UtilWidgets uWids = UtilWidgets();

  @override
  Widget build(BuildContext context) {
    return Material(
      color: UtilColors.appBackground,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(),
            ),
            uWids.gradientButton(buttonName: 'Login', onTap: pushHome)
          ],
        ),
      ),
    );
  }

  void pushHome() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => HomeScreen()));
  }
}
