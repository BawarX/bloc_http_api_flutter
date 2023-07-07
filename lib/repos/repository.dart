import 'dart:convert';

import 'package:bloc_http_api/userModel/user_model.dart';
import 'package:http/http.dart';

class userRepository {
  String endPoint = 'https://reqres.in/api/users?page=2';
  getUsers() async {
    Response response = await get(Uri.parse(endPoint));
    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body)['data'];
      return result.map(((e) => UserModel.fromJson(e))).toList();
      // e means accessing each of them, then convert it to object and finally we are making it a list...
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
