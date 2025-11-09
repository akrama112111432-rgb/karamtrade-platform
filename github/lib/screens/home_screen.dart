import 'package:flutter/material.dart';
import 'academy_screen.dart';
import 'ai_chat_screen.dart';
import 'challenges_screen.dart';
import 'leaderboard_screen.dart';
import 'profile_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F172A),
        elevation: 0,
        title: Row(
          children: [
            Image.asset('assets/images/logo.png', width: 36),
            const SizedBox(width: 8),
            const Text('Karam Trade AI', style: TextStyle(color: Colors.amber)),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Quick actions
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _HomeCard(title: 'التعلم', icon: Icons.school, color: Colors.teal, onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const AcademyScreen()));
                }),
                _HomeCard(title: 'الذكاء الاصطناعي', icon: Icons.smart_toy, color: Colors.blueAccent, onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const AIChatScreen()));
                }),
                _HomeCard(title: 'المسابقات', icon: Icons.emoji_events, color: Colors.orange, onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const ChallengesScreen()));
                }),
              ],
            ),
            const SizedBox(height: 18),
            // Latest updates (placeholder)
            Expanded(
              child: ListView(
                children: [
                  Card(
                    color: Colors.white10,
                    child: ListTile(
                      leading: const Icon(Icons.trending_up, color: Colors.amber),
                      title: const Text('تحديث السوق: مؤشر X في ارتفاع 2%', style: TextStyle(color: Colors.white)),
                      subtitle: const Text('نصيحة: راجع التحليل الذكي الآن', style: TextStyle(color: Colors.white70)),
                      trailing: ElevatedButton(onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (_) => const AIChatScreen()));
                      }, child: const Text('تحليل')),
                    ),
                  ),
                  // المزيد من البطاقات...
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF0A0F1A),
        selectedItemColor: Colors.amber,
        unselectedItemColor: Colors.white70,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'الرئيسية'),
          BottomNavigationBarItem(icon: Icon(Icons.leaderboard), label: 'لوحة الشرف'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'حسابي'),
        ],
        onTap: (i){
          if(i==1) Navigator.push(context, MaterialPageRoute(builder: (_) => const LeaderboardScreen()));
          if(i==2) Navigator.push(context, MaterialPageRoute(builder: (_) => const ProfileScreen()));
        },
      ),
    );
  }
}

class _HomeCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final VoidCallback? onTap;
  const _HomeCard({required this.title, required this.icon, required this.color, this.onTap, super.key});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: Colors.white10,
        child: SizedBox(
          width: MediaQuery.of(context).size.width/3.6,
          height: 110,
          child: Center(child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 36, color: color),
              const SizedBox(height: 8),
              Text(title, style: const TextStyle(color: Colors.white)),
            ],
          )),
        ),
      ),
    );
  }
}
