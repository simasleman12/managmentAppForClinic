import 'dart:ui';


import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../backConnection/authuser.dart';
import '../backConnection/cashrigester.dart';
import '../controler/color.dart';

class LogPage extends StatefulWidget {
  @override
  logs createState() => logs();
}

class logs extends State<LogPage> {
  final homeController = Get.put(homeControler());
  final cashControler _cash = Get.put(cashControler());
  final controller = PageController(viewportFraction: 0.8, keepPage: true);
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _Supliername = TextEditingController();
  final TextEditingController _Contactpersonname = TextEditingController();
  final TextEditingController _Contactpersonname2 = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _email2 = TextEditingController();
  final TextEditingController _address = TextEditingController();
  final TextEditingController _address2 = TextEditingController();
  final TextEditingController _city = TextEditingController();
  final TextEditingController _country = TextEditingController();
  final TextEditingController _note = TextEditingController();
  final TextEditingController _provence = TextEditingController();

  PageController pageController = PageController(initialPage: 0);
  int selectedPageIndex = 0;
  int selectedPageIndex2 = 0;
  int numberPage = 10;
  int itemCount = 40;
  int currentPageIndex = 0;
  String? selectedValue;
  bool productPage = true;
  bool withdraw = true;
  bool deposit = true;
  String? selectedValue2;
  bool showEdit = true;
  bool deletHover = true;
  bool editHover = true;
  bool vewidetailHover = true;
  String Supliername = "";
  String Contactpersonname = "";
  String Contactpersonname2 = "";
  String userphone = "";
  String userphone2 = "";
  String email = "";
  String email2 = "";
  String address = "";
  String address2 = "";
  String city = "";
  String country = "";
  String note = "";
  String provence = "";
  var id;

  List logsss = [
    1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,38,39,40
  ];
  @override
  void initState() {
// TODO: implement initState

  _cash.fetchLog(1);

   }

  @override
  Widget build(BuildContext context) {
    var list = [
      '',
      AppLocalizations.of(context)!.delete,
      AppLocalizations.of(context)!.edit,
      AppLocalizations.of(context)!.viwedetail
    ];
     final pages = List.generate(
        6,
        (index) => Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.grey.shade300,
              ),
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              child: Container(
                height: 280,
                child: Center(
                    child: Text(
                  "Page $index",
                  style: TextStyle(color: Colors.indigo),
                )),
              ),
            ));
    return MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        child: SafeArea(
            child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 1, vertical: 0),
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
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [

                                    SizedBox(  width: MediaQuery.of(context).size.width *
                                        0.01/
                                        6,),
                                    InkWell(
                                      child:
                                      Image.asset('assets/user.png',width: 60,height:60,),
                                    )
                                  ],),


                              ],)

                        ),
                        SizedBox(  height: MediaQuery.of(context).size.height *
                            0.2/
                            6,),
                        Obx(() =>   Container(
                          width: MediaQuery.of(context)
                              .size
                              .width *
                              5.5 /
                              6,

                          height: MediaQuery.of(context)
                              .size
                              .height
                          ,
                          // Replace with your desired height
                          child: ListView.builder(
                            controller: controller,
                            itemCount: logsss.length,
                            itemBuilder:
                                (context, index) {


                              Color backgroundColor =
                              index % 2 == 0
                                  ? homeController
                                  .backgrawnd
                                  .value
                                  : homeController
                                  .white.value;

                              return Container(
                                width:
                                MediaQuery.of(context)
                                    .size
                                    .width *
                                    4.5 /
                                    6,
                                margin: EdgeInsets.symmetric(vertical: 7),
                                height:
                                MediaQuery.of(context)
                                    .size
                                    .height *
                                    1 /
                                    6,


                                decoration: BoxDecoration(
                                    color:
                                    homeController.backgrawnd2.value,
                                    borderRadius: BorderRadius.circular(6)),
                                child: Column(
                                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [

                                    Container(
                                      height: MediaQuery.of(context).size.height*0.4/6,
                                      padding: EdgeInsets.symmetric(horizontal: 5),
                                      decoration: BoxDecoration(
                                          color: homeController.bluebackground.value,
                                          borderRadius: BorderRadius.only(  topLeft: Radius.circular(7),
                                            topRight: Radius.circular(7),
                                          )
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('Sima',style: TextStyle(
                                              color: homeController.white.value,
                                              fontSize: 15
                                          ),),
                                          Text('12/11/2023',style: TextStyle(
                                              color: homeController.white.value,
                                              fontSize: 14
                                          ),)
                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.symmetric(horizontal: 7),
                                      child: Column(

                                        children: [
                                          SizedBox(height: 7,),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  Text(AppLocalizations.of(context)!.action+' : ',style: TextStyle(
                                                      color: homeController.graytext.value,
                                                      fontSize: 15
                                                  ),),
                                                  SizedBox(width: 7,),
                                                  Text('Login the System !!!!',style: TextStyle(
                                                      color: homeController.bluebackground.value,
                                                      fontSize: 14
                                                  ),)
                                                ],
                                              ),
                                             ],
                                          ),
                                          SizedBox(height: 9,),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  Text(AppLocalizations.of(context)!.message+' : ',style: TextStyle(
                                                      color: homeController.graytext.value,
                                                      fontSize: 15
                                                  ),),
                                                  SizedBox(width: 7,),
                                                  Text('Messages',style: TextStyle(
                                                      color: homeController.bluebackground.value,
                                                      fontSize: 14
                                                  ),)
                                                ],
                                              ),

                                             ],
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                )
                                ,

                              );
                            },
                          ),
                        )),
                      ],
                    ),
                  ),
                ))));
  }
}
