import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../services/gemini_prompt.dart';

class ChatbotPage extends StatefulWidget {
  const ChatbotPage({super.key});

  @override
  _ChatbotPageState createState() => _ChatbotPageState();
}

class _ChatbotPageState extends State<ChatbotPage> {
  final TextEditingController _controller = TextEditingController();
  final List<String> _messages = [];
  bool _isLoading = false;
  bool _isServiceInitialized = false;
  bool _showInstructions = true;
  bool _showNextButton = false;

  late final GeminiService geminiService;

  @override
  void initState() {
    super.initState();
    _initializeService();
  }

  void _initializeService() async {
    setState(() {
      _isServiceInitialized = false;
    });
    geminiService = GeminiService();
    // Simulate service initialization
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      _isServiceInitialized = true;
    });
  }

  void _sendMessage() async {
    if (_controller.text.isNotEmpty) {
      String userMessage = _controller.text;
      setState(() {
        _messages.add(userMessage);
        _messages.add("Bot is typing..."); // Add a temporary message
        _isLoading = true;
        _showInstructions =
            false; // Hide instructions after sending the first message
      });
      _controller.clear();

      try {
        String botResponse = await geminiService.prompt(userMessage);
        setState(() {
          _messages.removeLast(); // Remove the temporary message
          _messages.add(botResponse);
          _isLoading = false;
          _showNextButton = true; // Show the next button after the first chat
        });
      } catch (e) {
        print('Error fetching bot response: $e');
        setState(() {
          _messages.removeLast(); // Remove the temporary message
          _messages.add('Sorry, I couldn\'t process that request.');
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.0),
        child: const ChatbotPageHeader(),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              if (_isServiceInitialized && _showInstructions)
                Expanded(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        'Type your message below to start chatting with the bot.',
                        style:
                            TextStyle(fontSize: 16.0, color: Colors.grey[600]),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                )
              else
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
              if (_showNextButton)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/courses/read_lesson");
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(35, 89, 197,
                          0.867), // Change this to your desired color
                    ),
                    child: const Text("Proceed to Next?"),
                  ),
                ),
            ],
          ),
          if (!_isServiceInitialized)
            const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                    Color.fromRGBO(35, 89, 197, 0.867)),
              ),
            ),
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
        mainAxisAlignment:
            isUserMessage ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: isUserMessage
                  ? CrossAxisAlignment.end
                  : CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(top: 5.0),
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: isUserMessage ? Colors.blueAccent : Colors.grey[300],
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Text(
                    message,
                    style: TextStyle(
                      color: isUserMessage ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
