import 'dart:async';
import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  var isLoading = false.obs;
  int? res;
  RxString error = ''.obs;
  RxString role = ''.obs;
  var lang = ''.obs;
  var messge;

  void setLanguage(String? languageCode) {
    lang.value = languageCode ?? '';
  }

   Future<void> loginUser(String email, String password) async {
    isLoading.value = true;
    try {

       var response = await http.post(
        Uri.parse('https://drbayad-backend-ece2qdboea-uc.a.run.app/api/login'),
         headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(
            <String, String>{"phone_number": email, "password": password}),
      );
      print('state: ${response.statusCode}');
      if (response.statusCode == 200) {
        res = 200;
        print('Login : ${response.body}');
        var responseBody = jsonDecode(response.body);
        var token = responseBody['token'];
        var role = responseBody['role'];
        messge = responseBody['message'];
         print(role);
        await saveTokenAndRole(token, role.toString());
      } else {
        var responseBody = jsonDecode(response.body);
        error = responseBody['error'];
        print('Login failed: ${response.body}');
        print('Login failed: ${response.statusCode}');
        print('Login failed: ${response}');
      }
    } catch (e) {
      print(e);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> saveTokenAndRole(String token, String role) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
    await prefs.setString('role', role);
    this.role.value = role;
  }

}
