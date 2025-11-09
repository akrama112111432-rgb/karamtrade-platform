import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('منصة كرام تريد'),
        backgroundColor: Colors.tealAccent[400],
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'مرحبًا بك في تطبيق التداول الذكي 🚀',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
