import 'package:capstone_project/models/api/chatbot_api.dart';
import 'package:capstone_project/models/chatbot_model.dart';
import 'package:chatview/chatview.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ChatBotProvider extends ChangeNotifier {
  int _idMessage = 0;
  int get idMessage => _idMessage;

  final List<Message> _listMessage = [];
  List<Message> get listMessage => _listMessage;

  String? _userId;
  String? get idUser => _userId;

  String? _userName;
  String? get userName => _userName;

  String? botAnswer;

  final Map<String, String> _mapUser = {
    "bot": "0",
    "user": "1",
  };
  Map<String, String> get mapUser => _mapUser;
  List get listUser => _mapUser.entries.toList();

  ChatUser currentUser({
    required String activeUserId,
    required String activeUserName,
  }) {
    _userName = activeUserName;
    _userId = activeUserId;
    final user = ChatUser(id: _userId!, name: _userName!);

    return user;
  }

  late ChatController _chatController;
  ChatController? get chatController => _chatController;

  ChatController setChatController({
    required List<Message> initialMessageList,
    required ScrollController scrollController,
    required List<ChatUser> chatUsers,
  }) {
    final controller = ChatController(
        initialMessageList: initialMessageList,
        scrollController: scrollController,
        chatUsers: chatUsers);
    _chatController = controller;

    return _chatController;
  }

  @override
  void dispose() {
    _chatController.dispose();
    super.dispose();
  }

  void onQuestionPressed(String message) async {
    final user =
        currentUser(activeUserId: _userId!, activeUserName: _userName!);
    final userId = user.id;

    try {
      final chatbot = await ChatBotApi.postChatBot(message);
      botAnswer = chatbot.results;
    } on DioException catch (e) {
      final error = e as ChatBotModel;
      if (error.meta.success == false) {
        botAnswer = 'Maaf, saya tidak tahu jawabannya';
        debugPrint('${e.response?.statusCode} ${e.response?.statusMessage}');
      }
    }

    _chatController.addMessage(
      Message(
        id: _idMessage.toString(),
        message: message,
        createdAt: DateTime.now(),
        sendBy: userId,
        replyMessage: const ReplyMessage(),
        messageType: MessageType.text,
        status: MessageStatus.delivered,
      ),
    );

    _idMessage++;
    debugPrint(_idMessage.toString());
    showHideTypingIndicator();
    generateBotAnswer(botAnswer!);
  }

  void showHideTypingIndicator() {
    _chatController.setTypingIndicator = !_chatController.showTypingIndicator;
  }

  void generateBotAnswer(String message) {
    Future.delayed(const Duration(seconds: 2), () {
      _chatController.addMessage(
        Message(
          id: _idMessage.toString(),
          message: message,
          createdAt: DateTime.now(),
          sendBy: '0',
          replyMessage: const ReplyMessage(),
          messageType: MessageType.text,
          status: MessageStatus.delivered,
        ),
      );
      _idMessage++;
      showHideTypingIndicator();
      debugPrint(_idMessage.toString());
    });
  }

  void onSendTap(
    String message,
    ReplyMessage replyMessage,
    MessageType messageType,
  ) {
    final user =
        currentUser(activeUserId: _userId!, activeUserName: _userName!);
    final userId = user.id;

    _chatController.addMessage(
      Message(
        id: _idMessage.toString(),
        createdAt: DateTime.now(),
        message: message,
        sendBy: userId,
        replyMessage: replyMessage,
        messageType: messageType,
        status: MessageStatus.delivered,
      ),
    );

    _idMessage++;
  }
}
