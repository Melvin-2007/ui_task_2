import 'package:flutter/material.dart';
import 'package:task_6/views/login_view.dart';

Future<void> main()async{
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(home: const LoginView(), debugShowCheckedModeBanner: false));
}
