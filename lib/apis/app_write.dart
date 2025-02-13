import 'package:appwrite/appwrite.dart';

class AppWrite {
  static final _client = Client();
  static final _database = Databases(_client);

  static void init() {
    _client.setEndpoint('https://cloud.appwrite.io/v1'); // Your Appwrite Endpoint
    _client.setProject('67add7dd001dd7825648'); // Your project ID
    _client.setSelfSigned(status: true);
    getApiKeys();
  }

  // ✅ Dono API keys return karne ka function
  static Future<Map<String, String>> getApiKeys() async {
    try {
      final d = await _database.getDocument(
        databaseId: '67addc6f0026d80ced11',
        collectionId: '67addd500000f97f4ec0',
        documentId: 'chatGeminiKey',
      );
      String geminiKey = d.data['apiKey'] ?? '';  // Gemini API Key
      String pexelsKey = d.data['imageKey'] ?? '';  // Pexels API Key

      print("Gemini API Key: $geminiKey");
      print("Pexels API Key: $pexelsKey");

      return {
        'geminiKey': geminiKey,
        'pexelsKey': pexelsKey,
      };
    } catch (e) {
      print("Error fetching API keys: $e");
      return {
        'geminiKey': '',
        'pexelsKey': '',
      };
    }
  }
}
