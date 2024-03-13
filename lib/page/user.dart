 import 'dart:ui';
 import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
  import '../controler/authuser.dart';
import '../controler/color.dart';

class UserPage extends StatefulWidget {
  @override
  UserPages createState() => UserPages();
}
class UserPages extends   State<UserPage> {
  final homeController = Get.put(homeControler());
  final _formKey = GlobalKey<FormState>();
  final TextEditingController Note = TextEditingController();
  final controller = PageController(viewportFraction: 0.8, keepPage: true);
  final TextEditingController _price = TextEditingController();
   final TextEditingController _password = TextEditingController();
  final TextEditingController _userName = TextEditingController();
  final _formKey2 = GlobalKey<FormState>();
  final TextEditingController catagoryName = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController controllers = TextEditingController();
  final UserAddController _loginController = Get.put(UserAddController());
  final TextEditingController _userphone = TextEditingController();
  final TextEditingController _passwordConfirm = TextEditingController();
  final TextEditingController _email = TextEditingController();

  String? passwordConfirm;
  String? userphone;
  var scaffoldKey = GlobalKey<ScaffoldState>();
  int number = 0;
  var colorchanage;
  String Notes = "";
  String? selectedValue;
  String? selectedValue2='1';
  String? userName;
  String? prices;
  String? password;
  PageController pageController = PageController(initialPage: 0);
  int selectedPageIndex = 0;
  int selectedPageIndex2 = 0;
   String catagoryNames = "";
  @override
  var id;
  String? email;
  bool _isObscure = true;
  bool bor = true;

