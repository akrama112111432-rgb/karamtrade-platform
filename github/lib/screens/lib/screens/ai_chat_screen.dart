import 'package:flutter/material.dart';
import '../services/ai_service.dart';

class AIChatScreen extends StatefulWidget {
  const AIChatScreen({super.key});
  @override
  State<AIChatScreen> createState() => _AIChatScreenState();
}

class _AIChatScreenState extends State<AIChatScreen> {
  final TextEditingController _ctrl = TextEditingController();
  final List<Map<String,String>> _messages = [];
  final AIService _ai = AIService(); // سيقرأ المفتاح من مكان آمن

  bool _loading=false;

  void send() async {
    final text = _ctrl.text.trim();
    if(text.isEmpty) return;
    setState(()=> _messages.add({'role':'user','text':text}),);
    _ctrl.clear();
    setState(()=> _loading=true);
    final reply = await _ai.ask(text);
    setState(()=> _messages.add({'role':'assistant','text':reply},),);
    setState(()=> _loading=false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('مساعد التداول الذكي')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: _messages.length,
              itemBuilder: (_,i){
                final m = _messages[i];
                final isUser = m['role']=='user';
                return Align(
                  alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical:6),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: isUser? Colors.white10 : Colors.white12,
                      borderRadius: BorderRadius.circular(12)
                    ),
                    child: Text(m['text']!, style: const TextStyle(color: Colors.white)),
                  ),
                );
              }
            ),
          ),
          if(_loading) const LinearProgressIndicator(),
          SafeArea(child: Row(
            children: [
              Expanded(child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(controller: _ctrl, decoration: const InputDecoration(hintText: 'اكتب سؤالاً عن السوق أو الاستراتيجية...', filled: true)),
              )),
              IconButton(icon: const Icon(Icons.send), onPressed: send, color: Colors.amber,)
            ],
          ))
        ],
      ),
    );
  }
}
