import 'package:curecode/QRCheckerPageDesign/models/MyHomePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ClearDialogWidget extends StatefulWidget {
  final String? list;
  const ClearDialogWidget({this.list, Key? key}) : super(key: key);

  @override
  _ClearDialogWidgetState createState() => _ClearDialogWidgetState();
}

class _ClearDialogWidgetState extends State<ClearDialogWidget> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Clear all?",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.0)),
      content: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                elevation: 0.0,
                primary: Colors.grey.shade200,
              ),
              child: Text('Cancel',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 16.0)),
            ),
          ),
          SizedBox(width: 20.0),
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  if (widget.list == 'favorite') {
                    HomePage.variables.favoriteList = [];
                  } else {
                    HomePage.variables.historyList = [];
                  }
                });
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                elevation: 0.0,
                primary: Colors.red,
              ),
              child: Text('Clear',
                  style:
                      TextStyle(fontWeight: FontWeight.w400, fontSize: 16.0)),
            ),
          ),
        ],
      ),
    );
  }
}
