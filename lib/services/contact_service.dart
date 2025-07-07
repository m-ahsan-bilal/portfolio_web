import 'package:http/http.dart' as http;
import 'dart:convert';

class ContactService {
  // Your deployed Railway backend URL
  static const String baseUrl =
      'https://portfolioapi-production-95b0.up.railway.app';

  static Future<Map<String, dynamic>> submitContactForm({
    required String email,
    required String topic,
    required String message,
  }) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/contact'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'email': email,
          'topic': topic,
          'message': message,
        }),
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else if (response.statusCode == 422) {
        // Validation error
        final errorData = jsonDecode(response.body);
        throw Exception('Validation error: ${errorData['detail']}');
      } else if (response.statusCode == 429) {
        // Rate limit error
        throw Exception(
            'Rate limit exceeded. Please wait before trying again.');
      } else {
        throw Exception('Server error: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
