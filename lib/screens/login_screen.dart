import 'package:flutter/material.dart';
import 'shell_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController(text: 'testemail@gmail.com');
  final _passwordController = TextEditingController();

  void _login() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => const ShellScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RichText(
                text: const TextSpan(
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.black),
                  children: [
                    TextSpan(text: 'Welcome to '),
                    TextSpan(text: 'EZ SHADDI', style: TextStyle(color: Color(0xFF3D4FE0))),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              const Text('Email', style: TextStyle(fontSize: 13, color: Colors.black54)),
              const SizedBox(height: 6),
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(border: OutlineInputBorder()),
              ),
              const SizedBox(height: 20),
              const Text('Password', style: TextStyle(fontSize: 13, color: Colors.black54)),
              const SizedBox(height: 6),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: 'your password',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF3D4FE0),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  onPressed: _login,
                  child: const Text('Login', style: TextStyle(color: Colors.white)),
                ),
              ),
              const SizedBox(height: 16),
              const Text('Forgot password?', style: TextStyle(color: Color(0xFF3D4FE0))),
              const SizedBox(height: 8),
              const Text('Privacy', style: TextStyle(color: Color(0xFF3D4FE0))),
            ],
          ),
        ),
      ),
    );
  }
}
