import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shake/shake.dart';

class homeControler extends GetxController {
  var orange = HexColor("#EA5A47").obs;
  var orangehover = HexColor("#E87A7A").obs;
  var greenhover = HexColor("#FFDEBC").obs;
  var graytext = HexColor("#818181").obs;

  var bluebackground = HexColor("#1A324C").obs;
  var blue2 = HexColor("#165BAA").obs;
  var white = HexColor("#FFFFFF").obs;
  var brown = HexColor("#C19A73").obs;
  var backgrounds = HexColor("#F5F5F5").obs;

  var backgrawnd = HexColor("#F8F8F8").obs;
  var backgrawnd2 = HexColor("##F5F5F5").obs;
  var brownhover = HexColor("#ceb396").obs;
  var grayShadow = HexColor("#A3ADB7").obs;
  var grayborder = HexColor("#6A737D").obs;
var graybuton =HexColor("#A3ADB7").obs;


  var GRAYKAL = HexColor("#EBEDF3").obs;

  var red = HexColor("#B3261E").obs;
  var black = HexColor("#000000").obs;
  var green = HexColor("#4EAE69").obs;
  var redHover = HexColor("#ffbfbf").obs;
  late ShakeDetector shakeDetector;
  @override
  void onInit() {
    super.onInit();
    shakeDetector = ShakeDetector.autoStart(onPhoneShake: () {
      orange.value = Colors.primaries[Random().nextInt(Colors.primaries.length)]
          as HexColor;
      graybuton.value = Colors.primaries[Random().nextInt(Colors.primaries.length)]
      as HexColor;
      graytext.value = Colors
          .primaries[Random().nextInt(Colors.primaries.length)] as HexColor;
      greenhover.value = Colors
          .primaries[Random().nextInt(Colors.primaries.length)] as HexColor;
      brown.value = Colors.primaries[Random().nextInt(Colors.primaries.length)]
          as HexColor;

      redHover.value = Colors
          .primaries[Random().nextInt(Colors.primaries.length)] as HexColor;
      green.value = Colors.primaries[Random().nextInt(Colors.primaries.length)]
          as HexColor;
      blue2.value = Colors.primaries[Random().nextInt(Colors.primaries.length)]
          as HexColor;
      orangehover.value = Colors
          .primaries[Random().nextInt(Colors.primaries.length)] as HexColor;
      GRAYKAL.value = Colors
          .primaries[Random().nextInt(Colors.primaries.length)] as HexColor;
      bluebackground.value = Colors.primaries[Random().nextInt(Colors.primaries.length)]
          as HexColor;
      white.value = Colors.primaries[Random().nextInt(Colors.primaries.length)]
          as HexColor;
      backgrawnd.value = Colors
          .primaries[Random().nextInt(Colors.primaries.length)] as HexColor;
      backgrawnd2.value = Colors
          .primaries[Random().nextInt(Colors.primaries.length)] as HexColor;
      grayShadow.value = Colors
          .primaries[Random().nextInt(Colors.primaries.length)] as HexColor;

      grayborder.value = Colors
          .primaries[Random().nextInt(Colors.primaries.length)] as HexColor;
      red.value = Colors.primaries[Random().nextInt(Colors.primaries.length)]
          as HexColor;
      black.value = Colors.primaries[Random().nextInt(Colors.primaries.length)]
          as HexColor;
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
