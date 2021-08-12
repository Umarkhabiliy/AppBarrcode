import 'package:curecode/QRCheckerPageDesign/models/FavoritePage.dart';
import 'package:curecode/QRCheckerPageDesign/models/HistoryPage.dart';
import 'package:curecode/QRCheckerPageDesign/models/ScanerPage.dart';
import 'package:curecode/QRCheckerPageDesign/scheme/Variables.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static Variables variables = Variables();

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List pages;
  @override
  Widget build(BuildContext context) {
    pages = [HistoryPage(), FavoritePage()];
    return Scaffold(
      backgroundColor: HomePage.variables.backgroundColor,
      body: pages[HomePage.variables.currentPageIndex],
      bottomNavigationBar: bottomBarWidget(),
      floatingActionButton: floatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget floatingActionButton() {
    return Container(
      width: 70.0,
      height: 70.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          begin: Alignment.bottomRight,
          colors: [
            Colors.redAccent,
            Colors.orange,
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.orangeAccent,
            blurRadius: 5.0,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ScanPage(),
            ),
          ).then((value) => setState((){}));
        },
        child: Icon(Icons.qr_code_scanner_rounded,
            color: Colors.white, size: 40.0),
      ),
    );
  }

  Widget bottomBarWidget() {
    return Container(
      height: 70.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32.0),
          topRight: Radius.circular(32.0),
        ),
        color: HomePage.variables.bottomBarColor,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          makeButton(index: 0),
          SizedBox(),
          makeButton(index: 1),
        ],
      ),
    );
  }

  makeButton({index}) {
    Color iconColor = Colors.grey.shade400;
    IconData icon = HomePage.variables.bottomBarIcons[index][0];
    if (index == HomePage.variables.currentPageIndex) {
      iconColor = HomePage.variables.backgroundColor;
      icon = HomePage.variables.bottomBarIcons[index][1];
    }

    return InkWell(
      onTap: () {
        setState(() {
          HomePage.variables.currentPageIndex = index;
        });
      },
      child: Container(
        height: 50.0,
        width: 50.0,
        child: Icon(icon, color: iconColor, size: 28.0),
      ),
    );
  }
}
