import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../services/gemini_prompt.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../widgets/nav-footer.dart';

class ChatbotPage extends StatefulWidget {
  const ChatbotPage({super.key});

  @override
  _ChatbotPageState createState() => _ChatbotPageState();
}

class _ChatbotPageState extends State<ChatbotPage> {
  final TextEditingController _controller = TextEditingController();
  final List<String> _messages = [];
  bool _isLoading = false;

  final GeminiService geminiService = GeminiService();

  // Load the API key and URL, providing default values if they are not found
  // final String apiKey = dotenv.env['GEMINI_API_KEY'] ?? 'default_api_key';
  final String apiKey = 'default_api_key';
  final String apiUrl = 'https://api.gemini.com/chatbot';

  void _sendMessage() async {
    geminiService.prompt("Hello");
    if (_controller.text.isNotEmpty) {
      String userMessage = _controller.text;
      setState(() {
        _messages.add(userMessage);
        _isLoading = true;
      });
      _controller.clear();

      try {
        String botResponse = await fetchBotResponse(userMessage);
        setState(() {
          _messages.add(botResponse);
          _isLoading = false;
        });
      } catch (e) {
        print('Error fetching bot response: $e');
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  Future<String> fetchBotResponse(String message) async {
    final response = await http.post(
      Uri.parse(apiUrl), // Use the API URL from .env
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $apiKey', // Use the API key from .env
      },
      body: jsonEncode(<String, String>{
        'message': message,
      }),
    );

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return data['response']; // Adjust according to your API response structure
    } else {
      throw Exception('Failed to load response: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.0),
        child: const ChatbotPageHeader(),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return ChatMessage(
                  message: _messages[index],
                  isUserMessage: index % 2 == 0,
                );
              },
            ),
          ),
          if (_isLoading)
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: CircularProgressIndicator(),
            ),
          const Divider(height: 1.0),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            color: Theme.of(context).cardColor,
            child: Row(
              children: <Widget>[
                Flexible(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration.collapsed(
                      hintText: "Send a message",
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
          const NavFooter(),
        ],
      ),
    );
  }
}

class ChatbotPageHeader extends StatelessWidget {
  const ChatbotPageHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0, // Set desired height
      color: Colors.white70,
      padding: const EdgeInsets.fromLTRB(16.0, 20.0, 16.0, 8.0),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: IconButton(
              icon: const FaIcon(FontAwesomeIcons.arrowLeft, size: 20),
              color: const Color.fromRGBO(13, 18, 28, 0.867),
              onPressed: () {
                Navigator.pop(context);
                // Define your action here
              },
            ),
          ),
          Center(
            child: Text(
              'Chatbot',
              style: TextStyle(
                fontSize: 24.0,
                color: const Color.fromRGBO(13, 18, 28, 0.867),
                fontFamily: "Lexend",
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center, // Center the header text
            ),
          ),
        ],
      ),
    );
  }
}

class ChatMessage extends StatelessWidget {
  final String message;
  final bool isUserMessage;

  const ChatMessage({
    required this.message,
    required this.isUserMessage,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          isUserMessage
              ? Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        "You",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 5.0),
                        child: Text(message),
                      ),
                    ],
                  ),
                )
              : Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Bot",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 5.0),
                        child: Text(message),
                      ),
                    ],
                  ),
                ),
        ],
      ),
    );
  }
}