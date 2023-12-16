import 'dart:convert';

ChatBotModel chatBotModelFromJson(String str) =>
    ChatBotModel.fromJson(json.decode(str));

String chatBotModelToJson(ChatBotModel data) => json.encode(data.toJson());

class ChatBotModel {
  final ChatBotMeta meta;
  final String results;

  ChatBotModel({
    required this.meta,
    required this.results,
  });

  factory ChatBotModel.fromJson(Map<String, dynamic> json) => ChatBotModel(
        meta: ChatBotMeta.fromJson(json["meta"]),
        results: json["results"],
      );

  Map<String, dynamic> toJson() => {
        "meta": meta.toJson(),
        "results": results,
      };
}

class ChatBotMeta {
  final bool success;
  final String message;

  ChatBotMeta({
    required this.success,
    required this.message,
  });

  factory ChatBotMeta.fromJson(Map<String, dynamic> json) => ChatBotMeta(
        success: json["success"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
      };
}
