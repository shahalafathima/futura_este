import 'dart:async';

import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 131, 160, 185),
          title: Text('Chat with Our HR'),
        ),
        body: ChatScreen(),
      ),
    );
  }
}

class ChatScreen extends StatefulWidget {
  @override
  State createState() => ChatScreenState();
}

class ChatScreenState extends State<ChatScreen> {
  final TextEditingController _textController = TextEditingController();
  final List<ChatMessage> _messages = <ChatMessage>[];

  void _handleSubmitted(String text) {
    _textController.clear();

    ChatMessage userMessage = ChatMessage(
      text: text,
      isUser: true,
    );

    ChatMessage hrReply = ChatMessage(
      text: 'Thank you for reaching out. We will get back to you shortly.',
      isUser: false,
    );

    setState(() {
      _messages.insert(0, userMessage);
      _messages.insert(0, hrReply);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Flexible(
          child: ListView.builder(
            reverse: true,
            itemCount: _messages.length,
            itemBuilder: (_, int index) => _messages[index],
          ),
        ),
        Divider(height: 1.0),
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
          ),
          child: _buildTextComposer(),
        ),
      ],
    );
  }

  Widget _buildTextComposer() {
    return IconTheme(
      data: IconThemeData(color: Theme.of(context).accentColor),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: <Widget>[
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

class ChatMessage extends StatelessWidget {
  ChatMessage({required this.text, required this.isUser});

  final String text;
  final bool isUser;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment:
            isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment:
                  isUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
              children: <Widget>[
                Text(isUser ? 'You' : 'HR',
                    style: Theme.of(context).textTheme.headline6),
                Container(
                  margin: const EdgeInsets.only(top: 5.0),
                  child: Text(text),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: CircleAvatar(
              child: Text(isUser ? 'U' : 'HR'),
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(ChatPage());
}
