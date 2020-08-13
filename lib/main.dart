import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theatre/providers/visibility_provider.dart';
import 'package:theatre/screens/authentication/login.dart';
import 'package:theatre/utils/util_colors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Theatre',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: UtilColors.appBackground,
        primarySwatch: Colors.blueGrey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ChangeNotifierProvider(
          create: (context) => TextVisibility(), child: LoginScreen()),
    );
  }
}
