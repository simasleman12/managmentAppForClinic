import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import '../backConnection/authLogin.dart';
 import '../controler/color.dart';
import '../language/language.dart';
import '../main.dart';
import '../nav/buttonNav.dart';

class login extends StatelessWidget {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final homeController = Get.put(homeControler());
  String? lang;
  String? email;
  String? password;
  final _formKey = GlobalKey<FormState>();
  final LoginController _loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        child: SafeArea(
            child: Scaffold(
                backgroundColor: homeController.bluebackground.value,
                body: SingleChildScrollView(
                  child:  Form(
                    key: _formKey,
                    child: Padding(
                        padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                        child:Container(
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width *6/6,
                          child:  Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              /// changelanguage
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(width: MediaQuery.of(context).size.width*0.1/4,),

                                  Container(

                                    width:
                                    MediaQuery.of(context).size.width * 0.7 / 6,
                                    padding: EdgeInsets.all(1),
                                    decoration: BoxDecoration(
                                      // border: Border.all(
                                      //     width: 1,
                                      //     color: homeController.white.value),
                                        borderRadius: BorderRadius.circular(8)),
                                    child:  DropdownButton<Language>(
                                      dropdownColor:
                                      homeController.white.value,
                                      focusColor:
                                      homeController.white.value,
                                      underline: SizedBox(),
                                      icon: Icon(
                                        Icons.language,
                                        color:
                                        homeController.white.value,
                                      ),
                                      onChanged: (Language? language) {
                                        // print(language!.languageCode);
                                        //
                                        // _loginController.setLanguage(
                                        //     language!.languageCode);

                                        print(lang);
                                        if (language != null) {
                                          MyApp.setLocale(
                                              context,
                                              Locale(
                                                  language.languageCode,
                                                  ''));
                                        }
                                      },
                                      items: Language.languageList()
                                          .map(
                                            (e) => DropdownMenuItem<
                                            Language>(
                                          value: e,
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment
                                                .spaceBetween,
                                            children: <Widget>[

                                              Text(
                                                e.languageCode,
                                                style: TextStyle(
                                                    fontSize: 14),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                          .toList(),
                                    ),)
                                ],
                              ),
                              Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                                ///logo
                                Container(
                                  width: MediaQuery.of(context).size.width * 3 / 6,
                                  child: Image.asset('assets/clinic.png'),
                                ),
                                ///form
                                Column(children: [
                                  ///divider
                                  Container(
                                    width: MediaQuery.of(context).size.width * 4.5 / 6,
                                    alignment: Alignment.center,
                                    child:  Divider(height: 2,color: homeController.white.value,),),
                                  ///input
                                  Container(
                                    width: MediaQuery.of(context).size.width * 5 / 6,
                                    padding: EdgeInsets.only(top: 15,bottom: 20),
                                    margin: EdgeInsets.only(top: 15),
                                    decoration: BoxDecoration(
                                      // color: homeController.backgrawnd.value,
                                        borderRadius: BorderRadius.circular(10)),
                                    child: Column(
                                      children: [

                                        /// part three
                                        Container(
                                          width: MediaQuery.of(context).size.width,

                                          padding: EdgeInsets.symmetric(
                                              vertical: 10),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(8),
                                            // color: homeController.backgrawnd.value
                                          ),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                padding:
                                                EdgeInsets.symmetric(horizontal: 6),
                                                margin: EdgeInsets.symmetric(
                                                    horizontal: 18, vertical: 12),
                                                child: TextFormField(
                                                  controller: _email,
                                                  keyboardType: TextInputType.phone,
                                                  decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    focusedBorder: InputBorder.none,
                                                    enabledBorder: InputBorder.none,
                                                    disabledBorder: InputBorder.none,
                                                    errorBorder: InputBorder.none,
                                                    // icon: Icon(
                                                    //   Icons.email,
                                                    //   color: homeController.grayborder.value,
                                                    // ),
                                                    labelText: AppLocalizations.of(
                                                        context as BuildContext)!
                                                        .phone,
                                                  ),
                                                  onChanged: (text) {
                                                    email = text;
                                                  },
                                                ),
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: homeController
                                                            .grayborder.value,
                                                        width: 0.5),
                                                    borderRadius:
                                                    BorderRadius.circular(10),
                                                    color: Colors.white),
                                              ),
                                              Container(
                                                padding:
                                                EdgeInsets.symmetric(horizontal: 6),
                                                margin: EdgeInsets.symmetric(
                                                    horizontal: 18, vertical: 12),
                                                child: TextFormField(
                                                  keyboardType:
                                                  TextInputType.visiblePassword,
                                                  controller: _password,

                                                  decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    focusedBorder: InputBorder.none,
                                                    enabledBorder: InputBorder.none,
                                                    disabledBorder: InputBorder.none,
                                                    errorBorder: InputBorder.none,
                                                    // icon: Icon(
                                                    //   Icons.lock_outline,
                                                    //   color: homeController.grayborder.value,
                                                    // ),
                                                    labelText:
                                                    AppLocalizations.of(context)!
                                                        .password,
                                                  ),
                                                  validator: (text) {},
                                                  onChanged: (text) {
                                                    password = text;
                                                  },
                                                  obscuringCharacter:
                                                  '*', // defaults to *
                                                  obscureText: true,
                                                ),
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: homeController
                                                            .grayborder.value,
                                                        width: 0.5),
                                                    borderRadius:
                                                    BorderRadius.circular(10),
                                                    color: Colors.white),
                                              ),
                                              Center(
                                                  child: Container(
                                                    width: MediaQuery.of(context).size.width * 4.5 / 6,
                                                    padding: EdgeInsets.only(top: 10),
                                                    margin: EdgeInsets.only(top: 10),
                                                    child: InkWell(
                                                      onTap: () async {


                                                        print('pesh log');
                                                        await _loginController.loginUser(
                                                            email!, password!).then((value) => Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) => Botton()),
                                                        ));



                                                        int? status = _loginController.res;

                                                        // if (status == 200) {
                                                        //    Navigator.push(
                                                        //     context,
                                                        //     MaterialPageRoute(
                                                        //         builder: (context) => Botton()),
                                                        //   );
                                                        // }
                                                      },
                                                      child: Container(
                                                        alignment: Alignment.center,
                                                        width: MediaQuery.of(context).size.width *
                                                            2.7 /
                                                            6,
                                                        height: 50,
                                                        decoration: BoxDecoration(
                                                          color: homeController.graybuton.value,
                                                          borderRadius: BorderRadius.circular(8),

                                                        ),
                                                        child: Text(
                                                          AppLocalizations.of(context)!.singin,
                                                          textAlign: TextAlign.center,
                                                          style: TextStyle(

                                                            color: homeController.bluebackground.value,
                                                            fontSize: 16,
                                                            fontWeight: FontWeight.w500,
                                                            letterSpacing: 0.15,
                                                            fontFamily: 'roboto',
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  )),

                                            ],
                                          ),
                                        ),

                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 35,
                                  )
                                ],)

                              ],)
                            ],
                          ),
                        )
                    ),
                  ),
                ))));
  }
}
