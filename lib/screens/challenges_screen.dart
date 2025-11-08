import 'package:flutter/material.dart';

class ChallengesScreen extends StatefulWidget {
  const ChallengesScreen({super.key});

  @override
  State<ChallengesScreen> createState() => _ChallengesScreenState();
}

class _ChallengesScreenState extends State<ChallengesScreen> {
  final List<Map<String, dynamic>> _challenges = [
    {
      "title": "تحدي الأسبوع: تحليل سوق العملات",
      "description": "قم بتحليل حركة زوج EUR/USD وتوقّع الاتجاه خلال 3 أيام.",
      "reward": "100 نقطة خبرة",
      "status": false,
    },
    {
      "title": "مسابقة الذكاء الصناعي",
      "description": "استخدم أدوات الذكاء الصناعي لتوقّع سعر البيتكوين خلال يوم.",
      "reward": "200 نقطة خبرة",
      "status": false,
    },
    {
      "title": "اختبار استراتيجيات التداول",
      "description": "أجب على 5 أسئلة حول استراتيجيات التحليل الفني.",
      "reward": "شهادة تميز رقمية",
      "status": true,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('🏆 مسابقات كَرام'),
        backgroundColor: Colors.amber[700],
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: _challenges.length,
        itemBuilder: (context, index) {
          final challenge = _challenges[index];
          return Card(
            elevation: 5,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            margin: const EdgeInsets.only(bottom: 16),
            child: ListTile(
              leading: Icon(
                challenge["status"] ? Icons.check_circle : Icons.military_tech,
                color: challenge["status"] ? Colors.green : Colors.amber[700],
                size: 40,
              ),
              title: Text(challenge["title"],
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(challenge["description"]),
              trailing: Text(challenge["reward"],
                  style: const TextStyle(color: Colors.blueGrey, fontSize: 12)),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                        'تم تسجيلك في ${challenge["title"]}! حظًا موفقًا 💪'),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
