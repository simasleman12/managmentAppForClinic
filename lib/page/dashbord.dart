import 'dart:io';
import 'dart:ui';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../backConnection/authLogin.dart';
import '../backConnection/authuser.dart';
import '../backConnection/cashrigester.dart';
import '../backConnection/dashbordcontoller.dart';
import '../controler/color.dart';
import '../model/prescription.dart';
import 'dart:async';
 class Dashbord extends StatefulWidget {
  @override
  stufea createState() => stufea();
}
class stufea extends State<Dashbord> {
  final homeController = Get.put(homeControler());
  final _formKey = GlobalKey<FormState>();
  var scaffoldKey = GlobalKey<ScaffoldState>();
  final DashboarController = Get.put(dashboardController());
  final DashboarController3 = Get.put(LoginController());
  String? selectedValue2;
  String? selectedValue3;
  String? selectedValue33;
  String? selectedValue4;
  String? selectedValue5;
   int number = 0;
  var colorchanage;
  bool listshow=true;
  bool addpatent=true;
  bool patientInformation=true;
  bool detailpatent=true;
  bool detailpatentandcase=true;
  bool adddetailpatentandcase=true;
  bool newcase=true;
  bool editcase=true;
  int? selectteeth;
  List<File> files = [];
  Future<List<File>> getImages() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: true,
    );

    if (result != null) {
      files = result.paths.map((path) => File(path!)).toList();
      return files;
    } else {
      return [];
    }
  }
  List itemsBrands = [
    1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,38,39,40
  ];

  List<_SalesData> data = [
    _SalesData('Jan', 1),
    _SalesData('Feb', 2),
    _SalesData('Mar', 3),
    _SalesData('Apr', 4),
    _SalesData('May', 5),
    _SalesData('jun', 6),
    _SalesData('july', 7),
    _SalesData('Aug', 8),
    _SalesData('sep', 9),
    _SalesData('oct', 10),
    _SalesData('Nov', 11),
    _SalesData('Des', 12)
  ];
  List<_SalesData> weekdaily = [
    _SalesData('Saturday', 1),
    _SalesData('Sunday', 2),
    _SalesData('Monday', 3),
    _SalesData('Tuesday', 4),
    _SalesData('Wednesday', 5),
    _SalesData('Thursday', 6),
    _SalesData('Saturday', 7),
    _SalesData('Sunday', 8),
    _SalesData('Monday', 9),
    _SalesData('Tuesday', 10),
    _SalesData('Wednesday', 11),
    _SalesData('Thursday', 12),
    _SalesData('Saturday', 13),
    _SalesData('Sunday', 14),
    _SalesData('Monday', 15),
    _SalesData('Tuesday', 16),
    _SalesData('Wednesday', 17),
    _SalesData('Thursday', 18),
    _SalesData('Saturday', 19),
    _SalesData('Sunday', 20),
    _SalesData('Monday', 21),
    _SalesData('Tuesday', 22),
    _SalesData('Wednesday', 23),
    _SalesData('Thursday', 24),
    _SalesData('Wednesday', 25),
    _SalesData('Thursday', 26),
    _SalesData('Saturday', 27),
    _SalesData('Sunday', 28),
    _SalesData('Monday', 29),
    _SalesData('Tuesday', 30),
    _SalesData('Wednesday', 31),
   ];
  int currentMonthIndex =0; //
  void decrementMonth() {
    setState(() {
      if (currentMonthIndex > 0) {
        currentMonthIndex--;
      }
    });
  }
  void incrementMonth() {
    setState(() {
      if (currentMonthIndex < data.length - 1) {
        currentMonthIndex++;
      }
    });
  }
  TextEditingController dateinputs = TextEditingController();
  DateTime? dateinput;
  showAlertDialogEdit(context) {
    showDialog(
      context: context,
      builder: (context) {

        final List<String> items = [
          'New patient',
          'Exist patient ',
        ];
        String? selectedValue= items.first;

        return   StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return   AlertDialog(
                scrollable: true,
                shadowColor: homeController.brown.value,
                backgroundColor: homeController.white.value,
                content: Stack(children: [
                  // Background blur effect
                  BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
                    child: Container(
                      color:
                      Colors.white.withOpacity(0), // Adjust the opacity as needed
                    ),
                  ),
                  Container(
                    width: 900,
                    height: 430,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              'Add an appointment',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: homeController.black.value),
                            ),
                            InkWell(
                              child: Image.asset('assets/close.png'),
                              onTap: () {
                                Navigator.of(context).pop(); // Close the dialog
                              },
                            )
                          ],
                        ),
                        Obx(() =>  Text(
                          DashboarController.message.value,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: homeController.green.value),
                        ),),

                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 130,
                                height: 45,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: homeController.backgrawnd.value,
                                    border: Border.all(
                                        width: 1,
                                        color:
                                        homeController.backgrawnd2.value)),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    isExpanded: true,
                                    hint: Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            selectedValue.toString(),
                                            style: TextStyle(
                                              color: homeController
                                                  .grayborder.value,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                              fontFamily: 'roboto',
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 4,
                                        ),
                                        SvgPicture.asset(
                                          'assets/down2.svg',
                                          width: 7,
                                          height: 7,
                                        ),
                                      ],
                                    ),
                                    items: items
                                        .map(
                                          (item) => DropdownMenuItem<String>(
                                        value: item,
                                        child: Container(
                                          child: Column(
                                            children: [
                                              Text(
                                                item,
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400,
                                                  color: homeController.grayborder.value,
                                                ),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    )
                                        .toList(),
                                    value: selectedValue,
                                    onChanged: (value) {
                                      setState(() {
                                        selectedValue = value; // Make sure selectedValue is being updated here.
                                      });
                                      print("Selected value: $value"); // Add a print statement to check if onChanged is called.
                                    },

                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: homeController.grayborder.value,
                                    ),
                                    icon: Icon(
                                      Icons.arrow_forward_ios_outlined,
                                    ),
                                    iconSize: 0,
                                    dropdownColor: homeController.white.value,
                                    elevation: 8,
                                    underline: Container(),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 2,
                              ),
                               Container(
                                  width: 130,
                                  height: 45,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 0),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: homeController.backgrawnd.value,
                                      border: Border.all(
                                          width: 1,
                                          color:
                                          homeController.backgrawnd2.value)),
                                  child: TextFormField(
                                    controller: catagoryName,
                                    onChanged: (text) {
                                      catagoryNames = text;
                                    },
                                    keyboardType: TextInputType.text,
                                    validator: (value) {
                                      if (value == '') {
                                        return 'Enter your  name';
                                      } else {
                                        return null;
                                      }
                                    },
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintText:
                                        'Patient name',
                                        hintStyle: TextStyle(fontSize: 12),
                                        enabledBorder: InputBorder.none,
                                        focusedBorder: InputBorder.none),
                                  )) ,
                             ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),

                        Container(
                          width: 440,
                          height: 45,
                          padding: EdgeInsets.symmetric(
                              horizontal: 1, vertical: 1),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: homeController.backgrawnd.value,
                              border: Border.all(
                                  width: 1,
                                  color:
                                  homeController.backgrawnd2.value)),
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: homeController.backgrawnd.value,
                                  border: Border.all(
                                    width: 1,
                                    color: homeController
                                        .backgrawnd2.value,
                                  ),
                                ),
                                width:  120,
                                height: 50,
                                child: TextFormField(
                                    validator: (value) {
                                      if (value?.isEmpty == true) {
                                      } else {
                                        return null;
                                      }
                                    },
                                    controller: dateinputs,
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.date_range,
                                        size: 20,
                                      ),

                                      hintText:
                                      dateinput==null? AppLocalizations.of(context)!
                                          .date:dateinput.toString(),
                                      hintStyle: TextStyle(fontSize: 12),
                                      enabledBorder: InputBorder.none,
                                    ),
                                    readOnly: true,
                                    onTap: () async {
                                      DateTime? pickedDate =
                                      await showDatePicker(
                                        builder: (context, child) {
                                          return Theme(
                                            data:
                                            Theme.of(context).copyWith(
                                              colorScheme:
                                              ColorScheme.light(
                                                primary: homeController
                                                    .grayborder.value,
                                                onPrimary: homeController
                                                    .bluebackground.value,
                                                onSurface: homeController
                                                    .black.value,
                                              ),
                                              textTheme: TextTheme(
                                                subtitle1: TextStyle(
                                                  color: homeController
                                                      .bluebackground.value,
                                                ),
                                              ),
                                            ),
                                            child: child!,
                                          );
                                        },
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(2000),
                                        lastDate: DateTime(2101),
                                      );

                                      if (pickedDate != null) {
                                        print(pickedDate);
                                        String formattedDate = DateFormat('MM/dd/yyyy').format(pickedDate);

                                        try {
                                          DateTime parsedDate = DateFormat('MM/dd/yyyy').parse(formattedDate);
                                          setState(() {
                                            dateinput = parsedDate;
                                          });
                                        } catch (e) {
                                          print("Error parsing date: $e");
                                        }
                                      } else {
                                        print("Date is not selected");
                                      }
                                    }

                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                                width: 120,
                                height: 45,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 0),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: homeController.backgrawnd.value,
                                    border: Border.all(
                                        width: 1,
                                        color:
                                        homeController.backgrawnd2.value)),
                                child: TextFormField(
                                  controller: _price,
                                  onChanged: (text) {
                                    prices = text;
                                  },
                                  keyboardType: TextInputType.text,
                                  validator: (value) {
                                    if (value == '') {
                                      return 'Enter your  name';
                                    } else {
                                      return null;
                                    }
                                  },
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText:
                                      'From hour',
                                      hintStyle: TextStyle(fontSize: 12),
                                      enabledBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none),
                                )),
                            Container(
                                width: 110,
                                height: 45,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 0),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: homeController.backgrawnd.value,
                                    border: Border.all(
                                        width: 1,
                                        color:
                                        homeController.backgrawnd2.value)),
                                child: TextFormField(
                                  controller: _userName,
                                  onChanged: (text) {
                                    userName = text;
                                  },
                                  keyboardType: TextInputType.text,
                                  validator: (value) {
                                    if (value == '') {
                                      return 'Enter your  name';
                                    } else {
                                      return null;
                                    }
                                  },
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText:
                                      'to hour',
                                      hintStyle: TextStyle(fontSize: 12),
                                      enabledBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none),
                                ))
                          ],),

                        SizedBox(
                          height: 20,
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [

                            Row(
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  child: InkWell(
                                      onTap: () async {
                                        setState(() {
                                          DashboarController.message.value='';
                                          Navigator.pop(context);

                                        });
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        width: 100,
                                        height: 40,
                                        margin: EdgeInsets.symmetric(vertical: 10),
                                        decoration: BoxDecoration(
                                          color: homeController.white.value,
                                          borderRadius: BorderRadius.circular(8),
                                          border: Border.all(
                                              width: 1,
                                              color:
                                              homeController.bluebackground.value),
                                          boxShadow: [
                                            BoxShadow(
                                              color: homeController.white.value,
                                              offset: Offset(0.5, 0.5),
                                              blurRadius: 4,
                                            )
                                          ],
                                        ),
                                        child: Text(
                                          'cancle',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: homeController.bluebackground.value,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            letterSpacing: 0.15,
                                            fontFamily: 'roboto',
                                          ),
                                        ),
                                      )),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  child: InkWell(
                                      onTap: () async {
                                        print('pesh add apointment');
                                        // await     DashboarController.addApointment(int.parse(selectedValue2!), selectedValue33,catagoryNames,int.parse(selectedValue4!),dateinput!,prices!,userName!);
                                        setState(() {
                                          _userName.clear();
                                          catagoryName.clear();
                                          prices='';
                                           catagoryNames='';
                                          DashboarController.fetchappointment(data[currentMonthIndex].value!,selectedValueyear!);
                                          _price.clear();
                                          DashboarController.message.value='';
                                          _password.clear();
                                          Note.clear();
                                        });
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        width: 100,
                                        height: 40,
                                        margin: EdgeInsets.symmetric(vertical: 10),
                                        decoration: BoxDecoration(
                                          color: homeController.bluebackground.value,
                                          borderRadius: BorderRadius.circular(8),
                                          border: Border.all(
                                              width: 1,
                                              color: homeController.bluebackground.value),
                                        ),
                                        child: Text(
                                          'Add',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: homeController.white.value,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            letterSpacing: 0.15,
                                            fontFamily: 'roboto',
                                          ),
                                        ),
                                      )),
                                )
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ]),
              );
            });
      },
    );
  }
  showAlertDialogstate(context) {
    showDialog(
      context: context,
      builder: (context) {

        final List<String> items = [
          'Waiting',
          'Working',
          'Canceled',
          'Done',
        ];
        String? selectedValue= items.first;

        return   StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return   AlertDialog(
                scrollable: true,
                shadowColor: homeController.brown.value,
                backgroundColor: homeController.white.value,
                content: Stack(children: [
                  // Background blur effect
                  BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
                    child: Container(
                      color:
                      Colors.white.withOpacity(0), // Adjust the opacity as needed
                    ),
                  ),
                  Container(
                    width: 510,
                    height: 230,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 2,
                            ),
                            Text(
                              'Change State Of an appointment',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: homeController.black.value),
                            ),
                            InkWell(
                              child: Image.asset('assets/close.png'),
                              onTap: () {
                                DashboarController.message.value='';
                                Navigator.of(context).pop(); // Close the dialog
                              },
                            )
                          ],
                        ),
                        Obx(() =>  Text(
                          DashboarController.message.value,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: homeController.green.value),
                        ),),

                        SizedBox(
                          height: 2,
                        ),
                        Container(
                          width: 410,
                          height: 45,
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: homeController.backgrawnd.value,
                              border: Border.all(
                                  width: 1,
                                  color:
                                  homeController.backgrawnd2.value)),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              isExpanded: true,
                              hint: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      selectedValue.toString(),
                                      style: TextStyle(
                                        color: homeController
                                            .grayborder.value,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'roboto',
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  SvgPicture.asset(
                                    'assets/down2.svg',
                                    width: 7,
                                    height: 7,
                                  ),
                                ],
                              ),
                              items: items
                                  .map(
                                    (item) => DropdownMenuItem<String>(
                                  value: item,
                                  child: Container(
                                    child: Column(
                                      children: [
                                        Text(
                                          item,
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                            color: homeController.grayborder.value,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                                  .toList(),
                              value: selectedValue,
                              onChanged: (value) {
                                setState(() {
                                  selectedValue = value; // Make sure selectedValue is being updated here.
                                });
                                print("Selected value: $value"); // Add a print statement to check if onChanged is called.
                              },

                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: homeController.grayborder.value,
                              ),
                              icon: Icon(
                                Icons.arrow_forward_ios_outlined,
                              ),
                              iconSize: 0,
                              dropdownColor: homeController.white.value,
                              elevation: 8,
                              underline: Container(),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [

                            Row(
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  child: InkWell(
                                      onTap: () async {
                                        setState(() {
                                          DashboarController.message.value='';
                                          Navigator.pop(context);

                                        });
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        width: 100,
                                        height: 40,
                                        margin: EdgeInsets.symmetric(vertical: 10),
                                        decoration: BoxDecoration(
                                          color: homeController.white.value,
                                          borderRadius: BorderRadius.circular(8),
                                          border: Border.all(
                                              width: 1,
                                              color:
                                              homeController.bluebackground.value),
                                          boxShadow: [
                                            BoxShadow(
                                              color: homeController.white.value,
                                              offset: Offset(0.5, 0.5),
                                              blurRadius: 4,
                                            )
                                          ],
                                        ),
                                        child: Text(
                                          'cancle',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: homeController.bluebackground.value,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            letterSpacing: 0.15,
                                            fontFamily: 'roboto',
                                          ),
                                        ),
                                      )),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  child: InkWell(
                                      onTap: () async {
                                        print('pesh add apointment');
                                        // await     DashboarController.statechangeApointment(selectedValue!,id!);
                                        setState(() {
                                          _userName.clear();
                                          catagoryName.clear();
                                          prices='';
                                          catagoryNames='';
                                          DashboarController.fetchappointment(data[currentMonthIndex].value!,selectedValueyear!);
                                          _price.clear();

                                          _password.clear();
                                          Note.clear();
                                        });
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        width: 100,
                                        height: 40,
                                        margin: EdgeInsets.symmetric(vertical: 10),
                                        decoration: BoxDecoration(
                                          color: homeController.bluebackground.value,
                                          borderRadius: BorderRadius.circular(8),
                                          border: Border.all(
                                              width: 1,
                                              color: homeController.bluebackground.value),
                                        ),
                                        child: Text(
                                          'Add',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: homeController.white.value,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            letterSpacing: 0.15,
                                            fontFamily: 'roboto',
                                          ),
                                        ),
                                      )),
                                )
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ]),
              );
            });
      },
    );
  }
   List<Widget> rowList = [];
  List <Prescription> values = [];
  List <equipet> values2 = [];

  List<int> selectedIndices = [];
  String? selectedValueyear;
  List<Widget> eqquolist = [];
  int index = 0;
  void remove(int index )
  {
    setState((){
      values.removeAt(index);
    });
  }
  String? selectedValuew;
   showAlertDialogNotifi(context) {
    showDialog(
      context: context,
      builder: (context) {

        return   StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return   AlertDialog(
                scrollable: true,
                shadowColor: homeController.brown.value,
                backgroundColor: homeController.white.value,
                content: Stack(children: [
                  // Background blur effect
                  BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
                    child: Container(
                      color:
                      Colors.white.withOpacity(0), // Adjust the opacity as needed
                    ),
                  ),
                  Container(
                    width: 500,
                    height: 400,
                    child: Column(
                      children: [
                        Container(decoration: BoxDecoration(color:homeController.bluebackground.value,),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: 20,
                              ),
                              Image.asset('assets/clinic.png'),
                              Container(child: Column(children:[
                                // Text(
                                //   _loginController.Itemenoy![0].doctorName!.toString()  + ' clinic',
                                //   style: TextStyle(
                                //       fontWeight: FontWeight.bold,
                                //       fontSize: 20,
                                //       color: homeController.white.value),
                                // ),
                                SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  width:250,
                                  child:Text(
                                    'Comprehensive Care for Optimal Oral Health –'
                                        ' From Preventive Services to Restorative Treatments, Cosmetic Enhancements',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 10,
                                        color: homeController.white.value),
                                  ),)
                              ]), margin: EdgeInsets.only(top: 8), ),
                              SizedBox(
                                width: 5,
                              ),

                            ],
                          ),
                          width: 497,
                          height: 110,
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width * 1.2/6
                                    ,
                                    child:  Row(
                                        mainAxisAlignment: MainAxisAlignment.start,

                                        children:[
                                          Text('Patient name:',style: TextStyle(color: homeController.graybuton.value,fontSize: 14),),
                                          SizedBox(
                                            width: MediaQuery.of(context).size.width* 0.05/6,
                                          ),
                                          // Container(
                                          //     child: Text(  _loginController.Itemenoy![0].patientName!.toString(),style: TextStyle(color: homeController.bluebackground.value,fontSize: 12),),
                                          //     width:MediaQuery.of(context).size.width* 0.7/6
                                          // ),
                                        ]),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width * 1.2/6
                                    ,
                                    child:  Row(
                                        mainAxisAlignment: MainAxisAlignment.start,

                                        children:[
                                          Text('doctor name:',style: TextStyle(color: homeController.graybuton.value,fontSize: 14),),
                                          SizedBox(
                                            width: MediaQuery.of(context).size.width* 0.05/6,
                                          ),
                                          // Container(
                                          //     child: Text(_loginController.Itemenoy![0].doctorName!.toString(),style: TextStyle(color: homeController.bluebackground.value,fontSize: 12),),
                                          //     width:MediaQuery.of(context).size.width* 0.7/6
                                          // ),
                                        ]),),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      InkWell(
                                        onTap:()async{
                                          // await     DashboarController.statechangeApointment('Working', _loginController.Itemenoy![0].appointmentId!);
                                          setState(() {
                                            _userName.clear();
                                            catagoryName.clear();
                                            prices='';
                                            catagoryNames='';
                                            DashboarController.fetchappointment(data[currentMonthIndex].value!,selectedValueyear!);
                                            // _loginController.fetchNotifi();
                                            _price.clear();
                                                         Navigator.pop(context);
                                            _password.clear();
                                            Note.clear();
                                          });
                                        },
                                        child:Container(
              alignment: Alignment.center,
              width: 100,
              height: 40,
              margin: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
              color: homeController.bluebackground.value,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
              width: 1,
              color: homeController.bluebackground.value),),
              child:Text('OK', style:TextStyle(fontSize:18, color: homeController.white.value),
              ),



              )
                                      )
                                    ],
                                  )


                                ]),

                          ],),
                        SizedBox(
                          height: 20,
                        ),
                        Divider(height: 1,color:homeController.grayborder.value),
                        SizedBox(
                          height: 6,
                        ),

                      ],
                    ),
                  ),
                ]),
              );
            });
      },
    );
  }
   bool _checkboxValue1 = false;
  final controller = PageController(viewportFraction: 0.8, keepPage: true);
  final cashControler _cash = Get.put(cashControler());
  bool _checkboxValue2 = false;
  bool _checkboxValue3 = false;

  final TextEditingController Note = TextEditingController();
  String Notes = "";
   String? userName;
  String? prices;
  final TextEditingController _price = TextEditingController();
  String? password;
  final TextEditingController _password = TextEditingController();
  final TextEditingController _userName = TextEditingController();
  final _formKey2 = GlobalKey<FormState>();
  PageController pageController = PageController(initialPage: 0);
  int selectedPageIndex = 0;
  int selectedPageIndex2 = 0;
  final TextEditingController catagoryName = TextEditingController();
  final TextEditingController _catagoryNames = TextEditingController();
  final TextEditingController _patentname = TextEditingController();
  final TextEditingController _phonenumber = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _addresone = TextEditingController();
  final TextEditingController _addrestwo = TextEditingController();
  final TextEditingController _country = TextEditingController();
  final TextEditingController _gender = TextEditingController();
  final TextEditingController _medicalhistory = TextEditingController();
  final TextEditingController _medicationsensitive = TextEditingController();
  final TextEditingController _habits = TextEditingController();
  String catagoryNames = "";
  String patentname = "";
  String phonenumber = "";
  String email = "";
  String addresone = "";
  String addrestwo = "";
  String country = "";
  String? gender ;
  String medicalhistory = "";
  String medicationsensitive = "";
  String habits = "";
  String? idpation;
  String? searchs;


  DateTime now = DateTime.now();
  @override
  var id;
   List<bool> checkboxValues = []; // List to store checkbox state
  @override
  void initState() {
     listshow=true;
    addpatent=true;
    super.initState();
     for (int i = 0; i < 5; i++) {
      checkboxValues.add(false);
    }
      DashboarController.fetchappointment(now.month,now.year).then((value)  {
       setState(() {
          currentMonthIndex = now.month - 1;
          selectedValueyear = now.year.toString();
        });});

     // DashboarController.fetchcase(1);

     // DashboarController.fetchcasepagination();
    //  _loginController.fetchDataAllEqupmeentName();
    // _loginController.fetchData(1);
  }

  List itemsBrands2 = [
    2022,2023,2024,2025,2026,2027,2028,2029,2030,2031,2032,2033,2034,2035,2036,2037,2038,2039,2040,2041,2042,2043,2044,2045,2046,2047,2048,2049,2050
  ];
  var backgroundColor;
  @override
  Widget build(BuildContext context) {
    final List<String> items2 = [
      'Male',
      'Female',
    ];
    final List<String> items = [
      'case ',
      'Exist patient ',
    ];
    String? selectedValue= items.first;

    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: SafeArea(
        child: DefaultTabController(
            length: 4,
            child: Container(
              color: homeController.backgrawnd.value,
              child: Form(
                key: _formKey,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 1, vertical: 0),
                  child:  SingleChildScrollView(
                    child:Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        (addpatent==true && patientInformation==true && detailpatent==true &&  detailpatentandcase==true && adddetailpatentandcase==true) ? Container(
                            height: MediaQuery.of(context).size.height * 0.6 / 6,
                            width: MediaQuery.of(context).size.width,

                            decoration: BoxDecoration(
                              color: homeController.bluebackground.value,
                              borderRadius: BorderRadius.vertical(bottom: Radius.circular(10.0)),
                            ),
                            child:
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [


                                DashboarController3.role.value!='Doctor'?  Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [

                                    InkWell(onTap: () async{
                                      selectedValue3 = '';
                                      print('ama ya');
                                      print(selectedValue3);
                                      setState(() {
                                        selectedValue3 = '';
                                      });
                                      await         showAlertDialogEdit(context);

                                    },

                                      child:
                                      Image.asset('assets/plus.png',width: 50,height: 40,),
                                    ) ,SizedBox(  width: MediaQuery.of(context).size.width *
                                        0.01/
                                        6,),

                                  ],):Container(),


                              ],)

                        ):Container(),
                        (addpatent==true && patientInformation==true && detailpatent==true &&  detailpatentandcase==true  && adddetailpatentandcase==true) ?
                        SizedBox(  height: MediaQuery.of(context).size.height *
                            0.2/
                            6,):Container(),

                        Column(children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children:[

                                Container(
                                  width: MediaQuery.of(context).size.width *
                                      1.5 /
                                      6,
                                  height: MediaQuery.of(context).size.height *
                                      0.7/
                                      20,
                                  padding: EdgeInsets.symmetric(horizontal: 3),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1,
                                        color: homeController.bluebackground.value),
                                    color: homeController.white.value,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton2<String>(
                                      isExpanded: true,
                                      hint: Row(
                                        children: [
                                          SizedBox(
                                            width: 4,
                                          ),
                                          Expanded(
                                            child: Text(selectedValueyear!= null?
                                            selectedValueyear.toString(): '2023',
                                              style: TextStyle(
                                                fontSize: 12,
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ],
                                      ),
                                      items: itemsBrands2.map((item) {
                                        return DropdownMenuItem<String>(
                                          value: item.toString(),
                                          child: Text(item.toString()),
                                        );
                                      }).toList(),
                                      value: selectedValueyear == ''
                                          ? selectedValueyear
                                          : null,
                                      onChanged: (String? value) {
                                        setState(() {
                                          selectedValueyear = value;
                                        });
                                      },
                                      buttonStyleData: ButtonStyleData(
                                        height: MediaQuery.of(context).size.height *
                                            1 /
                                            20,
                                        width: MediaQuery.of(context).size.width *
                                            1.5/
                                            6,

                                        decoration: BoxDecoration(
                                          // boxShadow: [
                                          //   BoxShadow(
                                          //     color: homeController.bluebackground.value,
                                          //     blurRadius:
                                          //     1, // soften the shadow
                                          //     offset: Offset(
                                          //       0.3, // Move to right 5  horizontally
                                          //       0.5, // Move to bottom 5 Vertically
                                          //     ),
                                          //   )
                                          // ],
                                          borderRadius:
                                          BorderRadius.circular(10),
                                          // color: homeController.white.value,
                                          // border: Border.all(
                                          //   width: 1,
                                          //   color: homeController
                                          //       .white.value,
                                          // ),
                                        ),
                                      ),
                                      iconStyleData: const IconStyleData(
                                        icon: Icon(
                                          Icons.arrow_drop_down,
                                        ),
                                        iconSize: 20,
                                      ),
                                      dropdownStyleData: DropdownStyleData(
                                        maxHeight: 200,
                                        width: MediaQuery.of(context).size.width *
                                            1.5/
                                            6,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(4),
                                        ),
                                        offset: const Offset(-0, 0),
                                        scrollbarTheme: ScrollbarThemeData(
                                          radius: const Radius.circular(4),
                                          thickness:
                                          MaterialStateProperty.all<double>(
                                              6),
                                          thumbVisibility:
                                          MaterialStateProperty.all<bool>(
                                              true),
                                        ),
                                      ),
                                      menuItemStyleData:
                                      const MenuItemStyleData(
                                        height: 40,
                                        padding: EdgeInsets.only(
                                            left: 14, right: 14),
                                      ),
                                    )
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          decrementMonth();
                                          print(data[currentMonthIndex].value);

                                        });
                                      },
                                      child: Image.asset('assets/arrowleft.png'),
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          1/
                                          6,
                                      margin: EdgeInsets.symmetric(horizontal: 28),
                                      child: Center(
                                        child: Text(
                                          data[currentMonthIndex].month.toString(),
                                          style: TextStyle(
                                              color: homeController.graybuton.value,fontSize: 28,fontWeight: FontWeight.w600
                                          ),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          incrementMonth();
                                          print(data[currentMonthIndex].value);
                                        });
                                      },
                                      child: Image.asset('assets/arrowrigth.png'),
                                    ),
                                  ],
                                ),
                                InkWell(
                                    onTap:(){
                                      setState((){
                                        DashboarController.fetchappointment(data[currentMonthIndex].value!,selectedValueyear!);

                                      });
                                    },
                                    child:Container(
                                        width: MediaQuery.of(context).size.width *
                                            1/
                                            6,
                                        height: MediaQuery.of(context).size.height *
                                            0.7/
                                            20,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              width: 1,
                                              color: homeController.bluebackground.value),
                                          color: homeController.white.value,
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        child:Text('Ok',style:TextStyle(color:homeController.bluebackground.value)))
                                )

                              ]),

                          SizedBox(  height: MediaQuery.of(context).size.height *
                              0.2/
                              6,),
                          // calendar
                          Obx(() =>  Column(
                            children: List.generate(DashboarController.itemCustomersOne!.length > 24 ? 5 : 4, (index) => index)
                                .map((item) {
                              print(item);
                              int index = item * 6;
                              print(DashboarController.itemCustomersOne!.length);
                              return Column(
                                children: [
                                  Container(
                                      width: MediaQuery.of(context).size.width * 5.8/6,


                                      child: Column(children: [
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            // 1
                                            Column(
                                              children: [
                                                Container(
                                                  width: (MediaQuery.of(context).size.width * 18/6 - 50) / 6,
                                                  decoration: BoxDecoration(
                                                      border: Border(
                                                        bottom: BorderSide(color:  homeController.bluebackground.value),
                                                      )
                                                  ),
                                                  alignment: Alignment.center,
                                                  margin: EdgeInsets.symmetric(horizontal: 1),
                                                  padding: EdgeInsets.symmetric(vertical: 10),
                                                  child: Column(
                                                    children: [
                                                      Text(DashboarController.itemCustomersOne![index + 0].day.toString(),
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            fontWeight: FontWeight.w500,
                                                            color:  homeController.bluebackground.value
                                                        ),),

                                                      Text(DashboarController.itemCustomersOne![index + 0].date.toString(),
                                                        style: TextStyle(
                                                            fontSize: 12,
                                                            color: homeController.graybuton.value
                                                        ),),
                                                    ],
                                                  ),
                                                ),


                                                Column(
                                                    children: DashboarController.itemCustomersOne![index + 0].menuItemQuantities!
                                                        .map((item) {
                                                      return
                                                        Container(
                                                            width: MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                                2.5 /
                                                                6,
                                                            height: MediaQuery.of(context).size.height*1.3/6,
                                                            margin: EdgeInsets.symmetric(vertical: 10),

                                                            alignment: Alignment.center,
                                                            decoration: BoxDecoration(
                                                              color: homeController.white.value,
                                                              borderRadius:
                                                              BorderRadius.circular(8),
                                                              border: Border.all(color: homeController.graybuton.value,width: 1),
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  color: homeController
                                                                      .bluebackground.value,
                                                                  offset: Offset(0.1, 0.1),
                                                                  blurRadius: 4,
                                                                )
                                                              ],
                                                            ),
                                                            child:
                                                            InkWell( child:
                                                            Column(children: [
                                                              DashboarController3.role.value!='Doctor'?    Row(
                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                children: [
                                                                  InkWell(
                                                                    onTap: (){
                                                                      id = item.appointmentId!;
                                                                      showAlertDialogstate(context);
                                                                    },
                                                                    child: Container(
                                                                      alignment: Alignment.center,
                                                                      margin: EdgeInsets.symmetric(horizontal: 5),
                                                                      width: MediaQuery.of(context).size.width* 1/6,
                                                                      padding: EdgeInsets.symmetric(horizontal: 1,vertical: 5),
                                                                      decoration: BoxDecoration(color: homeController.GRAYKAL.value,
                                                                          borderRadius: BorderRadius.circular(8)
                                                                      ),
                                                                      child: Text(item.state.toString(),style: TextStyle(fontSize: 14,color: homeController.green.value), ),
                                                                    ),
                                                                  ),
                                                                  InkWell(
                                                                    onTap: (){
                                                                      id = item.appointmentId!;
                                                                      // showAlertDialogcancleresrvation(context);
                                                                    },
                                                                    child: Container(child: Image.asset('assets/Union.png'),
                                                                      margin: EdgeInsets.only(top: 5),
                                                                    ),
                                                                  )
                                                                ],):Container(),
                                                              Row(mainAxisAlignment: MainAxisAlignment.center,children: [
                                                                Container(
                                                                  width: MediaQuery.of(context).size.width*1/6,
                                                                  alignment: Alignment.center,
                                                                  child: Text(item.patientName!.toString(),style: TextStyle(color: homeController.bluebackground.value,fontWeight: FontWeight.bold),),)
                                                              ],),
                                                              SizedBox(height: MediaQuery.of(context).size.height*0.05/6,),
                                                              Row(mainAxisAlignment: MainAxisAlignment.center,children: [
                                                                Container(
                                                                  width: MediaQuery.of(context).size.width*1/6,
                                                                  alignment: Alignment.center,
                                                                  child: Text(item.startTime!.toString(),style: TextStyle(color: homeController.bluebackground.value),),),
                                                                Container(
                                                                  width: MediaQuery.of(context).size.width*0.3/6,
                                                                  alignment: Alignment.center,
                                                                  child: Text('To',style: TextStyle(color: homeController.bluebackground.value),),),
                                                                Container(
                                                                  width: MediaQuery.of(context).size.width*1/6,
                                                                  alignment: Alignment.center,
                                                                  child: Text(item.endTime!.toString(),style: TextStyle(color: homeController.bluebackground.value),),),
                                                              ],),
                                                              SizedBox(height: MediaQuery.of(context).size.height*0.05/6,),
                                                              Divider(height: 9,color: homeController.bluebackground.value,),
                                                              SizedBox(height: MediaQuery.of(context).size.height*0.01/6,),

                                                              Row(mainAxisAlignment: MainAxisAlignment.center,children: [
                                                                Container(
                                                                  width: MediaQuery.of(context).size.width*1/6,
                                                                  alignment: Alignment.center,
                                                                  child: Text(item.caseName!.toString(),style: TextStyle(color: homeController.bluebackground.value),),)
                                                              ],),
                                                              SizedBox(height: MediaQuery.of(context).size.height*0.01/6,),


                                                              InkWell(
                                                                  onTap:()async{

                                                                    // if(item.patientId != null){
                                                                      // await  DashboarController.fetchapationOne(item.patientId!,1);}
                                                                    idpation = item.appointmentId!.toString();
                                                                    setState(() {


                                                                      // item.patientRegistered == false?addpatent = false : patientInformation = false;
                                                                      // print(item.patientRegistered.toString());
                                                                      // item.patientRegistered == false? (showAlertDialogregisterpatent(context)):
                                                                      // patientInformation=false;

                                                                    });
                                                                  },
                                                                  child:Column(
                                                                      children:[
                                                                        Row(mainAxisAlignment: MainAxisAlignment.center,children: [
                                                                          Container(
                                                                            width: MediaQuery.of(context).size.width*1.7/6,
                                                                            alignment: Alignment.center,
                                                                            child: Text(item.doctorName!.toString(),style: TextStyle(color: homeController.bluebackground.value,fontWeight: FontWeight.w800,fontSize: 16),),)
                                                                        ],),
                                                                      ]
                                                                  )
                                                              ),



                                                            ],) ,)
                                                        );
                                                    }).toList()


                                                ),


                                              ],
                                            ),

                                            // 2
                                            DashboarController.itemCustomersOne!.length < 26 && item == 4 ?
                                            Container():
                                            Column(
                                              children: [
                                                Container(
                                                  width: (MediaQuery.of(context).size.width * 18/6 - 50) / 7,
                                                  decoration: BoxDecoration(
                                                      border: Border(
                                                        bottom: BorderSide(color:  homeController.bluebackground.value),
                                                      )
                                                  ),
                                                  alignment: Alignment.center,
                                                  margin: EdgeInsets.symmetric(horizontal: 10),
                                                  padding: EdgeInsets.symmetric(vertical: 10),
                                                  child: Column(
                                                    children: [
                                                      Text(DashboarController.itemCustomersOne![index + 1].day.toString(),
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            fontWeight: FontWeight.w500,
                                                            color:  homeController.bluebackground.value
                                                        ),),

                                                      Text(DashboarController.itemCustomersOne![index + 1].date.toString(),
                                                        style: TextStyle(
                                                            fontSize: 12,
                                                            color: homeController.graybuton.value
                                                        ),),
                                                    ],
                                                  ),
                                                ),

                                                Column(
                                                    children: DashboarController.itemCustomersOne![index + 1].menuItemQuantities!
                                                        .map((item) {
                                                      return
                                                        Container(
                                                            width: MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                                2.5 /
                                                                6,
                                                            height: MediaQuery.of(context).size.height*1.3/6,
                                                            margin: EdgeInsets.symmetric(vertical: 10),

                                                            alignment: Alignment.center,
                                                            decoration: BoxDecoration(
                                                              color: homeController.white.value,
                                                              borderRadius:
                                                              BorderRadius.circular(8),
                                                              border: Border.all(color: homeController.graybuton.value,width: 1),
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  color: homeController
                                                                      .bluebackground.value,
                                                                  offset: Offset(0.1, 0.1),
                                                                  blurRadius: 4,
                                                                )
                                                              ],
                                                            ),
                                                            child:
                                                            InkWell( child:
                                                            Column(children: [
                                                              DashboarController3.role.value!='Doctor'?    Row(
                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                children: [
                                                                  InkWell(
                                                                    onTap: (){
                                                                      id = item.appointmentId!;
                                                                      showAlertDialogstate(context);
                                                                    },
                                                                    child: Container(
                                                                      alignment: Alignment.center,
                                                                      margin: EdgeInsets.symmetric(horizontal: 5),
                                                                      width: MediaQuery.of(context).size.width* 1/6,
                                                                      padding: EdgeInsets.symmetric(horizontal: 1,vertical: 5),
                                                                      decoration: BoxDecoration(color: homeController.GRAYKAL.value,
                                                                          borderRadius: BorderRadius.circular(8)
                                                                      ),
                                                                      child: Text(item.state.toString(),style: TextStyle(fontSize: 14,color: homeController.green.value), ),
                                                                    ),
                                                                  ),
                                                                  InkWell(
                                                                    onTap: (){
                                                                      id = item.appointmentId!;
                                                                      // showAlertDialogcancleresrvation(context);
                                                                    },
                                                                    child: Container(child: Image.asset('assets/Union.png'),
                                                                      margin: EdgeInsets.only(top: 5),
                                                                    ),
                                                                  )
                                                                ],):Container(),
                                                              Row(mainAxisAlignment: MainAxisAlignment.center,children: [
                                                                Container(
                                                                  width: MediaQuery.of(context).size.width*1/6,
                                                                  alignment: Alignment.center,
                                                                  child: Text(item.patientName!.toString(),style: TextStyle(color: homeController.bluebackground.value,fontWeight: FontWeight.bold),),)
                                                              ],),
                                                              SizedBox(height: MediaQuery.of(context).size.height*0.05/6,),
                                                              Row(mainAxisAlignment: MainAxisAlignment.center,children: [
                                                                Container(
                                                                  width: MediaQuery.of(context).size.width*1/6,
                                                                  alignment: Alignment.center,
                                                                  child: Text(item.startTime!.toString(),style: TextStyle(color: homeController.bluebackground.value),),),
                                                                Container(
                                                                  width: MediaQuery.of(context).size.width*0.3/6,
                                                                  alignment: Alignment.center,
                                                                  child: Text('To',style: TextStyle(color: homeController.bluebackground.value),),),
                                                                Container(
                                                                  width: MediaQuery.of(context).size.width*1/6,
                                                                  alignment: Alignment.center,
                                                                  child: Text(item.endTime!.toString(),style: TextStyle(color: homeController.bluebackground.value),),),
                                                              ],),
                                                              SizedBox(height: MediaQuery.of(context).size.height*0.05/6,),
                                                              Divider(height: 9,color: homeController.bluebackground.value,),
                                                              SizedBox(height: MediaQuery.of(context).size.height*0.01/6,),

                                                              Row(mainAxisAlignment: MainAxisAlignment.center,children: [
                                                                Container(
                                                                  width: MediaQuery.of(context).size.width*1/6,
                                                                  alignment: Alignment.center,
                                                                  child: Text(item.caseName!.toString(),style: TextStyle(color: homeController.bluebackground.value),),)
                                                              ],),
                                                              SizedBox(height: MediaQuery.of(context).size.height*0.01/6,),


                                                              InkWell(
                                                                  onTap:()async{

                                                                    // if(item.patientId != null){
                                                                    // await  DashboarController.fetchapationOne(item.patientId!,1);}
                                                                    idpation = item.appointmentId!.toString();
                                                                    setState(() {


                                                                      // item.patientRegistered == false?addpatent = false : patientInformation = false;
                                                                      // print(item.patientRegistered.toString());
                                                                      // item.patientRegistered == false? (showAlertDialogregisterpatent(context)):
                                                                      // patientInformation=false;

                                                                    });
                                                                  },
                                                                  child:Column(
                                                                      children:[
                                                                        Row(mainAxisAlignment: MainAxisAlignment.center,children: [
                                                                          Container(
                                                                            width: MediaQuery.of(context).size.width*1.7/6,
                                                                            alignment: Alignment.center,
                                                                            child: Text(item.doctorName!.toString(),style: TextStyle(color: homeController.bluebackground.value,fontWeight: FontWeight.w800,fontSize: 16),),)
                                                                        ],),
                                                                      ]
                                                                  )
                                                              ),



                                                            ],) ,)
                                                        );
                                                    }).toList()


                                                )
                                              ],
                                            ),

                                          ],
                                        ),
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            // 3
                                            DashboarController.itemCustomersOne!.length < 27 && item == 4 ?
                                            Container():
                                            Column(
                                              children: [
                                                Container(
                                                  width: (MediaQuery.of(context).size.width * 18/6 - 50) / 7,
                                                  decoration: BoxDecoration(
                                                      border: Border(
                                                        bottom: BorderSide(color:  homeController.bluebackground.value),
                                                      )
                                                  ),
                                                  alignment: Alignment.center,
                                                  margin: EdgeInsets.symmetric(horizontal: 10),
                                                  padding: EdgeInsets.symmetric(vertical: 10),
                                                  child: Column(
                                                    children: [
                                                      Text(DashboarController.itemCustomersOne![index + 2].day.toString(),
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            fontWeight: FontWeight.w500,
                                                            color:  homeController.bluebackground.value
                                                        ),),

                                                      Text(DashboarController.itemCustomersOne![index + 2].date.toString(),
                                                        style: TextStyle(
                                                            fontSize: 12,
                                                            color: homeController.graybuton.value
                                                        ),),
                                                    ],
                                                  ),
                                                ),

                                                Column(
                                                    children: DashboarController.itemCustomersOne![index + 2].menuItemQuantities!
                                                        .map((item) {
                                                      return
                                                        Container(
                                                            width: MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                                2.5 /
                                                                6,
                                                            height: MediaQuery.of(context).size.height*1.3/6,
                                                            margin: EdgeInsets.symmetric(vertical: 10),

                                                            alignment: Alignment.center,
                                                            decoration: BoxDecoration(
                                                              color: homeController.white.value,
                                                              borderRadius:
                                                              BorderRadius.circular(8),
                                                              border: Border.all(color: homeController.graybuton.value,width: 1),
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  color: homeController
                                                                      .bluebackground.value,
                                                                  offset: Offset(0.1, 0.1),
                                                                  blurRadius: 4,
                                                                )
                                                              ],
                                                            ),
                                                            child:
                                                            InkWell( child:
                                                            Column(children: [
                                                              DashboarController3.role.value!='Doctor'?    Row(
                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                children: [
                                                                  InkWell(
                                                                    onTap: (){
                                                                      id = item.appointmentId!;
                                                                      showAlertDialogstate(context);
                                                                    },
                                                                    child: Container(
                                                                      alignment: Alignment.center,
                                                                      margin: EdgeInsets.symmetric(horizontal: 5),
                                                                      width: MediaQuery.of(context).size.width* 1/6,
                                                                      padding: EdgeInsets.symmetric(horizontal: 1,vertical: 5),
                                                                      decoration: BoxDecoration(color: homeController.GRAYKAL.value,
                                                                          borderRadius: BorderRadius.circular(8)
                                                                      ),
                                                                      child: Text(item.state.toString(),style: TextStyle(fontSize: 14,color: homeController.green.value), ),
                                                                    ),
                                                                  ),
                                                                  InkWell(
                                                                    onTap: (){
                                                                      id = item.appointmentId!;
                                                                      // showAlertDialogcancleresrvation(context);
                                                                    },
                                                                    child: Container(child: Image.asset('assets/Union.png'),
                                                                      margin: EdgeInsets.only(top: 5),
                                                                    ),
                                                                  )
                                                                ],):Container(),
                                                              Row(mainAxisAlignment: MainAxisAlignment.center,children: [
                                                                Container(
                                                                  width: MediaQuery.of(context).size.width*1/6,
                                                                  alignment: Alignment.center,
                                                                  child: Text(item.patientName!.toString(),style: TextStyle(color: homeController.bluebackground.value,fontWeight: FontWeight.bold),),)
                                                              ],),
                                                              SizedBox(height: MediaQuery.of(context).size.height*0.05/6,),
                                                              Row(mainAxisAlignment: MainAxisAlignment.center,children: [
                                                                Container(
                                                                  width: MediaQuery.of(context).size.width*1/6,
                                                                  alignment: Alignment.center,
                                                                  child: Text(item.startTime!.toString(),style: TextStyle(color: homeController.bluebackground.value),),),
                                                                Container(
                                                                  width: MediaQuery.of(context).size.width*0.3/6,
                                                                  alignment: Alignment.center,
                                                                  child: Text('To',style: TextStyle(color: homeController.bluebackground.value),),),
                                                                Container(
                                                                  width: MediaQuery.of(context).size.width*1/6,
                                                                  alignment: Alignment.center,
                                                                  child: Text(item.endTime!.toString(),style: TextStyle(color: homeController.bluebackground.value),),),
                                                              ],),
                                                              SizedBox(height: MediaQuery.of(context).size.height*0.05/6,),
                                                              Divider(height: 9,color: homeController.bluebackground.value,),
                                                              SizedBox(height: MediaQuery.of(context).size.height*0.01/6,),

                                                              Row(mainAxisAlignment: MainAxisAlignment.center,children: [
                                                                Container(
                                                                  width: MediaQuery.of(context).size.width*1/6,
                                                                  alignment: Alignment.center,
                                                                  child: Text(item.caseName!.toString(),style: TextStyle(color: homeController.bluebackground.value),),)
                                                              ],),
                                                              SizedBox(height: MediaQuery.of(context).size.height*0.01/6,),


                                                              InkWell(
                                                                  onTap:()async{

                                                                    // if(item.patientId != null){
                                                                    // await  DashboarController.fetchapationOne(item.patientId!,1);}
                                                                    idpation = item.appointmentId!.toString();
                                                                    setState(() {


                                                                      // item.patientRegistered == false?addpatent = false : patientInformation = false;
                                                                      // print(item.patientRegistered.toString());
                                                                      // item.patientRegistered == false? (showAlertDialogregisterpatent(context)):
                                                                      // patientInformation=false;

                                                                    });
                                                                  },
                                                                  child:Column(
                                                                      children:[
                                                                        Row(mainAxisAlignment: MainAxisAlignment.center,children: [
                                                                          Container(
                                                                            width: MediaQuery.of(context).size.width*1.7/6,
                                                                            alignment: Alignment.center,
                                                                            child: Text(item.doctorName!.toString(),style: TextStyle(color: homeController.bluebackground.value,fontWeight: FontWeight.w800,fontSize: 16),),)
                                                                        ],),
                                                                      ]
                                                                  )
                                                              ),



                                                            ],) ,)
                                                        );
                                                    }).toList()


                                                )
                                              ],
                                            ),


                                            // 4
                                            item == 4? Container():
                                            Column(
                                              children: [
                                                Container(
                                                  width: (MediaQuery.of(context).size.width * 18/6 - 50) / 7,
                                                  decoration: BoxDecoration(
                                                      border: Border(
                                                        bottom: BorderSide(color:  homeController.bluebackground.value),
                                                      )
                                                  ),
                                                  alignment: Alignment.center,
                                                  margin: EdgeInsets.symmetric(horizontal: 10),
                                                  padding: EdgeInsets.symmetric(vertical: 10),
                                                  child: Column(
                                                    children: [
                                                      Text(DashboarController.itemCustomersOne![index + 3].day.toString(),
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            fontWeight: FontWeight.w500,
                                                            color:  homeController.bluebackground.value
                                                        ),),

                                                      Text(DashboarController.itemCustomersOne![index + 3].date.toString(),
                                                        style: TextStyle(
                                                            fontSize: 12,
                                                            color: homeController.graybuton.value
                                                        ),),
                                                    ],
                                                  ),
                                                ),

                                                Column(
                                                    children: DashboarController.itemCustomersOne![index + 3].menuItemQuantities!
                                                        .map((item) {
                                                      return
                                                        Container(
                                                            width: MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                                2.5 /
                                                                6,
                                                            height: MediaQuery.of(context).size.height*1.3/6,
                                                            margin: EdgeInsets.symmetric(vertical: 10),

                                                            alignment: Alignment.center,
                                                            decoration: BoxDecoration(
                                                              color: homeController.white.value,
                                                              borderRadius:
                                                              BorderRadius.circular(8),
                                                              border: Border.all(color: homeController.graybuton.value,width: 1),
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  color: homeController
                                                                      .bluebackground.value,
                                                                  offset: Offset(0.1, 0.1),
                                                                  blurRadius: 4,
                                                                )
                                                              ],
                                                            ),
                                                            child:
                                                            InkWell( child:
                                                            Column(children: [
                                                              DashboarController3.role.value!='Doctor'?    Row(
                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                children: [
                                                                  InkWell(
                                                                    onTap: (){
                                                                      id = item.appointmentId!;
                                                                      showAlertDialogstate(context);
                                                                    },
                                                                    child: Container(
                                                                      alignment: Alignment.center,
                                                                      margin: EdgeInsets.symmetric(horizontal: 5),
                                                                      width: MediaQuery.of(context).size.width* 1/6,
                                                                      padding: EdgeInsets.symmetric(horizontal: 1,vertical: 5),
                                                                      decoration: BoxDecoration(color: homeController.GRAYKAL.value,
                                                                          borderRadius: BorderRadius.circular(8)
                                                                      ),
                                                                      child: Text(item.state.toString(),style: TextStyle(fontSize: 14,color: homeController.green.value), ),
                                                                    ),
                                                                  ),
                                                                  InkWell(
                                                                    onTap: (){
                                                                      id = item.appointmentId!;
                                                                      // showAlertDialogcancleresrvation(context);
                                                                    },
                                                                    child: Container(child: Image.asset('assets/Union.png'),
                                                                      margin: EdgeInsets.only(top: 5),
                                                                    ),
                                                                  )
                                                                ],):Container(),
                                                              Row(mainAxisAlignment: MainAxisAlignment.center,children: [
                                                                Container(
                                                                  width: MediaQuery.of(context).size.width*1/6,
                                                                  alignment: Alignment.center,
                                                                  child: Text(item.patientName!.toString(),style: TextStyle(color: homeController.bluebackground.value,fontWeight: FontWeight.bold),),)
                                                              ],),
                                                              SizedBox(height: MediaQuery.of(context).size.height*0.05/6,),
                                                              Row(mainAxisAlignment: MainAxisAlignment.center,children: [
                                                                Container(
                                                                  width: MediaQuery.of(context).size.width*1/6,
                                                                  alignment: Alignment.center,
                                                                  child: Text(item.startTime!.toString(),style: TextStyle(color: homeController.bluebackground.value),),),
                                                                Container(
                                                                  width: MediaQuery.of(context).size.width*0.3/6,
                                                                  alignment: Alignment.center,
                                                                  child: Text('To',style: TextStyle(color: homeController.bluebackground.value),),),
                                                                Container(
                                                                  width: MediaQuery.of(context).size.width*1/6,
                                                                  alignment: Alignment.center,
                                                                  child: Text(item.endTime!.toString(),style: TextStyle(color: homeController.bluebackground.value),),),
                                                              ],),
                                                              SizedBox(height: MediaQuery.of(context).size.height*0.05/6,),
                                                              Divider(height: 9,color: homeController.bluebackground.value,),
                                                              SizedBox(height: MediaQuery.of(context).size.height*0.01/6,),

                                                              Row(mainAxisAlignment: MainAxisAlignment.center,children: [
                                                                Container(
                                                                  width: MediaQuery.of(context).size.width*1/6,
                                                                  alignment: Alignment.center,
                                                                  child: Text(item.caseName!.toString(),style: TextStyle(color: homeController.bluebackground.value),),)
                                                              ],),
                                                              SizedBox(height: MediaQuery.of(context).size.height*0.01/6,),


                                                              InkWell(
                                                                  onTap:()async{

                                                                    // if(item.patientId != null){
                                                                    // await  DashboarController.fetchapationOne(item.patientId!,1);}
                                                                    idpation = item.appointmentId!.toString();
                                                                    setState(() {


                                                                      // item.patientRegistered == false?addpatent = false : patientInformation = false;
                                                                      // print(item.patientRegistered.toString());
                                                                      // item.patientRegistered == false? (showAlertDialogregisterpatent(context)):
                                                                      // patientInformation=false;

                                                                    });
                                                                  },
                                                                  child:Column(
                                                                      children:[
                                                                        Row(mainAxisAlignment: MainAxisAlignment.center,children: [
                                                                          Container(
                                                                            width: MediaQuery.of(context).size.width*1.7/6,
                                                                            alignment: Alignment.center,
                                                                            child: Text(item.doctorName!.toString(),style: TextStyle(color: homeController.bluebackground.value,fontWeight: FontWeight.w800,fontSize: 16),),)
                                                                        ],),
                                                                      ]
                                                                  )
                                                              ),



                                                            ],) ,)
                                                        );
                                                    }).toList()


                                                )
                                              ],
                                            ),



                                          ],
                                        ),
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [



                                            // 5
                                            item == 4? Container():
                                            Column(
                                              children: [
                                                Container(
                                                  width: (MediaQuery.of(context).size.width * 18/6 - 50) / 7,
                                                  decoration: BoxDecoration(
                                                      border: Border(
                                                        bottom: BorderSide(color:  homeController.bluebackground.value),
                                                      )
                                                  ),
                                                  alignment: Alignment.center,
                                                  margin: EdgeInsets.symmetric(horizontal: 10),
                                                  padding: EdgeInsets.symmetric(vertical: 10),
                                                  child: Column(
                                                    children: [
                                                      Text(DashboarController.itemCustomersOne![index + 4].day.toString(),
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            fontWeight: FontWeight.w500,
                                                            color:  homeController.bluebackground.value
                                                        ),),

                                                      Text(DashboarController.itemCustomersOne![index + 4].date.toString(),
                                                        style: TextStyle(
                                                            fontSize: 12,
                                                            color: homeController.graybuton.value
                                                        ),),
                                                    ],
                                                  ),
                                                ),

                                                Column(
                                                    children: DashboarController.itemCustomersOne![index + 4].menuItemQuantities!
                                                        .map((item) {
                                                      return
                                                        Container(
                                                            width: MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                                2.5 /
                                                                6,
                                                            height: MediaQuery.of(context).size.height*1.3/6,
                                                            margin: EdgeInsets.symmetric(vertical: 10),

                                                            alignment: Alignment.center,
                                                            decoration: BoxDecoration(
                                                              color: homeController.white.value,
                                                              borderRadius:
                                                              BorderRadius.circular(8),
                                                              border: Border.all(color: homeController.graybuton.value,width: 1),
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  color: homeController
                                                                      .bluebackground.value,
                                                                  offset: Offset(0.1, 0.1),
                                                                  blurRadius: 4,
                                                                )
                                                              ],
                                                            ),
                                                            child:
                                                            InkWell( child:
                                                            Column(children: [
                                                              DashboarController3.role.value!='Doctor'?    Row(
                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                children: [
                                                                  InkWell(
                                                                    onTap: (){
                                                                      id = item.appointmentId!;
                                                                      showAlertDialogstate(context);
                                                                    },
                                                                    child: Container(
                                                                      alignment: Alignment.center,
                                                                      margin: EdgeInsets.symmetric(horizontal: 5),
                                                                      width: MediaQuery.of(context).size.width* 1/6,
                                                                      padding: EdgeInsets.symmetric(horizontal: 1,vertical: 5),
                                                                      decoration: BoxDecoration(color: homeController.GRAYKAL.value,
                                                                          borderRadius: BorderRadius.circular(8)
                                                                      ),
                                                                      child: Text(item.state.toString(),style: TextStyle(fontSize: 14,color: homeController.green.value), ),
                                                                    ),
                                                                  ),
                                                                  InkWell(
                                                                    onTap: (){
                                                                      id = item.appointmentId!;
                                                                      // showAlertDialogcancleresrvation(context);
                                                                    },
                                                                    child: Container(child: Image.asset('assets/Union.png'),
                                                                      margin: EdgeInsets.only(top: 5),
                                                                    ),
                                                                  )
                                                                ],):Container(),
                                                              Row(mainAxisAlignment: MainAxisAlignment.center,children: [
                                                                Container(
                                                                  width: MediaQuery.of(context).size.width*1/6,
                                                                  alignment: Alignment.center,
                                                                  child: Text(item.patientName!.toString(),style: TextStyle(color: homeController.bluebackground.value,fontWeight: FontWeight.bold),),)
                                                              ],),
                                                              SizedBox(height: MediaQuery.of(context).size.height*0.05/6,),
                                                              Row(mainAxisAlignment: MainAxisAlignment.center,children: [
                                                                Container(
                                                                  width: MediaQuery.of(context).size.width*1/6,
                                                                  alignment: Alignment.center,
                                                                  child: Text(item.startTime!.toString(),style: TextStyle(color: homeController.bluebackground.value),),),
                                                                Container(
                                                                  width: MediaQuery.of(context).size.width*0.3/6,
                                                                  alignment: Alignment.center,
                                                                  child: Text('To',style: TextStyle(color: homeController.bluebackground.value),),),
                                                                Container(
                                                                  width: MediaQuery.of(context).size.width*1/6,
                                                                  alignment: Alignment.center,
                                                                  child: Text(item.endTime!.toString(),style: TextStyle(color: homeController.bluebackground.value),),),
                                                              ],),
                                                              SizedBox(height: MediaQuery.of(context).size.height*0.05/6,),
                                                              Divider(height: 9,color: homeController.bluebackground.value,),
                                                              SizedBox(height: MediaQuery.of(context).size.height*0.01/6,),

                                                              Row(mainAxisAlignment: MainAxisAlignment.center,children: [
                                                                Container(
                                                                  width: MediaQuery.of(context).size.width*1/6,
                                                                  alignment: Alignment.center,
                                                                  child: Text(item.caseName!.toString(),style: TextStyle(color: homeController.bluebackground.value),),)
                                                              ],),
                                                              SizedBox(height: MediaQuery.of(context).size.height*0.01/6,),


                                                              InkWell(
                                                                  onTap:()async{

                                                                    // if(item.patientId != null){
                                                                    // await  DashboarController.fetchapationOne(item.patientId!,1);}
                                                                    idpation = item.appointmentId!.toString();
                                                                    setState(() {


                                                                      // item.patientRegistered == false?addpatent = false : patientInformation = false;
                                                                      // print(item.patientRegistered.toString());
                                                                      // item.patientRegistered == false? (showAlertDialogregisterpatent(context)):
                                                                      // patientInformation=false;

                                                                    });
                                                                  },
                                                                  child:Column(
                                                                      children:[
                                                                        Row(mainAxisAlignment: MainAxisAlignment.center,children: [
                                                                          Container(
                                                                            width: MediaQuery.of(context).size.width*1.7/6,
                                                                            alignment: Alignment.center,
                                                                            child: Text(item.doctorName!.toString(),style: TextStyle(color: homeController.bluebackground.value,fontWeight: FontWeight.w800,fontSize: 16),),)
                                                                        ],),
                                                                      ]
                                                                  )
                                                              ),



                                                            ],) ,)
                                                        );
                                                    }).toList()


                                                )
                                              ],
                                            ),


                                            // 6
                                            item == 4? Container():
                                            Column(
                                              children: [
                                                Container(
                                                  width: (MediaQuery.of(context).size.width * 18/6 - 50) / 7,
                                                  decoration: BoxDecoration(
                                                      border: Border(
                                                        bottom: BorderSide(color:  homeController.bluebackground.value),
                                                      )
                                                  ),
                                                  alignment: Alignment.center,
                                                  margin: EdgeInsets.symmetric(horizontal: 10),
                                                  padding: EdgeInsets.symmetric(vertical: 10),
                                                  child: Column(
                                                    children: [
                                                      Text(DashboarController.itemCustomersOne![index + 5].day.toString(),
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            fontWeight: FontWeight.w500,
                                                            color:  homeController.bluebackground.value
                                                        ),),

                                                      Text(DashboarController.itemCustomersOne![index + 5].date.toString(),
                                                        style: TextStyle(
                                                            fontSize: 12,
                                                            color: homeController.graybuton.value
                                                        ),),
                                                    ],
                                                  ),
                                                ),

                                                Column(
                                                    children: DashboarController.itemCustomersOne![index + 5].menuItemQuantities!
                                                        .map((item) {
                                                      return
                                                        Container(
                                                            width: MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                                2.5 /
                                                                6,
                                                            height: MediaQuery.of(context).size.height*1.3/6,
                                                            margin: EdgeInsets.symmetric(vertical: 10),

                                                            alignment: Alignment.center,
                                                            decoration: BoxDecoration(
                                                              color: homeController.white.value,
                                                              borderRadius:
                                                              BorderRadius.circular(8),
                                                              border: Border.all(color: homeController.graybuton.value,width: 1),
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  color: homeController
                                                                      .bluebackground.value,
                                                                  offset: Offset(0.1, 0.1),
                                                                  blurRadius: 4,
                                                                )
                                                              ],
                                                            ),
                                                            child:
                                                            InkWell( child:
                                                            Column(children: [
                                                              DashboarController3.role.value!='Doctor'?    Row(
                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                children: [
                                                                  InkWell(
                                                                    onTap: (){
                                                                      id = item.appointmentId!;
                                                                      showAlertDialogstate(context);
                                                                    },
                                                                    child: Container(
                                                                      alignment: Alignment.center,
                                                                      margin: EdgeInsets.symmetric(horizontal: 5),
                                                                      width: MediaQuery.of(context).size.width* 1/6,
                                                                      padding: EdgeInsets.symmetric(horizontal: 1,vertical: 5),
                                                                      decoration: BoxDecoration(color: homeController.GRAYKAL.value,
                                                                          borderRadius: BorderRadius.circular(8)
                                                                      ),
                                                                      child: Text(item.state.toString(),style: TextStyle(fontSize: 14,color: homeController.green.value), ),
                                                                    ),
                                                                  ),
                                                                  InkWell(
                                                                    onTap: (){
                                                                      id = item.appointmentId!;
                                                                      // showAlertDialogcancleresrvation(context);
                                                                    },
                                                                    child: Container(child: Image.asset('assets/Union.png'),
                                                                      margin: EdgeInsets.only(top: 5),
                                                                    ),
                                                                  )
                                                                ],):Container(),
                                                              Row(mainAxisAlignment: MainAxisAlignment.center,children: [
                                                                Container(
                                                                  width: MediaQuery.of(context).size.width*1/6,
                                                                  alignment: Alignment.center,
                                                                  child: Text(item.patientName!.toString(),style: TextStyle(color: homeController.bluebackground.value,fontWeight: FontWeight.bold),),)
                                                              ],),
                                                              SizedBox(height: MediaQuery.of(context).size.height*0.05/6,),
                                                              Row(mainAxisAlignment: MainAxisAlignment.center,children: [
                                                                Container(
                                                                  width: MediaQuery.of(context).size.width*1/6,
                                                                  alignment: Alignment.center,
                                                                  child: Text(item.startTime!.toString(),style: TextStyle(color: homeController.bluebackground.value),),),
                                                                Container(
                                                                  width: MediaQuery.of(context).size.width*0.3/6,
                                                                  alignment: Alignment.center,
                                                                  child: Text('To',style: TextStyle(color: homeController.bluebackground.value),),),
                                                                Container(
                                                                  width: MediaQuery.of(context).size.width*1/6,
                                                                  alignment: Alignment.center,
                                                                  child: Text(item.endTime!.toString(),style: TextStyle(color: homeController.bluebackground.value),),),
                                                              ],),
                                                              SizedBox(height: MediaQuery.of(context).size.height*0.05/6,),
                                                              Divider(height: 9,color: homeController.bluebackground.value,),
                                                              SizedBox(height: MediaQuery.of(context).size.height*0.01/6,),

                                                              Row(mainAxisAlignment: MainAxisAlignment.center,children: [
                                                                Container(
                                                                  width: MediaQuery.of(context).size.width*1/6,
                                                                  alignment: Alignment.center,
                                                                  child: Text(item.caseName!.toString(),style: TextStyle(color: homeController.bluebackground.value),),)
                                                              ],),
                                                              SizedBox(height: MediaQuery.of(context).size.height*0.01/6,),


                                                              InkWell(
                                                                  onTap:()async{

                                                                    // if(item.patientId != null){
                                                                    // await  DashboarController.fetchapationOne(item.patientId!,1);}
                                                                    idpation = item.appointmentId!.toString();
                                                                    setState(() {


                                                                      // item.patientRegistered == false?addpatent = false : patientInformation = false;
                                                                      // print(item.patientRegistered.toString());
                                                                      // item.patientRegistered == false? (showAlertDialogregisterpatent(context)):
                                                                      // patientInformation=false;

                                                                    });
                                                                  },
                                                                  child:Column(
                                                                      children:[
                                                                        Row(mainAxisAlignment: MainAxisAlignment.center,children: [
                                                                          Container(
                                                                            width: MediaQuery.of(context).size.width*1.7/6,
                                                                            alignment: Alignment.center,
                                                                            child: Text(item.doctorName!.toString(),style: TextStyle(color: homeController.bluebackground.value,fontWeight: FontWeight.w800,fontSize: 16),),)
                                                                        ],),
                                                                      ]
                                                                  )
                                                              ),



                                                            ],) ,)
                                                        );
                                                    }).toList()


                                                )
                                              ],
                                            ),

                                          ],
                                        ),
                                      ],)
                                  ),

                                ],
                              );
                            }

                            )
                                .toList(),
                          )   ,
                          ),
                        ],)
                      ]
                  ),),
                ),
              ),
            )),
        
      ),
    );
  }
}
class _SalesData {
  final String month;
  final int value;
  _SalesData(this.month, this.value);
}