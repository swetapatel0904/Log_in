import 'package:flutter/material.dart';
import 'package:log_in/screen/home/provider/home_provider.dart';
import 'package:log_in/screen/home/view/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider.value(value: LogInProvider()),
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => HomeScreen(),
      },
    ),
  ));
}
