import 'dart:convert';
import 'package:http/http.dart' as http;

/// هذا مثال يطلب من Endpoint آمن (Cloud Function أو Proxy).
/// لا تضع مفتاح OpenAI في الكود المباشر.
class AIService {
  final String endpoint;
  AIService({this.endpoint = 'https://YOUR_CLOUD_FUNCTION_ENDPOINT'}); // ضع هنا رابط الendpoint الآمن

  Future<String> ask(String prompt) async {
    try {
      final resp = await http.post(Uri.parse(endpoint),
        headers: {'Content-Type':'application/json'},
        body: jsonEncode({'prompt': prompt}),
      );
      if(resp.statusCode==200) {
        final data = jsonDecode(resp.body);
        return data['answer'] ?? 'لا توجد إجابة';
      } else {
        return 'خطأ في الخادم: ${resp.statusCode}';
      }
    } catch(e){
      return 'خطأ: $e';
    }
  }
}
