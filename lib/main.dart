import 'package:flutter/material.dart';
import 'screens/login_screen.dart';

void main() {
  runApp(const EzShaddiApp());
}

class EzShaddiApp extends StatelessWidget {
  const EzShaddiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EZ Shaddi',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: const Color(0xFF3D4FE0),
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const LoginScreen(),
    );
  }
}
