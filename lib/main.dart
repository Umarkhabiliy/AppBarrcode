import 'package:curecode/QRCheckerPageDesign/models/MyHomePage.dart';
import 'package:curecode/QRCheckerPageDesign/models/ScanerSHowPage.dart';
import 'package:flutter/material.dart';

void main() {  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
      onGenerateRoute: (RouteSettings settings){
        List pathList = settings.name.toString().split('/');
        if(pathList[1] == 'itemQCode'){
          return MaterialPageRoute(builder: (context) => ScanerShowPage(link: HomePage.variables.historyList[int.parse(pathList[2])].address),);
        }

        return null;
      },
    );
  }
}


