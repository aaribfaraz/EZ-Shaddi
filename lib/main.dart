import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'state/app_state.dart';

void main() {
  runApp(const EzShaddiApp());
}

class EzShaddiApp extends StatefulWidget {
  const EzShaddiApp({super.key});

  @override
  State<EzShaddiApp> createState() => _EzShaddiAppState();
}

class _EzShaddiAppState extends State<EzShaddiApp> {
  final AppState _appState = AppState();

  @override
  Widget build(BuildContext context) {
    return AppStateScope(
      appState: _appState,
      child: MaterialApp(
        title: 'EZ Shaddi',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          colorSchemeSeed: const Color(0xFF3D4FE0),
          scaffoldBackgroundColor: Colors.white,
        ),
        home: const LoginScreen(),
      ),
    );
  }
}
