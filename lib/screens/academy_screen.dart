import 'package:flutter/material.dart';

class AcademyScreen extends StatelessWidget {
  const AcademyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('🎓 Karam Academy'),
        backgroundColor: Colors.amber[700],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'مرحبًا بك في أكاديمية كرام لتعلّم التداول والذكاء الاصطناعي!',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          VideoCard(
            title: 'مقدمة إلى التداول',
            description: 'تعلم أساسيات التداول خطوة بخطوة',
          ),
          VideoCard(
            title: 'التحليل الفني',
            description: 'شرح مبسّط لأهم المؤشرات الفنية',
          ),
          VideoCard(
            title: 'التداول بالذكاء الاصطناعي',
            description: 'كيف يستخدم الذكاء الصناعي في التوقعات المالية',
          ),
        ],
      ),
    );
  }
}

class VideoCard extends StatelessWidget {
  final String title;
  final String description;

  const VideoCard({super.key, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      margin: const EdgeInsets.only(bottom: 16),
      child: ListTile(
        leading: const Icon(Icons.play_circle_fill, size: 40, color: Colors.amber),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(description),
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('سيتم تشغيل الفيديو "$title" قريبًا')),
          );
        },
      ),
    );
  }
}
