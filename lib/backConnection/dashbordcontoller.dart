import 'dart:io';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';
import 'dart:async';
import 'package:clinicmangment/model/dashbordmodl.dart';
import '../model/dailyreport.dart';
import '../model/usermode.dart';



class dashboardController extends GetxController {
  var isLoading = false.obs;
  int? res;
  RxString message = ''.obs;
  RxString error = ''.obs;
  RxString id = ''.obs;

  String url='https://drbayad-backend-ece2qdboea-uc.a.run.app/api';






  ///report all
  Future<void> ReportAll(
      DateTime? start_date,
      DateTime? end_date,
      var duration,
      ) async {
    isLoading.value = true;

    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var token = prefs.getString('token') ?? '';
      print(duration);
      var u2;
      duration == 'Custom'? u2='/report/get/all?start_date=${start_date}&end_date=${end_date}': u2='/report/get/all?duration=${duration}';
      var response = await http.get(
        Uri.parse(
          url+u2,
        ),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
        },
      );

      print('state: ${response.statusCode}');

      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body);

        print(jsonData);
        if (jsonData is List) {
          // jsonData is a list, iterate over it
          reportss.clear();
          jsonData.forEach((category) {
            report oneCustomer = report.fromJson(category);
            reportss.add(oneCustomer);
          });
        } else if (jsonData is Map<String, dynamic>) {
          // jsonData is a map, process it as a single object
          report oneCustomer = report.fromJson(jsonData);
          reportss.add(oneCustomer);
        } else {
          print('API response does not contain valid data.');
        }
      } else {
        print('API request failed with status code: ${response.statusCode}');
      }


    } catch (e) {
      error.value = 'An error occurred: $e'; // Assign value using .value
    } finally {
      isLoading.value = false;
    }
  }

  /// by user
  Future<void> ReportDoctor(DateTime? start_date, DateTime? end_date,
      var duration, var idUser) async {
    isLoading.value = true;

    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var token = prefs.getString('token') ?? '';

      var u2;
      duration!='Custom'? u2='/report/get/doctor/${idUser}?duration=${duration}': u2='/report/get/doctor/${idUser}?start_date=${start_date}&end_date=${end_date}';
      var response = await http.get(
        Uri.parse(
          url+u2,
        ),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
        },

      );

      print('state: ${response.statusCode}');

      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body);

        print(jsonData);
        if (jsonData is List) {
          // jsonData is a list, iterate over it
          reportss.clear();
          jsonData.forEach((category) {
            report oneCustomer = report.fromJson(category);
            reportss.add(oneCustomer);
          });
        } else if (jsonData is Map<String, dynamic>) {
          // jsonData is a map, process it as a single object
          report oneCustomer = report.fromJson(jsonData);
          reportss.add(oneCustomer);
        } else {
          print('API response does not contain valid data.');
        }
      } else {
        print('API request failed with status code: ${response.statusCode}');
      }
    } catch (e) {
      error.value = 'An error occurred: $e'; // Assign value using .value
    } finally {
      isLoading.value = false;
    }
  }


  RxList<Orderq> itemCustomersOne = <Orderq>[].obs;
  RxList<MenuItemQuantity> allProducts = <MenuItemQuantity>[].obs;
  RxList<ordergetss> ordersgetss = <ordergetss>[].obs;
  RxList<OrderGet> popday = <OrderGet>[].obs;
  RxList<ern> total = <ern>[].obs;
  RxList<purchase> purchases = <purchase>[].obs;
  RxList<MenuItem> allCustomer = <MenuItem>[].obs;

  RxList<report> reportss = <report>[].obs;

  RxList<Patient> pot = <Patient>[].obs;
  RxList<Treatments> tre = <Treatments>[].obs;

  RxList<Quest> quest = <Quest>[].obs;
  RxList<Prescriptiona> prescpection = <Prescriptiona>[].obs;

  RxList<Oneprescpection> oneprescpectio = <Oneprescpection>[].obs;

  RxList<oneEqupment> oneEqupmentw = <oneEqupment>[].obs;

  RxList<oneEqupmentpp> oneEqupmentw2 = <oneEqupmentpp>[].obs;

  RxList<Images> img = <Images>[].obs;
   RxList<Doctor> ItemDoctors = <Doctor>[].obs;
  Future<void> fetchDoctor() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var token = prefs.getString('token') ?? '';
      var response = await http.get(
        Uri.parse(url+'/user/get/all'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
        },
      );
      if (response.statusCode == 200) {
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

        img.clear();

        jsonData.forEach((category) {
          Images oneCustomer = Images.fromJson(category);
          img.add(oneCustomer);
        });


      } else {
        print('API request failed with status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error occurred during API request: $e');
    }
  }




  Future<void> addTreatment(
      String doctor_id, String patient_id, String case_id, int total_amount, String? note,
      List tooth_id, String? tooth_note ) async {
    isLoading.value = true;
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var token = prefs.getString('token') ?? '';


      Map<String, dynamic> requestBody = {
        'doctor_id': doctor_id,
        'patient_id': patient_id,
        'case_id': case_id,
        'total_amount': total_amount,
        'tooth_id':tooth_id

      };


      if (note != null && note.isNotEmpty) {
        requestBody['note'] = note;
      }

      if (tooth_note != null && tooth_note.isNotEmpty) {
        requestBody['tooth_note'] = tooth_note;
      }


      var headers = {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      };

      var response = await http.post(
        Uri.parse(url + '/treatment/add'),
        headers: headers,
        body: jsonEncode(requestBody),
      );

      res = response.statusCode;

      if (response.statusCode == 200) {
        print('Response: ${response.body}');
        message.value = 'Patient will be added successfully';
      } else {
        message.value= 'OoopSss Something is wrong';
        print('Response: ${response.statusCode}');
        print('Response: ${response.body}');

      }
    } catch (e) {
      error.value = 'An error occurred: $e';
      print('error: ${e}');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> fetchTreatment(var id) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var token = prefs.getString('token') ?? '';
      var response = await http.get(
        Uri.parse(url+'/treatment/get/one/${id}'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
        },
      );
      if (response.statusCode == 200) {
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


        tre.clear();
        if (jsonData is Map<String, dynamic>) {
          Treatments oneCustomer = Treatments.fromJson(jsonData);
          tre.add(oneCustomer);
        } else if (jsonData is List) {
          jsonData.forEach((category) {
            if (category is Map<String, dynamic>) {
              Treatments oneCustomer = Treatments.fromJson(category);
              tre.add(oneCustomer);
            }
          });
        }



      } else {
        print('API request failed with status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error occurred during API request: $e');
    }
  }

  Future<void> fetchImage(var id) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var token = prefs.getString('token') ?? '';
      var response = await http.get(
        Uri.parse(url+'/treatment/get/images/${id}'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
        },
      );
      if (response.statusCode == 200) {
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

        img.clear();

        jsonData.forEach((category) {
          Images oneCustomer = Images.fromJson(category);
          img.add(oneCustomer);
        });


      } else {
        print('API request failed with status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error occurred during API request: $e');
    }
  }

  Future<void> addImages(
      String treatment_id,
       List<File> images,
       ) async {
    isLoading.value = true;

    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var token = prefs.getString('token') ?? '';

      var request = await http.MultipartRequest(
          'POST', Uri.parse(url+'/treatment/add/image'));

      Map<String, String> header = {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      };
      request.headers.addAll(header);

      request.fields['treatment_id'] = treatment_id;

      for (var image in images) {
        request.files.add(http.MultipartFile.fromBytes(
            'images', await image.readAsBytes(),
            filename: image.path));
      }


      // request.files.add(http.MultipartFile.fromBytes(
      //     'image', File(image.path).readAsBytesSync(),
      //     filename: image.path));

      var response = await request.send();
      print('state: ${response}');
      print('state: ${response.statusCode}');
      if (response.statusCode == 200) {
        message.value = 'Image Successfully Added'; // Use '=' instead of '==' for assignment
      } else {
        message.value = 'Something is Wrong';
      }

      print(response.statusCode);
      res = response.statusCode;
      // Handle the response based on your API's requirements
    } catch (e) {
      error.value = 'An error occurred: $e';
      print(e);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> cancleApointment(var id) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var token = prefs.getString('token') ?? '';

      var response = await http.put(
        Uri.parse(url+'/appointment/cancel/$id'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
        },
        body:  jsonEncode(
          <String, String>{

          }
        ),);
      if (response.statusCode == 200) {
        print(response.body);
        var responseBody = jsonDecode(response.body);
        message.value = responseBody['message'];


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

   Future<void> fetchappointment(var month,var year) async {

    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var token = prefs.getString('token') ?? '';
       var response = await http.get(
        Uri.parse(url+'/appointment/get/all/by_month?month=${month}&year=${year}'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
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

        itemCustomersOne.clear();

        jsonData.forEach((category) {
          Orderq oneCustomer = Orderq.fromJson(category);
          itemCustomersOne.add(oneCustomer);
        });

      } else {
        print('API request failed with status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error occurred during API request: $e');
    }
  }

}