  List<int> selectedIndices = [];
List user=[1,2,3,4,4];
  showAlertDialog(context) {
    final List<String> items = [
      'Receptionist',
      'Staff_member',
      'Manager',
      'Doctor',
    ];

    showDialog(
      context: context,
      builder: (context) {
        return   StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return  AlertDialog(
                scrollable: true,
                shadowColor: homeController.bluebackground.value,
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
                    width: MediaQuery.of(context).size.width,
                    height: 580,
                    child: Container(
                      child: Form(
                        key: formKey,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 0),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(""),
                                    Text(
                                      'Add Doctor / User' ,
                                      style:
                                      TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        icon: const Icon(Icons.close))
                                  ],
                                ),
                                const Divider(
                                  endIndent: 0,
                                  indent: 0,
                                  thickness: 1.5,
                                ),

                                Container(
                                    padding: EdgeInsets.symmetric(horizontal: 10),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                        color: homeController.white.value,
                                        border: Border.all(
                                            width: 1,
                                            color: homeController.graybuton.value)),
                                    width: MediaQuery.of(context).size.height * 1,
                                    height: 50,
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
                                          hintText: AppLocalizations.of(context)!.name,
                                          hintStyle: TextStyle(fontSize: 12),
                                          enabledBorder: InputBorder.none,
                                          focusedBorder: InputBorder.none),
                                    )),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                    padding: EdgeInsets.symmetric(horizontal: 10),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                        color: homeController.white.value,
                                        border: Border.all(
                                            width: 1,
                                            color: homeController.graybuton.value)),
                                    width: MediaQuery.of(context).size.height * 1,
                                    height: 50,
                                    child: TextFormField(
                                      controller: Note,
                                      onChanged: (text) {
                                        Notes = text;
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
                                          hintText: 'Medical specialty',
                                          hintStyle: TextStyle(fontSize: 12),
                                          enabledBorder: InputBorder.none,
                                          focusedBorder: InputBorder.none),
                                    )),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                    padding: EdgeInsets.symmetric(horizontal: 10),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                        color: homeController.white.value,
                                        border: Border.all(
                                            width: 1,
                                            color: homeController.graybuton.value)),
                                    width: MediaQuery.of(context).size.height * 1,
                                    height: 50,
                                    child: TextFormField(
                                      controller: _userphone,
                                      onChanged: (text) {
                                        userphone = text;
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
                                          hintText: AppLocalizations.of(context)!.phone,
                                          hintStyle: TextStyle(fontSize: 12),
                                          enabledBorder: InputBorder.none,
                                          focusedBorder: InputBorder.none),
                                    )),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  width: MediaQuery.of(context).size.height * 1,
                                  height: 50,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      color: homeController.white.value,
                                      border: Border.all(
                                          width: 1,
                                          color: homeController.graybuton.value)),
                                  child: TextFormField(
                                    controller: _email,
                                    onChanged: (text) {
                                      email = text;
                                    },
                                    validator: (value) {
                                      if (value == '') {
                                        return 'Enter your email address';
                                      } else if (!RegExp("^[a-zA-z0-9+_.-]+.[a-z]")
                                          .hasMatch(value!)) {
                                        return 'Enter email';
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintText:  AppLocalizations.of(context)!.email,
                                        hintStyle: TextStyle(fontSize: 12),
                                        enabledBorder: InputBorder.none,
                                        focusedBorder: InputBorder.none),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      color: homeController.white.value,
                                      border: Border.all(
                                          width: 1,
                                          color: homeController.graybuton.value)),
                                  width: MediaQuery.of(context).size.height * 1,
                                  height: 50,
                                  child: TextFormField(
                                    obscureText: _isObscure,
                                    controller: _password,
                                    onChanged: (text) {
                                      password = text;
                                    },
                                    validator: (value) {
                                      if (value == '') {
                                        return 'Enter your Password';
                                      } else if (value!.length < 8) {
                                        return 'Must be more than 8 characters';
                                      } else {
                                        return null;
                                      }
                                    },
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        enabledBorder: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        hintText: AppLocalizations.of(context)!.password,
                                        hintStyle: const TextStyle(fontSize: 12),
                                        suffixIcon: IconButton(
                                          icon: Icon(
                                            _isObscure
                                                ? Icons.visibility
                                                : Icons.visibility_off,
                                            size: 18,
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              _isObscure = !_isObscure;
                                            });
                                          },
                                        )),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      color: homeController.white.value,
                                      border: Border.all(
                                          width: 1,
                                          color: homeController.graybuton.value)),
                                  width: MediaQuery.of(context).size.width * 1,
                                  height: 50,
                                  child: TextFormField(
                                    controller: _passwordConfirm,
                                    onChanged: (text) {
                                      passwordConfirm = text;
                                    },
                                    validator: (value) {
                                      if (value?.length == 0) {
                                        return 'Retype the password';
                                      } else if (_passwordConfirm.text != _password.text) {
                                        return 'not same';
                                      } else {
                                        return null;
                                      }
                                    },
                                    decoration: InputDecoration(
                                        border: const OutlineInputBorder(),
                                        hintText: AppLocalizations.of(context)!.confirmpassword,
                                        hintStyle: const TextStyle(fontSize: 12),
                                        enabledBorder: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        suffixIcon: IconButton(
                                          icon: Icon(
                                            _isObscure
                                                ? Icons.visibility
                                                : Icons.visibility_off,
                                            size: 18,
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              _isObscure = !_isObscure;
                                            });
                                          },
                                        )),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  width: 498,
                                  height: 45,
                                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: homeController.white.value,
                                      border: Border.all(
                                          width: 1,
                                          color: homeController.graybuton.value)),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton<String>(
                                      isExpanded: true,
                                      hint: Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              selectedValue==null?'Permission':selectedValue.toString()  ,
                                              style: TextStyle(
                                                color: homeController.grayborder.value,
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
                                          selectedValue = value;
                                        });
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
                                const SizedBox(
                                  height: 50,
                                ),
                                Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                                  SizedBox(
                                    height: 40,
                                    child: ElevatedButton(
                                      onPressed: () async {
                                        // await _loginController.addUserDoctor(userName!,userphone!,password!, email , Notes! ,selectedValue!).then((value) =>
                                        // {
                                        //  });

                                        setState((){
                                          _userName.clear();
                                          _userphone.clear();
                                          _password.clear();
                                          _passwordConfirm.clear();
                                          Note.clear();
                                          _email.clear();
                                          selectedValue == '';
                                          // _loginController.fetchDatadoctors(1);


                                        });
                                        // _userController.error.value = '';
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: homeController.bluebackground.value,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(4),
                                        ),
                                      ),
                                      child: Text(
                                        'Add',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  SizedBox(
                                    height: 40,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: homeController.graybuton.value,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(4),
                                            side: BorderSide(color: homeController.bluebackground.value),
                                          )),
                                      child: Text(
                                        AppLocalizations.of(context)!.cancle,
                                        style: TextStyle(color: homeController.bluebackground.value),
                                      ),
                                    ),
                                  ),
                                ])
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ]),
                actions: [],
              );});
      },
    );
  }

  showAlertDialogEdit(context) {
    final List<String> items = [
      'Manager',
      'Doctor',
      'Receptionist',
      'Staff_member',
    ];

    showDialog(
      context: context,
      builder: (context) {
        return   StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return AlertDialog(
                scrollable: true,
                shadowColor: homeController.bluebackground.value,
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
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height*4.3/6,
                    child: Container(
                      child: Form(
                        key: formKey,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 0),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(""),
                                    Text(
                                      'Edit Doctor / user',
                                      style:
                                      TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        icon: const Icon(Icons.close))
                                  ],
                                ),
                                const Divider(
                                  endIndent: 0,
                                  indent: 0,
                                  thickness: 1.5,
                                ),

                                Container(
                                    padding: EdgeInsets.symmetric(horizontal: 10),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                        color: homeController.white.value,
                                        border: Border.all(
                                            width: 1,
                                            color: homeController.graybuton.value)),
                                    width: MediaQuery.of(context).size.height * 1,
                                    height: 50,
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
                                          hintText:userName==null? AppLocalizations.of(context)!.name:userName.toString(),
                                          hintStyle: TextStyle(fontSize: 12),
                                          enabledBorder: InputBorder.none,
                                          focusedBorder: InputBorder.none),
                                    )),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                    padding: EdgeInsets.symmetric(horizontal: 10),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                        color: homeController.white.value,
                                        border: Border.all(
                                            width: 1,
                                            color: homeController.graybuton.value)),
                                    width: MediaQuery.of(context).size.height * 1,
                                    height: 50,
                                    child: TextFormField(
                                      controller: Note,
                                      onChanged: (text) {
                                        Notes = text;
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
                                          hintText: Notes==null?'Medical specialty':Notes.toString(),
                                          hintStyle: TextStyle(fontSize: 12),
                                          enabledBorder: InputBorder.none,
                                          focusedBorder: InputBorder.none),
                                    )),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                    padding: EdgeInsets.symmetric(horizontal: 10),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                        color: homeController.white.value,
                                        border: Border.all(
                                            width: 1,
                                            color: homeController.graybuton.value)),
                                    width: MediaQuery.of(context).size.height * 1,
                                    height: 50,
                                    child: TextFormField(
                                      controller: _userphone,
                                      onChanged: (text) {
                                        userphone = text;
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
                                          hintText:userphone==null? AppLocalizations.of(context)!.phone: userphone.toString(),
                                          hintStyle: TextStyle(fontSize: 12),
                                          enabledBorder: InputBorder.none,
                                          focusedBorder: InputBorder.none),
                                    )),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  width: MediaQuery.of(context).size.height * 1,
                                  height: 50,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      color: homeController.white.value,
                                      border: Border.all(
                                          width: 1,
                                          color: homeController.graybuton.value)),
                                  child: TextFormField(
                                    controller: _email,
                                    onChanged: (text) {
                                      email = text;
                                    },
                                    validator: (value) {
                                      if (value == '') {
                                        return 'Enter your email address';
                                      } else if (!RegExp("^[a-zA-z0-9+_.-]+.[a-z]")
                                          .hasMatch(value!)) {
                                        return 'Enter email';
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintText:email == null? 'Email':email.toString(),
                                        hintStyle: TextStyle(fontSize: 12),
                                        enabledBorder: InputBorder.none,
                                        focusedBorder: InputBorder.none),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      color: homeController.white.value,
                                      border: Border.all(
                                          width: 1,
                                          color: homeController.graybuton.value)),
                                  width: MediaQuery.of(context).size.height * 1,
                                  height: 50,
                                  child: TextFormField(
                                    obscureText: _isObscure,
                                    controller: _password,
                                    onChanged: (text) {
                                      password = text;
                                    },
                                    validator: (value) {
                                      if (value == '') {
                                        return 'Enter your Password';
                                      } else if (value!.length < 8) {
                                        return 'Must be more than 8 characters';
                                      } else {
                                        return null;
                                      }
                                    },
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        enabledBorder: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        hintText: AppLocalizations.of(context)!.password,
                                        hintStyle: const TextStyle(fontSize: 12),
                                        suffixIcon: IconButton(
                                          icon: Icon(
                                            _isObscure
                                                ? Icons.visibility
                                                : Icons.visibility_off,
                                            size: 18,
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              _isObscure = !_isObscure;
                                            });
                                          },
                                        )),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      color: homeController.white.value,
                                      border: Border.all(
                                          width: 1,
                                          color: homeController.graybuton.value)),
                                  width: MediaQuery.of(context).size.width * 1,
                                  height: 50,
                                  child: TextFormField(
                                    controller: _passwordConfirm,
                                    onChanged: (text) {
                                      passwordConfirm = text;
                                    },
                                    validator: (value) {
                                      if (value?.length == 0) {
                                        return 'Retype the password';
                                      } else if (_passwordConfirm.text != _password.text) {
                                        return 'not same';
                                      } else {
                                        return null;
                                      }
                                    },
                                    decoration: InputDecoration(
                                        border: const OutlineInputBorder(),
                                        hintText: AppLocalizations.of(context)!.confirmpassword,
                                        hintStyle: const TextStyle(fontSize: 12),
                                        enabledBorder: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        suffixIcon: IconButton(
                                          icon: Icon(
                                            _isObscure
                                                ? Icons.visibility
                                                : Icons.visibility_off,
                                            size: 18,
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              _isObscure = !_isObscure;
                                            });
                                          },
                                        )),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  width: 498,
                                  height: 45,
                                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: homeController.white.value,
                                      border: Border.all(
                                          width: 1,
                                          color: homeController.graybuton.value)),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton<String>(
                                      isExpanded: true,
                                      hint: Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              selectedValue==null?'Permission':selectedValue.toString()  ,
                                              style: TextStyle(
                                                color: homeController.grayborder.value,
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
                                          selectedValue = value;
                                        });
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
                                const SizedBox(
                                  height: 50,
                                ),
                                Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                                  SizedBox(
                                    height: 40,
                                    child: ElevatedButton(
                                      onPressed: () async {
                                        // await _loginController.updateDatadoc(userName!,userphone!
                                        //     ,password!, email,Notes!,selectedValue!,id!).then((value) =>
                                        // {
                                        //   _loginController.fetchDatadoctors(1)
                                        // });

                                        setState((){
                                          _userName.clear();
                                          userName='';
                                          userphone='';
                                          email='';
                                          Notes='';
                                          Note.clear();
                                          _userphone.clear();
                                          _password.clear();
                                          _passwordConfirm.clear();
                                          _email.clear();
                                          selectedValue == '';
                                          // _loginController.fetchData(1);


                                        });
                                        // _userController.error.value = '';
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: homeController.bluebackground.value,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(4),
                                        ),
                                      ),
                                      child: Text(
                                        'Edit',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  SizedBox(
                                    height: 40,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: homeController.graybuton.value,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(4),
                                            side: BorderSide(color: homeController.bluebackground.value),
                                          )),
                                      child: Text(
                                        AppLocalizations.of(context)!.cancle,
                                        style: TextStyle(color: homeController.bluebackground.value),
                                      ),
                                    ),
                                  ),
                                ])
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ]),
                actions: [],
              );});
      },
    );
  }



  @override
  void initState() {
    // TODO: implement initState
    // _userController.error.value = '';
    // _userController.message.value = '';
    // _loginController.message.value='';
    // _loginController.fetchData(1);

  }
  List itemsBrands = [
    1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,38,39,40
  ];
  @override
  Widget build(BuildContext context) {
    var list = [
      '',
      AppLocalizations.of(context)!.delete,
      AppLocalizations.of(context)!.edit,
    ];
    String dropdownValue = list.first;
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
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [

                                    SizedBox(  width: MediaQuery.of(context).size.width *
                                        0.01/
                                        6,),
                                    InkWell(onTap: () async{

                                      await         showAlertDialog(context);

                                    },
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
                                    InkWell(onTap: () async{

                                      await         showAlertDialog(context);

                                    },
                                      child:
                                      Image.asset('assets/plus.png',width: 60,height:60,),
                                    )
                                  ],),

                              ],)

                        ),
                        SizedBox(  height: MediaQuery.of(context).size.height *
                            0.2/
                            6,),
                        Container(
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
                            itemCount: user.length,
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
                                          Text('Sima S Latiff',style: TextStyle(
                                              color: homeController.white.value,
                                              fontSize: 15
                                          ),),
                                          Text('Test',style: TextStyle(
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
                                                  Text(AppLocalizations.of(context)!.phone+' : ',style: TextStyle(
                                                      color: homeController.graytext.value,
                                                      fontSize: 15
                                                  ),),
                                                  SizedBox(width: 7,),
                                                  Text('07703597983',style: TextStyle(
                                                      color: homeController.bluebackground.value,
                                                      fontSize: 14
                                                  ),)
                                                ],
                                              ),
                                              InkWell(child: Image.asset('assets/edt.png',width: 20,height: 20,),onTap: (){
                                                setState(() {
                                                  // id='1'!;
                                                  // userName='sima';
                                                  // userphone='07701112233';
                                                  // email='Sima.Sleman2000@gmail.com';
                                                  // Notes='test Project';
                                                  // selectedValue='Admin';

                                                  // showAlertDialogEdit(context);
                                                });
                                              },),
                                            ],
                                          ),
                                          SizedBox(height: 9,),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  Text('medical specialty'+' : ',style: TextStyle(
                                                      color: homeController.graytext.value,
                                                      fontSize: 15
                                                  ),),
                                                  SizedBox(width: 7,),
                                                  Text('Programmer'==null?'': 'Programmer',style: TextStyle(
                                                      color: homeController.bluebackground.value,
                                                      fontSize: 14
                                                  ),)
                                                ],
                                              ),

                                              InkWell(child: Image.asset('assets/delet.png',width: 20,height: 18,),onTap: (){
                                                // _loginController.userdeactivedoctor(supplierA.id!);
                                                // _loginController.fetchDatadoctors(1);

                                              },),
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
                        )
                      ],
                    ),
                  ),
                ))));
  }
}
