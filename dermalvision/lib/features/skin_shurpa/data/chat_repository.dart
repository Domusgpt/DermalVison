import 'package:cloud_firestore/cloud_firestore.dart';
import '../domain/chat_message.dart';
import '../domain/chat_repository.dart';

class FirebaseChatRepository implements ChatRepository {
  FirebaseChatRepository(this._firestore);
  final FirebaseFirestore _firestore;

  @override
  Future<void> addMessage(
      String uid, String conversationId, ChatMessage message) {
    return _firestore
        .collection('users')
        .doc(uid)
        .collection('conversations')
        .doc(conversationId)
        .collection('messages')
        .doc(message.id)
        .set(message.toJson());
  }

  @override
  Stream<List<ChatMessage>> watchMessages(String uid, String conversationId) {
    return _firestore
        .collection('users')
        .doc(uid)
        .collection('conversations')
        .doc(conversationId)
        .collection('messages')
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => ChatMessage.fromJson(doc.data()))
            .toList());
  }

  @override
  Future<String> createConversation(String uid) async {
    final doc = await _firestore
        .collection('users')
        .doc(uid)
        .collection('conversations')
        .add({
      'startedAt': FieldValue.serverTimestamp(),
    });
    return doc.id;
  }
}
