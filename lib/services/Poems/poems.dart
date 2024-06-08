import 'dart:convert';
import 'dart:developer';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:horrorhub/models/poem_model.dart';
import 'package:horrorhub/services/Database/database.dart';
import 'package:http/http.dart' as http;

class Poem {
  static String chatGPTKEY = dotenv.get('GPT_API_KEY');

  ///Generate Poems
  static Future<String?> generatePoem(PoemModel poemModel, String uid) async {
    try {
      // print(chatGPTKEY);
      final response = await http.post(
        Uri.parse('https://api.openai.com/v1/chat/completions'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $chatGPTKEY',
        },
        body: jsonEncode({
          'model': 'gpt-3.5-turbo',
          'messages': [
            {
              'role': 'user',
              'content':
                  'Just Write a horror story of only 50 words for ${poemModel.name} about ${poemModel.relationship} in ${poemModel.poemType} style in the language ${poemModel.language}.',
            }
          ],
          'max_tokens': 250,
          'temperature': 0.7,
        }),
      );
      final data = jsonDecode(utf8.decode(response.bodyBytes));
      log(data.toString());
      String? poem = data['choices'][0]['message']['content'];
      DatabaseService databaseService = DatabaseService(uid: uid);
      poemModel.poem = poem!;
      await databaseService.addPoem(poemModel);
      return poem;
    } catch (e) {
      return null;
    }
  }
}
