import 'dart:async';
import 'dart:convert';  // JSON encode/decode karne ke liye
import 'dart:io';  // HTTP client aur networking ke liye
import 'package:http/http.dart' as http;  // HTTP requests bhejne ke liye
import 'package:http/io_client.dart';

import '../helper/global.dart';  // Secure HTTP requests handle karne ke liye

class Apis {
  static Future<String> getAnswer(String question) async {
    try {
      HttpClient client = HttpClient();
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      final ioClient = IOClient(client);

      final res = await ioClient.post(
        Uri.parse(
            'https://generativelanguage.googleapis.com/v1beta/models/gemini-pro:generateContent?key=AIzaSyBmLOe-h9fMN8b6k_0MeBVRvnxoWSreZTY'),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
        },
        body: jsonEncode({
          "contents": [
            {
              "parts": [
                {"text": question}
              ]
            }
          ],
          "generationConfig": {
            "temperature": 0,
            "maxOutputTokens": 2000
          }
        }),
      );

      if (res.statusCode == 200) {
        final data = jsonDecode(res.body);
        print("data...:${data}");
        String aiResponse = data["candidates"][0]["content"]["parts"][0]["text"];
        return aiResponse;
      } else {
        print('Server Error: ${res.body}');
        return "Server Error: Failed to fetch response";
      }
    } catch (e) {
      // Different types of errors handle karenge
      if (e is SocketException) {
        return "No Internet Connection. Please check your network.";
      } else if (e is TimeoutException) {
        return "Request Timed Out. Please try again.";
      } else if (e is FormatException) {
        return "Invalid Response Format. Please contact support.";
      } else {
        return "Unexpected Error: ${e.toString()}";
      }
    }
  }


  //
// **Image generation function**
//   static Future<String?> generateImage(String prompt) async {
//     try {
//       final response = await http.post(
//         Uri.parse("https://api.openai.com/v1/images/generations"),
//         headers: {
//           "Authorization": "Bearer $imageApiKey",
//           "Content-Type": "application/json",
//         },
//         body: jsonEncode({
//           "model": "dall-e-2",
//           "prompt": prompt,
//           "n": 1,
//           "size": "1024x1024",
//         }),
//       );
//
//       if (response.statusCode == 200) {
//         final data = jsonDecode(response.body);
//         print("Image Response Data: $data");
//
//         // ✅ Correct way to extract image URL
//         return data["data"][0]["url"];
//       } else {
//         print("Server Error: ${response.body}");
//         return null;
//       }
//     } catch (e) {
//       print("Error: ${e.toString()}");
//       return null;
//     }
//   }


}
