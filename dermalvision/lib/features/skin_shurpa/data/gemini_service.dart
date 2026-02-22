import 'package:firebase_vertexai/firebase_vertexai.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'gemini_service.g.dart';

@Riverpod(keepAlive: true)
GeminiService geminiService(GeminiServiceRef ref) {
  return GeminiService();
}

class GeminiService {
  GenerativeModel? _model;
  ChatSession? _chat;

  void init(String systemPrompt) {
    _model = FirebaseVertexAI.instance.generativeModel(
      model: 'gemini-1.5-flash',
      systemInstruction: Content.system(systemPrompt),
    );
    _chat = _model!.startChat();
  }

  Future<String?> sendMessage(String text) async {
    if (_model == null) {
      // Default init if not called
      init('You are SkinShurpa, a helpful skin health assistant.');
    }
    try {
      final response = await _chat!.sendMessage(Content.text(text));
      return response.text;
    } catch (e) {
      return "I'm having trouble connecting right now. Please try again later. ($e)";
    }
  }
}
