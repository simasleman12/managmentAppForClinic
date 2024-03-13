import 'dart:ui';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../backConnection/dashbordcontoller.dart';
import '../controler/color.dart';
import '../controler/varbel.dart';

class Report extends StatefulWidget {
  @override
  Reports createState() => Reports();
}

class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}

class Reports extends State<Report> {

  final homeController = Get.put(homeControler());
  final controller = PageController(viewportFraction: 0.8, keepPage: true);
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController Search = TextEditingController();
  final TextEditingController CustemorsName = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController address = TextEditingController();
  final TextEditingController adderssTow = TextEditingController();
  final TextEditingController Provinse = TextEditingController();
  final TextEditingController City = TextEditingController();
  final TextEditingController Country = TextEditingController();
  final TextEditingController Note = TextEditingController();
  final varabelControler = Get.put(Controller());
  final DashboarController = Get.put(dashboardController());
  String selectedValueUser = '2';
  TextEditingController dateinputs = TextEditingController();
  TextEditingController dateOutputs = TextEditingController();
  String CustemorsNames = "";
  String phones = "";
  String emails = "";
  String addresss = "";
  String adderssTows = "";
  String Provinses = "";
  String Citys = "";
  String Countrys = "";
  String Notes = "";
  DateTime? dateinput;
  DateTime? dateOutput;
  String search = "";
  String? selectedValue;
  String? selectedValue2;
  String selectedValueProduct = '2';



