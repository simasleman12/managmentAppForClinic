// import 'dart:async';
// import 'dart:convert';
// import 'package:esc_pos_utils/esc_pos_utils.dart';
// import 'package:esc_pos_printer/esc_pos_printer.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';
//
// class printercontrol extends GetxController {
//   void printReceipt(String ip) async {
//     try {
//       print("test");
//       print("im inside the test print 2");
//       const PaperSize paper = PaperSize.mm80;
//       final profile = await CapabilityProfile.load();
//       final printer = NetworkPrinter(paper, profile);
//      print(ip);
//       // '192.168.0.101'
//       final PosPrintResult res = await printer.connect(ip, port: 9100);
//
//       print("this is response");
//       print(res.msg);
//       if (res == PosPrintResult.success) {
//         print("eishakat");
//         printer.text('Safeen Restaurant',
//             styles: PosStyles(
//                 align: PosAlign.center,
//                 height: PosTextSize.size2,
//                 width: PosTextSize.size2),
//             linesAfter: 2);
//
//         final headers = [
//           PosColumn(
//             text: 'Food',
//             width: 7,
//             styles: PosStyles(align: PosAlign.left, bold: true),
//           ),
//           PosColumn(
//             text: 'Qty',
//             width: 2,
//             styles: PosStyles(align: PosAlign.center, bold: true),
//           ),
//           PosColumn(
//             text: 'Price',
//             width: 3,
//             styles: PosStyles(align: PosAlign.right, bold: true),
//           ),
//         ];
//
//         final items = [
//           [
//             PosColumn(
//               text: 'Pizza',
//               width: 7,
//               styles: PosStyles(align: PosAlign.left),
//             ),
//             PosColumn(
//               text: '1',
//               width: 2,
//               styles: PosStyles(align: PosAlign.center),
//             ),
//             PosColumn(
//               text: '2000000',
//               width: 3,
//               styles: PosStyles(align: PosAlign.right),
//             ),
//           ],
//           [
//             PosColumn(
//               text: 'Pasta',
//               width: 7,
//               styles: PosStyles(align: PosAlign.left),
//             ),
//             PosColumn(
//               text: '2',
//               width: 2,
//               styles: PosStyles(align: PosAlign.center),
//             ),
//             PosColumn(
//               text: '4000',
//               width: 3,
//               styles: PosStyles(align: PosAlign.right),
//             ),
//           ],
//         ];
//
//         printer.row(headers.cast<PosColumn>());
//
//         // printer.emptyLines(1);
//
//         for (var item in items) {
//           printer.row(item.cast<PosColumn>());
//           printer.text('');
//         }
//         printer.hr(ch: '-');
//
//         // printer.emptyLines(1);
//         final totals = [
//           PosColumn(
//             text: '',
//             width: 2,
//             styles: PosStyles(align: PosAlign.left, bold: true),
//           ),
//           PosColumn(
//             text: 'Total Price',
//             width: 5,
//             styles: PosStyles(align: PosAlign.center, bold: true),
//           ),
//           PosColumn(
//             text: '100000099',
//             width: 5,
//             styles: PosStyles(align: PosAlign.right, bold: true),
//           ),
//         ];
//
//         printer.row(totals.cast<PosColumn>());
//         printer.cut();
//         printer.disconnect();
//       } else {
//         print('Connection failed: ${res.msg}');
//       }
//     } catch (e) {
//       print('Error during connection: $e');
//     }
//   }
//
// }
