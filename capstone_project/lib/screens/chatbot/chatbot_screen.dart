import 'package:flutter/material.dart';
import 'package:capstone_project/constants/color_theme.dart';
import 'package:capstone_project/constants/text_theme.dart';

class ChatMessage {
  final String text;
  final bool isUser;

  ChatMessage({required this.text, required this.isUser});
}

class ChatbotPage extends StatefulWidget {
  const ChatbotPage({Key? key}) : super(key: key);

  @override
  _ChatbotPageState createState() => _ChatbotPageState();
}

class _ChatbotPageState extends State<ChatbotPage> {
  final TextEditingController _messageController = TextEditingController();
  final List<ChatMessage> _messages = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'CareBot',
          style: ThemeTextStyle()
              .hadlineSmall
              .copyWith(fontWeight: FontWeight.w500),
        ),
        backgroundColor: ThemeColor().primaryFrame,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true,
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                if (index >= 0 && index < _messages.length) {
                  final message = _messages[index];
                  return Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Row(
                      mainAxisAlignment: message.isUser
                          ? MainAxisAlignment.end
                          : MainAxisAlignment.start,
                      children: [
                        if (!message.isUser)
                          CircleAvatar(
                            backgroundColor: ThemeColor().textChat,
                            child: Text(
                              'B',
                              style: ThemeTextStyle().hadlineSmall,
                            ),
                          ),
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.all(8.0),
                            padding: const EdgeInsets.all(12.0),
                            decoration: BoxDecoration(
                              color: message.isUser
                                  ? ThemeColor().textChat
                                  : ThemeColor().primaryButton,
                              borderRadius: BorderRadius.circular(8.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  spreadRadius: 2,
                                  blurRadius: 4,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Text(
                              message.text,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                        if (message.isUser)
                          CircleAvatar(
                            backgroundColor: ThemeColor().primaryFrame,
                            child: Text(
                              'U',
                              style: ThemeTextStyle().hadlineSmall,
                            ),
                          ),
                      ],
                    ),
                  );
                } else {
                  return Container(); // atau widget lain jika indeks tidak valid...
                }
              },
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 8, bottom: 8, left: 20, right: 10),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Type a message...',
                      hintStyle: const TextTheme().bodyMedium,
                    ),
                  ),
                ),
                IconButton(
                  constraints:
                      const BoxConstraints(minWidth: 24, minHeight: 24),
                  icon: Icon(
                    Icons.send,
                    color: ThemeColor().primaryButton,
                  ),
                  onPressed: () {
                    String messageText = _messageController.text;
                    if (messageText.isNotEmpty) {
                      ChatMessage message =
                          ChatMessage(text: messageText, isUser: true);
                      _messages.insert(0, message);
                      _messageController.clear();
                      setState(() {});
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
