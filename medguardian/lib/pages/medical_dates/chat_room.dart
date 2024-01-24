import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController _textController = TextEditingController();
  List<Map<String, String>> chatHistory = [];

  void _handleSubmitted(String text) {
    _textController.clear();

    // Process user input
    String response = processUserInput(text);

    // Update chat history
    setState(() {
      chatHistory.add({'user': text});
      chatHistory.add({'nova': response});
    });
  }

  String processUserInput(String userInput) {
    // Predefined responses
    Map<String, String> chatResponses = {
      'hello': 'Hi there!',
      'how are you':
          'I am just a chatbot, but I am doing well. How can I assist you?',
      'help':
          'Sure, I can help you with medication information, health tips, etc.',
      'who are you':
          'N.O.V.A, your Navigational Organism for Vitality and Assistance!!'
    };

    // This checks the predefined responses
    return chatResponses[userInput.toLowerCase()] ??
        'I didn\'t understand that. Can you please clarify?';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // To remove the back arrow
        title: Center(
          child: Text('N.O.V.A'),
        ),
      ),
      body: Stack(
        children: [
          
          Positioned(
            bottom: 0,
            left: 0,
            child: Image.asset(
              'assets/MSD.png', 
              fit: BoxFit.cover,
              width: 250,
              height: 400,
            ),
          ),
          Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: chatHistory.length,
                  itemBuilder: (context, index) {
                    Map<String, String> message = chatHistory[index];
                    return Align(
                      alignment: message.containsKey('user')
                          ? Alignment.topRight // Align user's message to the right
                          : Alignment.topLeft, // Align N.O.V.A's message to the left
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        margin: const EdgeInsets.symmetric(
                          vertical: 4.0,
                          horizontal: 8.0,
                        ),
                        decoration: BoxDecoration(
                          color: message.containsKey('user')
                              ? Colors.lightGreen // Light green for user messages
                              : Colors.green, // Darker green for N.O.V.A messages
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Text(
                          message.values.first,
                          style: TextStyle(
                            color: message.containsKey('user')
                                ? Colors.black // Text color for user messages
                                : Colors.white, // Text color for N.O.V.A messages
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Divider(height: 1.0),
              Container(
                decoration: BoxDecoration(color: Theme.of(context).cardColor),
                child: _buildTextComposer(),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTextComposer() {
    return IconTheme(
      data: IconThemeData(color: Colors.green),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: [
            Flexible(
              child: TextField(
                controller: _textController,
                onSubmitted: _handleSubmitted,
                decoration: InputDecoration.collapsed(
                  hintText: 'Send a message',
                ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.send),
              onPressed: () => _handleSubmitted(_textController.text),
            ),
          ],
        ),
      ),
    );
  }
}
