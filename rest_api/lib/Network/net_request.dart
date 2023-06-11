import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rest_api/Objects/UserData.dart';

class NetRequest {
  static Future<dynamic> getUsers() async {
    // ApiService.get("api/users/2");
    try {
      final url = Uri.parse('https://reqres.in/api/users?page=1');
      final response = await http.get(url);
      if (response.statusCode == 200) {
        // UserData userData = UserData.fromJson(jsonDecode(response.body));
        UserData userData = userDataFromJson(response.body);
        return userData;
      } else {
        return "Status code:${response.statusCode}";
      }
    } catch (e) {
      return "Exception:${e.toString()}";
    }

    // return response;
  }
}
