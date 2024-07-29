import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class GeminiService {
  final String apiKey;
  late final GenerativeModel model;

  GeminiService() : apiKey = dotenv.env['GEMINI_API_KEY'] ?? 'gemini_api_not_found' {
    model = GenerativeModel(
      model: 'gemini-1.5-flash',
      apiKey: apiKey,
    );
  }

  Future<String> prompt(String prompt) async {
    final response = await model.generateContent([Content.text(prompt)]);
    print(response.text);
    return response.text ?? 'No response text received/available';
  }
}
