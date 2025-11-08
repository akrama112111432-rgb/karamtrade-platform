import 'package:flutter/material.dart';

class LeaderboardScreen extends StatelessWidget {
  const LeaderboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final leaders = [
      {"name": "Karam", "level": "أسطورة التداول 💎", "xp": 5000},
      {"name": "Omar", "level": "خبير تداول", "xp": 3200},
      {"name": "Lina", "level": "محلل متقدم", "xp": 2500},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('🏅 لوحة الشرف العالمية'),
        backgroundColor: Colors.amber[700],
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: leaders.length,
        itemBuilder: (context, index) {
          final leader = leaders[index];
          return Card(
            margin: const EdgeInsets.all(8),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.amber[700],
                child: Text('${index + 1}'),
              ),
              title: Text(leader["name"]!),
              subtitle: Text(leader["level"]!),
              trailing: Text('${leader["xp"]} XP',
                  style: const TextStyle(fontWeight: FontWeight.bold)),
            ),
          );
        },
      ),
    );
  }
}
