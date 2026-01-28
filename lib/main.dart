import 'package:flutter/material.dart';
import 'package:task_6/views/login_view.dart';
import 'package:task_6/views/onboarding_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      home: LoginView(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: "Inter"),
    ),
  );
}
