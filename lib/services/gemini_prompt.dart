import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

// import 'package:flutter_dotenv/flutter_dotenv.dart';

class GeminiService {
  final String apiKey;

  GeminiService() : apiKey = dotenv.env['GEMINI_API_KEY'] ?? 'gemini_api_not_found';

  final model = GenerativeModel(
    model: 'gemini-1.5-flash',
    apiKey: dotenv.env['GEMINI_API_KEY'] ?? 'gemini_api_not_found',
  );

  void prompt(String prompt) async {
    final response = await model.generateContent([Content.text(prompt)]);
    print(response.text);
  }
}
