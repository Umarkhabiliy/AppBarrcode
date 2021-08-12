import 'dart:io';

import 'package:barcode_widget/barcode_widget.dart';
import 'package:curecode/QRCheckerPageDesign/widgets/AppBarWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:url_launcher/url_launcher.dart';

import 'MyHomePage.dart';

class ScanerShowPage extends StatefulWidget {
  final String? link;
  final int? itemIndex;
  const ScanerShowPage({this.link, this.itemIndex});

  @override
  State<ScanerShowPage> createState() => _ScanerShowPageState();
}

class _ScanerShowPageState extends State<ScanerShowPage> {
  final _url = "https://google.com";

  @override
  Widget build(BuildContext context) {
    final String link = widget.link ??
        HomePage.variables.historyList[widget.itemIndex!].address!;
    final controller = TextEditingController(text: link);

    return Scaffold(
      backgroundColor: HomePage.variables.backgroundColor,
      body: Column(
        children: [
          AppBarWidget(
            title: 'Back',
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(20.0),
              physics: AlwaysScrollableScrollPhysics(
                  parent: BouncingScrollPhysics()),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Text(
                        "Web Address",
                        style: TextStyle(
                            fontSize: 30.0,
                            color: Colors.white70,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.0),
                  BarcodeWidget(
                    barcode: Barcode.qrCode(),
                    color: Colors.white,
                    data: controller.text,
                    width: 200,
                    height: 200,
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    "$link",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20.0, color: Colors.white70),
                  ),
                  SizedBox(height: 20.0),
                  InkWell(
                    onTap: () {
                      _openURL(link);
                    },
                    splashColor: Colors.transparent,
                    child: Text(
                      "Open URL",
                      style: TextStyle(
                          fontSize: 22.0,
                          color: Colors.blue,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  InkWell(
                    onTap: () {
                    },
                    splashColor: Colors.transparent,
                    child: Text(
                      "Copy",
                      style: TextStyle(
                          fontSize: 22.0,
                          color: Colors.white70,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  InkWell(
                    onTap: () {},
                    splashColor: Colors.transparent,
                    child: Text(
                      "Share",
                      style: TextStyle(
                          fontSize: 22.0,
                          color: Colors.white70,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _openURL(link) async {
    launch('$link');
  }
}
