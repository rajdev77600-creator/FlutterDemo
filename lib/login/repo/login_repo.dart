import 'dart:convert';
import 'package:http/http.dart' as http;

import '../model/login_request_model.dart';
import '../model/login_response_model.dart';

class LoginRepo {
  Future<LoginResponseModel> login(String username, String password) async {
    var url = "https://dummyjson.com/auth/login";

    LoginReqestModel loginReqestModel = LoginReqestModel(username: username, password: password);

    final response = await http.post(
      Uri.parse(url),
      headers: {
        "Content-Type": "application/json",
      },
      body: jsonEncode(loginReqestModel.toJson()),
    );

    if (response.statusCode == 200) {
      return LoginResponseModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Login failed: ${response.statusCode}");
    }
  }
}