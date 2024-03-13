import 'dart:convert';

import 'package:get/get.dart';

import '../model/customermodel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class UserAddController extends GetxController {
  var isLoading = false.obs;
  int? res;
  RxString message = ''.obs;
  RxString error = ''.obs;
  RxString id = ''.obs;
  String url='https://drbayad-backend-ece2qdboea-uc.a.run.app/api';

  Future<void> addEqupment(
      String userName,
      int userphone,
      String password,
      ) async {
    isLoading.value = true;

    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var token = prefs.getString('token') ?? '';

      var response = await http.post(
        Uri.parse(url+'/equipment/add'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(

          <String, dynamic>{
            "equipment_name": userName,
             "price": userphone,
             "quantity":password,

          },
        ),
      );

      res = response.statusCode;
      // Handle the response based on your API's requirements
      if (response.statusCode == 200) {
        // Successful login
        print('Response: ${response.body}');
        // ItemUser.clear();
        // fetchDatadoctors(1);
        message.value = 'Equipment will be added successfully';
        var responseBody = jsonDecode(response.body);
        // Save token and role to local storage
      } else {
        var responseBody = jsonDecode(response.body);


      }
    } catch (e) {
      error.value = 'An error occurred: $e'; // Assign value using .value
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> deletEquip(
      var id) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var token = prefs.getString('token') ?? '';

      var response = await http.delete(
          Uri.parse(url+'/equipment/delete/$id'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': 'Bearer $token',
          },
          body: jsonEncode(
              <String, String>{

              }
          ) );
      if (response.statusCode == 200) {
        print(response.body);
        var responseBody = jsonDecode(response.body);
        message.value = responseBody['message'];

        allCustomer.clear();
        fetchData(1);
        // Handle the success response
        print('Customer updated successfully');
      } else {
        print('state: ${response.statusCode}');
        res = response.statusCode;
        // Handle the response based on your API's requirements
        if (response.statusCode == 200) {
          // Successful login
          // print('Response: ${response.body}');

          var responseBody = jsonDecode(response.body);
          message.value = responseBody['message'];
          // Save token and role to local storage
        } else {
          var responseBody = jsonDecode(response.body);


        }
        // Handle error if the API request fails
        print('API request failed with status code: ${response.statusCode}');
      }
    } catch (e) {
      // Handle exceptions that occur during the API request
      print('Error occurred during API request: $e');
    }
  }

  Future<void> updateDatadoc(
      int permission, var id) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var token = prefs.getString('token') ?? '';

      var response = await http.put(
        Uri.parse(url+'/equipment/update/$id'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
        },
        body:  jsonEncode(

          <String, dynamic>{

            "quantity":  permission,

          },
        ),);
      if (response.statusCode == 200) {
        print(response.body);
        var responseBody = jsonDecode(response.body);
        message.value = responseBody['message'];

        allCustomer.clear();
        fetchData(1);
        // Handle the success response
        print('Customer updated successfully');
      } else {
        print('state: ${response.statusCode}');
        res = response.statusCode;
        // Handle the response based on your API's requirements
        if (response.statusCode == 200) {
          // Successful login
          // print('Response: ${response.body}');

          var responseBody = jsonDecode(response.body);
          message.value = responseBody['message'];
          // Save token and role to local storage
        } else {
          var responseBody = jsonDecode(response.body);


        }
        // Handle error if the API request fails
        print('API request failed with status code: ${response.statusCode}');
      }
    } catch (e) {
      // Handle exceptions that occur during the API request
      print('Error occurred during API request: $e');
    }
  }









  RxList<Customer> allCustomer = <Customer>[].obs;

  Future<void> fetchData(var page) async {

    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var token = prefs.getString('token') ?? '';

      var response = await http.get(
        Uri.parse(url+'/equipment/get/all?page=$page'),
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

         allCustomer.clear();

        // Add new categories to the list

        jsonData.forEach((category) {
          Customer brand = Customer.fromJson(category);
          allCustomer.add(brand);
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

  RxList<AllGrop> allgroups = <AllGrop>[].obs;

  Future<void> fetchDataEquipAllName() async {

    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var token = prefs.getString('token') ?? '';

      var response = await http.get(
        Uri.parse(url+'/equipment/get/names'),
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

        allgroups.clear();

        // Add new categories to the list

        jsonData.forEach((category) {
          AllGrop brand = AllGrop.fromJson(category);
          allgroups.add(brand);
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
