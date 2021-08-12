import 'package:curecode/QRCheckerPageDesign/models/MyHomePage.dart';
import 'package:curecode/QRCheckerPageDesign/models/ScanerSHowPage.dart';
import 'package:curecode/QRCheckerPageDesign/scheme/DataItemClass.dart';
import 'package:curecode/QRCheckerPageDesign/widgets/AppBarWidget.dart';
import 'package:flutter/material.dart';
import 'package:qr_mobile_vision/qr_camera.dart';

class ScanPage extends StatefulWidget {
  const ScanPage({Key? key}) : super(key: key);

  @override
  _ScanPageState createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  List history = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: QrCamera(
        qrCodeCallback: (address) {
          _openScanShowPage(address);
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            AppBarWidget(title: 'Scan Code'),
            SizedBox(height: 30.0),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Place your front side of your QR-code\non the blue box',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w400,
                  letterSpacing: .20,
                ),
              ),
            ),
            SizedBox(height: 30.0),
            Container(
              width: 220.0,
              height: 220.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                border: Border.all(color: Colors.blue),
                color: Colors.white.withOpacity(.1),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _openScanShowPage(address) async {
    if (!history.contains(address)) {
      history.add(address);
      DateTime now = DateTime.now();
      DataItem item = DataItem(address, HomePage.variables.generatorID(), now);
      HomePage.variables.historyList.add(item);
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => ScanerShowPage(link: address),
        ),
      );
    }
  }
}
