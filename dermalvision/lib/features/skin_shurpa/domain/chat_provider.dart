import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';
import '../../auth/domain/auth_provider.dart';
import '../data/gemini_service.dart';
import '../data/chat_repository.dart';
import 'chat_message.dart';
import 'chat_repository.dart';

part 'chat_provider.g.dart';

@Riverpod(keepAlive: true)
ChatRepository chatRepository(ChatRepositoryRef ref) {
  return FirebaseChatRepository(FirebaseFirestore.instance);
}

@riverpod
Stream<List<ChatMessage>> chatMessages(ChatMessagesRef ref, String conversationId) {
  final user = ref.watch(authStateProvider).value;
  if (user == null) return const Stream.empty();
  return ref.watch(chatRepositoryProvider).watchMessages(user.uid, conversationId);
}

@riverpod
class ChatController extends _$ChatController {
  @override
  FutureOr<void> build() {}

  Future<void> sendMessage(String text, String conversationId) async {
    final user = ref.read(authStateProvider).value;
    if (user == null) return;

    final repo = ref.read(chatRepositoryProvider);
    final service = ref.read(geminiServiceProvider);

    // 1. Save user message
    final userMsg = ChatMessage(
      id: const Uuid().v4(),
      role: ChatRole.user,
      text: text,
      createdAt: DateTime.now(),
    );
    await repo.addMessage(user.uid, conversationId, userMsg);

    // 2. Get response
    state = const AsyncLoading();
    final responseText = await service.sendMessage(text);

    // 3. Save response
    if (responseText != null) {
      final modelMsg = ChatMessage(
        id: const Uuid().v4(),
        role: ChatRole.model,
        text: responseText,
        createdAt: DateTime.now(),
      );
      await repo.addMessage(user.uid, conversationId, modelMsg);
    }
    state = const AsyncData(null);
  }
}
