import 'dart:convert';  // JSON encode/decode karne ke liye
import 'dart:io';  // HTTP client aur networking ke liye
import 'package:http/http.dart' as http;  // HTTP requests bhejne ke liye
import 'package:http/io_client.dart';  // Secure HTTP requests handle karne ke liye


class Apis {
  static Future<void> getAnswer(String question) async { //Static method banaya taaki object create na karna pade isse call karne ke liye.


    //HttpClient() → Ek secure HTTP client create karta hai.
    HttpClient client = HttpClient();
    // badCertificateCallback → Agar SSL certificate me error ho to bhi request allow karne ke liye.
    client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
    // IOClient(client) → HttpClient ko http package ke sath integrate karne ke liye.
    final ioClient = IOClient(client);

    final res = await ioClient.post(
      Uri.parse('https://generativelanguage.googleapis.com/v1beta/models/gemini-pro:generateContent?key=AIzaSyBmLOe-h9fMN8b6k_0MeBVRvnxoWSreZTY'),
      headers: {
        //contentTypeHeader: 'application/json' → Server ko batata hai ki request JSON format me hai.
        HttpHeaders.contentTypeHeader: 'application/json',
      },
      //Request body ko JSON format me convert karta hai.
      body: jsonEncode({
        //AI model ko input question bhejne ke liye.
        "contents": [
          {
            "parts": [
              {"text": question}
            ]
          }
        ],
        "generationConfig": {
          //"temperature": 0 → AI ka response har baar same hoga (deterministic behavior).
          "temperature": 0,  // Fixed response ke liye
          //"maxOutputTokens": 2000 → AI bada response generate kar sakega.
          "maxOutputTokens": 2000  // Long response ke liye
        }
      }),
    );

    if (res.statusCode == 200) {
      // JSON response ko Dart object me convert karta hai.
      final data = jsonDecode(res.body);
      String aiResponse = data["candidates"][0]["content"]["parts"][0]["text"];
      print('AI Response: $aiResponse');
    } else {
      print('Error: ${res.body}');
    }
  }
}
