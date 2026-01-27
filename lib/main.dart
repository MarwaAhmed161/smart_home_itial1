import 'package:flutter/material.dart';
import 'package:untitled55/pages/login_page.dart';
import 'package:untitled55/pages/register_page.dart';
import 'pages/RoomsPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Smart Home App',
      theme: ThemeData.dark(),
      home: LoginScreeen(),
    );
  }
}
