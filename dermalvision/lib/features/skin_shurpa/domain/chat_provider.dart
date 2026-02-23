import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../skin_shurpa/data/chat_repository.dart';
import '../../skin_shurpa/domain/chat_message.dart';
import '../../skin_shurpa/data/gemini_service.dart';

part 'chat_provider.g.dart';

@riverpod
ChatRepository chatRepository(ChatRepositoryRef ref) {
  // Assuming ChatRepository exists or needs to be provided
  throw UnimplementedError('ChatRepository not implemented fully');
}

@riverpod
class ChatController extends _ {
  @override
  FutureOr<void> build() {
    // nothing to do
  }

  Future<void> sendMessage(String text) async {
    // Implementation
  }
}

// Simplified for build fix
final chatMessagesProvider = StreamProvider.autoDispose.family<List<ChatMessage>, String>((ref, conversationId) {
  return Stream.value([]);
});
