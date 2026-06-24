import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile'), backgroundColor: Colors.white, foregroundColor: Colors.black),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: const [
          CircleAvatar(radius: 36, backgroundColor: Color(0xFF3D4FE0), child: Icon(Icons.person, color: Colors.white, size: 36)),
          SizedBox(height: 16),
          Text('Aarib & Fatima', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
          SizedBox(height: 4),
          Text('Wedding date: not set', style: TextStyle(color: Colors.black54), textAlign: TextAlign.center),
          SizedBox(height: 24),
          ListTile(leading: Icon(Icons.people_outline), title: Text('Collaborators'), subtitle: Text('Share planning access with family')),
          ListTile(leading: Icon(Icons.checklist), title: Text('Task List'), subtitle: Text('Deadline-driven wedding tasks')),
          ListTile(leading: Icon(Icons.settings_outlined), title: Text('Settings')),
        ],
      ),
    );
  }
}
