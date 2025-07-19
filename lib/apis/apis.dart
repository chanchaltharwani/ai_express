import 'dart:async';
import 'dart:convert'; // JSON encode/decode karne ke liye
import 'dart:io'; // HTTP client aur networking ke liye
import 'package:http/http.dart' as http;
import 'package:ai_express/helper/global.dart';
import 'package:http/io_client.dart';

class Apis {
  // static Future<String> getAnswer(String question) async {
  //   try {
  //     HttpClient client = HttpClient();
  //     client.badCertificateCallback =
  //         (X509Certificate cert, String host, int port) => true;
  //     final ioClient = IOClient(client);
  //
  //     final res = await ioClient.post(
  //       Uri.parse(
  //           'https://generativelanguage.googleapis.com/v1/models/gemini-1.5-pro:generateContent?key=AIzaSyBmLOe-h9fMN8b6k_0MeBVRvnxoWSreZTY')
  //       ,
  //       headers: {
  //         HttpHeaders.contentTypeHeader: 'application/json',
  //       },
  //       body: jsonEncode({
  //         "contents": [
  //           {
  //             "role": "user",
  //             "parts": [
  //               {"text": question}
  //             ]
  //           }
  //         ],
  //         "generationConfig": {"temperature": 0, "maxOutputTokens": 2000}
  //       }),
  //     );
  //
  //     if (res.statusCode == 200) {
  //       final data = jsonDecode(res.body);
  //       print("data...:${data}");
  //       String aiResponse =
  //       data["candidates"][0]["content"]["parts"][0]["text"];
  //       return aiResponse;
  //     } else {
  //       print('Server Error: ${res.body}');
  //       return "Server Error: Failed to fetch response";
  //     }
  //   } catch (e) {
  //     if (e is SocketException) {
  //       return "No Internet Connection. Please check your network.";
  //     } else if (e is TimeoutException) {
  //       return "Request Timed Out. Please try again.";
  //     } else if (e is FormatException) {
  //       return "Invalid Response Format. Please contact support.";
  //     } else {
  //       return "Unexpected Error: ${e.toString()}";
  //     }
  //   }
  // }
  static Future<String> getAnswer(String question) async {
    try {
      HttpClient client = HttpClient();
      client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
      final ioClient = IOClient(client);

      final res = await ioClient.post(
        Uri.parse(
            'https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generateContent?key=AIzaSyBmLOe-h9fMN8b6k_0MeBVRvnxoWSreZTY'
        ),
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
          ]
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


  //image generation function
  // 🔹 Pexels API ke liye updated function
  static Future<List<String>> searchImages(String prompt) async {
    try {
      final response = await http.get(
        Uri.parse(
            'https://api.pexels.com/v1/search?query=${Uri.encodeComponent(prompt)}&per_page=10'),
        headers: {
          HttpHeaders.authorizationHeader: imagekey, // ✅ API Key as Header
        },
      );

      if (response.statusCode != 200) {
        print('Server Error: ${response.body}');
        return [];
      }

      final data = jsonDecode(response.body);
      print("API Response: $data"); // 🔹 Debugging ke liye

      // ✅ Extracting Image URLs from "photos" list
      return List.from(data['photos'])
          .map((e) => e['src']['medium'].toString()) // ✅ medium size image
          .toList();
    } catch (e) {
      print('searchImagesE: $e');
      return [];
    }
  }

//updated api end point check karne k liye method in future agar api end point chnage hua to usko hum api k url m update
  static Future<void> fetchModels() async {
    try {
      final response = await http.get(
        Uri.parse("https://generativelanguage.googleapis.com/v1/models?key=AIzaSyBmLOe-h9fMN8b6k_0MeBVRvnxoWSreZTY"),
      );

      print("Response Body: ${response.body}");
    } catch (e) {
      print("Error: $e");
    }
  }

}
