import 'package:flutter/cupertino.dart';
import 'package:esc_pos_utils/esc_pos_utils.dart';
import 'package:esc_pos_printer/esc_pos_printer.dart';
import 'package:flutter/material.dart';

class Printer extends StatefulWidget {
  const Printer({Key? key}) : super(key: key);

  @override
  State<Printer> createState() => _PrinterState();
}

class _PrinterState extends State<Printer> {

  void printReceipt(String ip) async {
    try {
      print("test");
      print("im inside the test print 222222222222222222222222222");
      const PaperSize paper = PaperSize.mm80;
      final profile = await CapabilityProfile.load();
      final printer = NetworkPrinter(paper, profile);

print(ip);
print('192.168.0.1012');
      //
      final PosPrintResult res = await printer.connect('192.168.0.102', port: 9100);

      print("this is response");
      print(res.msg);
      if (res == PosPrintResult.success) {
        print("eishakat");
        printer.text('test',
            styles: PosStyles(
                align: PosAlign.center,
                height: PosTextSize.size2,
                width: PosTextSize.size2),
            linesAfter: 2);

        final headers = [
          PosColumn(
            text: 'equ',
            width: 7,
            styles: PosStyles(align: PosAlign.left, bold: true),
          ),
          PosColumn(
            text: 'Qty',
            width: 2,
            styles: PosStyles(align: PosAlign.center, bold: true),
          ),
          PosColumn(
            text: 'Price',
            width: 3,
            styles: PosStyles(align: PosAlign.right, bold: true),
          ),
        ];

        final items = [
          [
            PosColumn(
              text: 'lol',
              width: 7,
              styles: PosStyles(align: PosAlign.left),
            ),
            PosColumn(
              text: '1',
              width: 2,
              styles: PosStyles(align: PosAlign.center),
            ),
            PosColumn(
              text: '2000000',
              width: 3,
              styles: PosStyles(align: PosAlign.right),
            ),
          ],
          [
            PosColumn(
              text: 'pop',
              width: 7,
              styles: PosStyles(align: PosAlign.left),
            ),
            PosColumn(
              text: '2',
              width: 2,
              styles: PosStyles(align: PosAlign.center),
            ),
            PosColumn(
              text: '4000',
              width: 3,
              styles: PosStyles(align: PosAlign.right),
            ),
          ],
        ];

        printer.row(headers.cast<PosColumn>());

        // printer.emptyLines(1);

        for (var item in items) {
          printer.row(item.cast<PosColumn>());
          printer.text('');
        }
        printer.hr(ch: '-');

        // printer.emptyLines(1);
        final totals = [
          PosColumn(
            text: '',
            width: 2,
            styles: PosStyles(align: PosAlign.left, bold: true),
          ),
          PosColumn(
            text: 'Total Price',
            width: 5,
            styles: PosStyles(align: PosAlign.center, bold: true),
          ),
          PosColumn(
            text: '100000099',
            width: 5,
            styles: PosStyles(align: PosAlign.right, bold: true),
          ),
        ];

        printer.row(totals.cast<PosColumn>());
        printer.cut();
        printer.disconnect();
      } else {
        print('Connection failed: ${res.msg}');
      }
    } catch (e) {
      print('Error during connection: $e');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      width: 100,
      child: Text("h i "),
    );
  }
}