  @override
  void initState() {
    // TODO: implement initState
     DashboarController.ReportAll(
      dateinput,
      dateOutput,
      selectedValue,
    );
  }

var repo='All';
  @override
  Widget build(BuildContext context) {
    var items = [
      AppLocalizations.of(context)!.yesterday,
      AppLocalizations.of(context)!.today,
      AppLocalizations.of(context)!.thisweek,
      AppLocalizations.of(context)!.last7day,
      AppLocalizations.of(context)!.thismonth,
      'Custom',
    ];
    var items2 = [
      'All',
      'Doctors',
     ];
    return MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        child: SafeArea(
            child: Form(
              key: _formKey,
              child: Container(
                color: homeController.white.value,
                padding: EdgeInsets.symmetric(horizontal: 1, vertical: 0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [

                      Container(
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


                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [

                                  SizedBox(  width: MediaQuery.of(context).size.width *
                                      0.01/
                                      6,),
                                  InkWell(
                                    child:
                                    Image.asset('assets/user.png',width: 60,height:60,),
                                  )
                                ],),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [

                                  SizedBox(  width: MediaQuery.of(context).size.width *
                                      0.01/
                                      6,),
                                  InkWell(
                                      child:
                                      DropdownButtonHideUnderline(
                                        child: DropdownButton2(
                                          isExpanded: true,

                                          hint: Row(
                                            children: [
                                              Image.asset('assets/clock.png',width: 60,height:60,),
                                              SizedBox(
                                                width: 4,
                                              ),

                                            ],
                                          ),
                                          items: items
                                              .map((item) => DropdownMenuItem<String>(
                                              value: item,
                                              child: Container(
                                                child: Text(
                                                  item,
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w400,
                                                    color:
                                                    homeController.black.value,
                                                  ),
                                                  overflow: TextOverflow.ellipsis,
                                                ),
                                              )))
                                              .toList(),
                                          value: selectedValue==null?AppLocalizations.of(context)!.today:selectedValue,
                                          onChanged: (value) {
                                            setState(() {
                                              selectedValue = value as String;
                                              DashboarController.ReportAll(
                                                dateinput,
                                                dateOutput,
                                                selectedValue,
                                              );
                                            });
                                          },
                                          buttonStyleData: ButtonStyleData(
                                            height: 45,
                                            width: MediaQuery.of(context).size.width * 2 / 6,
                                            padding: EdgeInsets.only(left: 14, right: 14),

                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(8),
                                                color: homeController.white.value),
                                            elevation: 2,
                                          ),
                                          iconStyleData: IconStyleData(
                                            icon: Icon(
                                              Icons.timer_rounded,color: homeController.backgrawnd.value,
                                            ),

                                            iconSize: 30,
                                          ),
                                          dropdownStyleData: DropdownStyleData(
                                            maxHeight: 150,

                                            width: MediaQuery.of(context).size.width * 2 / 6,
                                            padding: EdgeInsets.symmetric(horizontal: 10),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(8),
                                              color: homeController.white.value,
                                            ),
                                            elevation: 8,
                                            offset: Offset(-0, 0),
                                            scrollbarTheme: ScrollbarThemeData(
                                              radius: Radius.circular(8),
                                              thickness: MaterialStateProperty.all<double>(6),
                                              thumbVisibility:
                                              MaterialStateProperty.all<bool>(true),
                                            ),
                                          ),
                                          menuItemStyleData: const MenuItemStyleData(
                                            height: 40,
                                            padding: EdgeInsets.only(left: 14, right: 14),
                                          ),
                                        ),
                                      )

                                  )
                                ],),

                            ],)

                      ),
                      SizedBox(height: 5,),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height*0.25/6,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(onTap: (){
                              setState(() {
                                repo='All';
                                DashboarController.ReportAll(
                                  dateinput,
                                  dateOutput,
                                  selectedValue,
                                );
                              });
                            },
                              child: Container(
                                width: MediaQuery.of(context).size.width*2.9/6,
                                alignment: Alignment.center,
                                decoration:
                                BoxDecoration(
                                    color: repo=='All'? homeController.bluebackground.value: homeController.white.value,
                                    borderRadius: BorderRadius.circular(7)
                                ),
                                child: Text(
                                  AppLocalizations.of(context)!.all,style: TextStyle(color:  repo=='All'?
                                homeController.white.value:homeController.bluebackground.value,fontSize: 16),
                                ),
                              ),),
                            InkWell(onTap: (){
                              setState(() {
                                repo='Doc';
                                DashboarController.ReportDoctor(
                                    dateinput,
                                    dateOutput,
                                    selectedValue,
                                    selectedValueProduct
                                );
                              });
                            },
                              
                              child: Container(
                                width: MediaQuery.of(context).size.width*2.9/6,
                                alignment: Alignment.center,
                                decoration:
                                BoxDecoration(
                                    color:repo=='Doc'? homeController.bluebackground.value: homeController.white.value,
                                    borderRadius: BorderRadius.circular(7)
                                ),
                                child: Text(
                                  AppLocalizations.of(context)!.user,style: TextStyle(color:repo=='Doc'?
                                homeController.white.value: homeController.bluebackground.value,fontSize: 16),
                                ),
                              ),)
                          ],
                        ),
                      ),

                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 0),
                        child: Column
                          (
                          children: [

                            SizedBox(height: 10,),
                            selectedValue == 'Custom'
                                ? Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(4),
                                          color: homeController.white.value,
                                          border: Border.all(
                                              width: 1,
                                              color: homeController.backgrounds.value)),
                                      width: MediaQuery.of(context).size.width * 5/ 6,
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
                                          suffixIcon: Icon(Icons.arrow_drop_down),
                                          hintText:
                                          dateinput==null? AppLocalizations.of(context)!.date:dateinput.toString(),
                                          hintStyle: TextStyle(fontSize: 12),
                                          enabledBorder: InputBorder.none,
                                        ),
                                        readOnly: true,
                                        onTap: () async {
                                          DateTime? pickedDate =
                                          await showDatePicker(
                                            builder: (context, child) {
                                              return Theme(
                                                data: Theme.of(context).copyWith(
                                                  colorScheme: ColorScheme.light(
                                                    primary: homeController
                                                        .grayborder.value,
                                                    onPrimary:
                                                    homeController.bluebackground.value,
                                                    onSurface: homeController
                                                        .black.value,
                                                  ),
                                                  textTheme: TextTheme(
                                                    subtitle1: TextStyle(
                                                      color: homeController
                                                          .blue2.value,
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
                                            String formattedDate =
                                            DateFormat('yyyy-MM-dd')
                                                .format(pickedDate);
                                            // print(formattedDate);

                                            DateTime parsedDate =
                                            DateFormat('yyyy-MM-dd')
                                                .parse(formattedDate);
                                            setState(() {
                                              dateinput = parsedDate;
                                            });

                                            DashboarController.ReportAll(
                                              dateinput,
                                              dateinput,
                                              selectedValue,
                                            );
                                          } else {
                                            print("Date is not selected");
                                            DashboarController.ReportAll(
                                              dateinput,
                                              dateOutput,
                                              selectedValue,
                                            );
                                          }


                                          setState(() {

                                            DashboarController.ReportAll(
                                              dateinput,
                                              dateOutput,
                                              selectedValue,
                                            );
                                          });
                                        },
                                      ),
                                    ),

                                    Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(4),
                                          color: homeController.white.value,
                                          border: Border.all(
                                              width: 1,
                                              color: homeController.backgrounds.value)),
                                      width: MediaQuery.of(context).size.width * 5/ 6,
                                      height: 50,
                                      child: TextFormField(
                                        validator: (value) {
                                          if (value?.isEmpty == true) {
                                          } else {
                                            return null;
                                          }
                                        },
                                        controller: dateOutputs,
                                        decoration: InputDecoration(
                                          prefixIcon: Icon(
                                            Icons.date_range,
                                            size: 20,
                                          ),
                                          suffixIcon: Icon(Icons.arrow_drop_down),
                                          hintText:
                                          dateOutput==null? AppLocalizations.of(context)!.date:dateOutput.toString(),
                                          hintStyle: TextStyle(fontSize: 12),
                                          enabledBorder: InputBorder.none,
                                        ),
                                        readOnly: true,
                                        onTap: () async {
                                          DateTime? pickedDate =
                                          await showDatePicker(
                                            builder: (context, child) {
                                              return Theme(
                                                data: Theme.of(context).copyWith(
                                                  colorScheme: ColorScheme.light(
                                                    primary: homeController
                                                        .grayborder.value,
                                                    onPrimary:
                                                    homeController.bluebackground.value,
                                                    onSurface: homeController
                                                        .black.value,
                                                  ),
                                                  textTheme: TextTheme(
                                                    subtitle1: TextStyle(
                                                      color: homeController
                                                          .blue2.value,
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
                                            String formattedDate =
                                            DateFormat('yyyy-MM-dd')
                                                .format(pickedDate);
                                            // print(formattedDate);

                                            DateTime parsedDate =
                                            DateFormat('yyyy-MM-dd')
                                                .parse(formattedDate);
                                            setState(() {
                                              dateOutput = parsedDate;
                                            });

                                            DashboarController.ReportAll(
                                              dateinput,
                                              dateOutput,
                                              selectedValue,
                                            );
                                          } else {
                                            print("Date is not selected");
                                            DashboarController.ReportAll(
                                              dateinput,
                                              dateOutput,
                                              selectedValue,
                                            );
                                          }


                                          setState(() {

                                            DashboarController.ReportAll(
                                              dateinput,
                                              dateOutput,
                                              selectedValue,
                                            );
                                          });
                                        },
                                      ),
                                    ),
                                  ],
                                )

                              ],
                            )
                                : Container(),



                            repo ==
                                'Doc'
                                ? Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                        color: homeController.white.value,
                                        border: Border.all(
                                            width: 1,
                                            color: homeController.backgrounds.value)),
                                    width: MediaQuery.of(context).size.width * 5 / 6,
                                    height: 50,
                                    child: DropdownButtonHideUnderline(
                                      child: Obx(
                                            () => DropdownButton2<String>(
                                          isExpanded: true,
                                          hint: Row(
                                            children: [
                                              SizedBox(
                                                width: 4,
                                              ),
                                              Expanded(
                                                child: Text(
                                                  AppLocalizations.of(context)!
                                                      .product,
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                  ),
                                                  overflow:
                                                  TextOverflow.ellipsis,
                                                ),
                                              ),
                                            ],
                                          ),
                                          items: DashboarController.ItemDoctors.map(
                                                (Doctor) => DropdownMenuItem<String>(
                                              value: Doctor.doctor_id.toString(),
                                              child: Text(
                                                Doctor.doctor_name!,
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                ),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ).toList(),
                                          value: selectedValueProduct == ''
                                              ? selectedValueProduct
                                              : null,
                                          onChanged: (String? value) {
                                            setState(() {
                                              selectedValueProduct = value!;
                                              DashboarController.ReportDoctor(
                                                  dateinput,
                                                  dateOutput,
                                                  selectedValue,
                                                  selectedValueProduct
                                              );

                                              dateOutputs.clear();
                                              dateinputs.clear();
                                            });
                                          },
                                          buttonStyleData: ButtonStyleData(
                                            height: 50,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width *
                                                2 /
                                                6,
                                            padding: const EdgeInsets.only(
                                                left: 14, right: 14),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(4),
                                              color: homeController.white.value,
                                              border: Border.all(
                                                width: 1,
                                                color: homeController
                                                    .backgrawnd.value,
                                              ),
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
                                            width: MediaQuery.of(context)
                                                .size
                                                .width *
                                                2 /
                                                6,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(4),
                                            ),
                                            offset: const Offset(-0, 0),
                                            scrollbarTheme: ScrollbarThemeData(
                                              radius: const Radius.circular(4),
                                              thickness: MaterialStateProperty
                                                  .all<double>(6),
                                              thumbVisibility:
                                              MaterialStateProperty.all<
                                                  bool>(true),
                                            ),
                                          ),
                                          menuItemStyleData:
                                          const MenuItemStyleData(
                                            height: 40,
                                            padding: EdgeInsets.only(
                                                left: 14, right: 14),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),

                                ])
                                : Container(),

                            SizedBox(
                              height: 30,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width * 1.5/ 6,
                                  child: Text(
                                    AppLocalizations.of(context)!.performance,
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: homeController.grayborder.value),
                                  ),
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width * 0.02 / 6,
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 6),
                                  width: MediaQuery.of(context).size.width * 2.8 / 6,
                                  height: 1,
                                  color: homeController.graybuton.value,
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width * 0.05 / 6,
                                ),

                                SizedBox(
                                  width: MediaQuery.of(context).size.width * 0.1 / 6,
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width * 1 / 6,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(repo.toString(),style: TextStyle(color: homeController.graytext.value,fontSize: 14),)
                                    ],
                                  ),
                                )
                              ],
                            ),
                            /// cards
                            SizedBox(
                              height: 30,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(5),
                                  width: MediaQuery.of(context).size.width * 2.8 / 6,
                                  height: 100,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'total paid' ,
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                                color: homeController.black.value),
                                          ),
                                          Container(
                                            width: 30,
                                            height: 30,
                                            child: Image.asset('assets/range.png'),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 2,
                                      ),
                                      SizedBox(
                                        height: 2,
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                         Obx(() =>  Text(
                    '1001'+
                                           // DashboarController.reportss[0]!.total_paid==null?'0':    DashboarController.reportss[0]!.total_paid!.toString() +
                                               AppLocalizations.of(context)!.dolar,
                                           style: TextStyle(
                                               fontSize: 12,
                                               fontWeight: FontWeight.w400,
                                               color: homeController.grayborder.value),
                                         ),)
                                        ],
                                      )
                                    ],
                                  ),
                                  decoration: BoxDecoration(
                                    color: homeController.white.value,
                                    boxShadow: [
                                      BoxShadow(
                                        color: homeController.grayborder.value,
                                        blurRadius: 0.7, // soften the shadow
                                        offset: Offset(
                                          0.00, // Move to right 5  horizontally
                                          1, // Move to bottom 5 Vertically
                                        ),
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(5),
                                  width: MediaQuery.of(context).size.width * 2.8/ 6,
                                  height: 100,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Total Appointment',
                                            style: TextStyle(
                                                fontSize: 14,

                                                fontWeight: FontWeight.w400,
                                                color: homeController.black.value),
                                          ),
                                          Container(
                                            width: 30,
                                            height: 30,
                                            child: Image.asset('assets/range.png'),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 2,
                                      ),
                                      SizedBox(
                                        height: 2,
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                        Obx(() =>  Text(
                                          '12',
                                          // DashboarController.reportss![0].total_appointment==null?'0':        DashboarController.reportss![0].total_appointment!.toString() ,
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                              color: homeController.grayborder.value),
                                        ),)
                                        ],
                                      )
                                    ],
                                  ),
                                  decoration: BoxDecoration(
                                    color: homeController.white.value,
                                    boxShadow: [
                                      BoxShadow(
                                        color: homeController.grayborder.value,
                                        blurRadius: 0.7, // soften the shadow
                                        offset: Offset(
                                          0.00, // Move to right 5  horizontally
                                          1, // Move to bottom 5 Vertically
                                        ),
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),

                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,

                              children: [
                                Container(
                                  padding: EdgeInsets.all(5),
                                  width: MediaQuery.of(context).size.width * 2.8 / 6,
                                  height: 100,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'total equipment used',
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                                color: homeController.black.value),
                                          ),
                                          Container(
                                            width: 30,
                                            height: 30,
                                            child: Image.asset('assets/range.png'),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 2,
                                      ),
                                      SizedBox(
                                        height: 2,
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                         Obx(() =>  Text(
                                           '3232',
                                           // DashboarController.reportss![0].total_equipment_used==null?'0':     DashboarController.reportss![0].total_equipment_used!.toString()  ,
                                           style: TextStyle(
                                               fontSize: 12,
                                               fontWeight: FontWeight.w400,
                                               color: homeController.grayborder.value),
                                         ),)
                                        ],
                                      )
                                    ],
                                  ),
                                  decoration: BoxDecoration(
                                    color: homeController.white.value,
                                    boxShadow: [
                                      BoxShadow(
                                        color: homeController.grayborder.value,
                                        blurRadius: 0.7, // soften the shadow
                                        offset: Offset(
                                          0.00, // Move to right 5  horizontally
                                          1, // Move to bottom 5 Vertically
                                        ),
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(5),
                                  width: MediaQuery.of(context).size.width * 2.8 / 6,
                                  height: 100,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'total loan',
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                                color: homeController.black.value),
                                          ),
                                          Container(
                                            width: 30,
                                            height: 30,
                                            child: Image.asset('assets/range.png'),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 2,
                                      ),
                                      SizedBox(
                                        height: 2,
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Obx(() => Text(
                                            '234',
                                            // DashboarController.reportss![0].total_loan==null?'0':       DashboarController.reportss![0].total_loan.toString() ,
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400,
                                                color: homeController.grayborder.value),
                                          ),)
                                        ],
                                      )
                                    ],
                                  ),
                                  decoration: BoxDecoration(
                                    color: homeController.white.value,
                                    boxShadow: [
                                      BoxShadow(
                                        color: homeController.grayborder.value,
                                        blurRadius: 0.7, // soften the shadow
                                        offset: Offset(
                                          0.00, // Move to right 5  horizontally
                                          1, // Move to bottom 5 Vertically
                                        ),
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 50,
                            ),
                            /// divider
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child: Text(
                                    AppLocalizations.of(context)!.chart,
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: homeController.grayborder.value),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 6),
                                  width: MediaQuery.of(context).size.width * 3 / 6,
                                  height: 1,
                                  color: homeController.graybuton.value,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 30,
                            ),

                            // charts
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [

                                Container(
                                  decoration: BoxDecoration(
                                      color: homeController.white.value,
                                      borderRadius: BorderRadius.circular(8)),
                                  width: MediaQuery.of(context).size.width * 5 / 6,

                                  height: 390,
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 10, vertical: 10),
                                            child: Text(
                                              'Average',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400,
                                                  color: homeController.grayborder.value),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.symmetric(horizontal: 10),

                                          ),
                                        ],
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 15),
                                        width: MediaQuery.of(context).size.width * 0.3 / 6,
                                        height: 1,
                                        color: homeController.backgrawnd.value,
                                      ),
                                      Row(
                                        children: [
                                         Obx(() =>  Container(
                                           width: MediaQuery.of(context).size.width * 5 / 6,
                                           child: SfCartesianChart(
                                             primaryXAxis: CategoryAxis(), // Use CategoryAxis for string labels
                                             series: <LineSeries<SalesData, String>>[ // Use LineSeries
                                               LineSeries<SalesData, String>(
                                                 pointColorMapper: (SalesData sales, _) {
                                                   if (sales.year == 'Jan') {
                                                     return homeController.bluebackground.value;
                                                   } else if (sales.year == 'Feb') {
                                                     return homeController.blue2.value;
                                                   }
                                                   return homeController.bluebackground.value;
                                                 },
                                                 // Bind data source
                                                 dataSource: DashboarController.reportss[0].monthlyReport.map((report) {
                                                   return SalesData(report.month, report.total_amount);
                                                 }).toList(),
                                                 xValueMapper: (SalesData sales, _) => sales.year,
                                                 yValueMapper: (SalesData sales, _) => sales.sales,
                                               ),
                                             ],
                                           ),
                                         ))

                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )));
  }
}

class SalesData {
  SalesData(this.year, this.sales);
  final String year;
  final double sales;
}