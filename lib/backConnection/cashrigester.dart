import 'dart:async';
import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../model/deposetmodel.dart';
import '../model/expensemodel.dart';
import '../model/logsmodel.dart';
import '../model/usermode.dart';
import '../model/withdrawmodel.dart';

class cashControler extends GetxController {
  var isLoading = false.obs;
  int? res;
  RxString message = ''.obs;
  RxString error = ''.obs;
  RxString id = ''.obs;
  int? cashAmount;
  String url='https://drbayad-backend-ece2qdboea-uc.a.run.app/api';

  RxList<LogEntry> logs = <LogEntry>[].obs;

  Future<void> fetchLog(var page) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var token = prefs.getString('token') ?? '';

      var response = await http.get(
        Uri.parse(url + '/log/get/normal?page=$page'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
        },
      );
      if (response.statusCode == 200) {
        // Parse the response JSON
        var jsonData = json.decode(response.body);
        print('\n');
        print('\n');
        print('\n');
        print('\n');
        print('\n');

        print(jsonData);

        print('\n');
        print('\n');
        print('\n');
        print('\n');
        print('\n');

        // Clear the existing categories list
        logs.clear();

        // Add new categories to the list

        jsonData.forEach((category) {
          LogEntry brand = LogEntry.fromJson(category);
          logs.add(brand);
        });
      } else {
        // Handle error if the API request fails
        print('API request failed with status code: ${response.statusCode}');
      }
    } catch (e) {
      // Handle exceptions that occur during the API request
      print('Error occurred during API request: $e');
    }
  }


}
