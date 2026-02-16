import 'chat_message.dart';

abstract class ChatRepository {
  Future<void> addMessage(String uid, String conversationId, ChatMessage message);
  Stream<List<ChatMessage>> watchMessages(String uid, String conversationId);
  Future<String> createConversation(String uid);
}
