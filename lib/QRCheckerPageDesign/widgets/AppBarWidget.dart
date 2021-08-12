import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class AppBarWidget extends StatefulWidget {
  final String title;
  const AppBarWidget({required this.title, Key? key}) : super(key: key);

  @override
  _AppBarWidgetState createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends State<AppBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
      height: 85.0,
      alignment: Alignment.bottomCenter,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20.0),
            bottomRight: Radius.circular(20.0)),
      ),
      child: Row(
        children: <Widget>[
          InkWell(
            onTap: () => Navigator.of(context).pop(),
            child: Icon(CupertinoIcons.back, color: Colors.black),
          ),
          SizedBox(width: 10.0),
          Text('${widget.title}',
              style: TextStyle(
                  fontSize: 19.0,
                  fontWeight: FontWeight.w700,
                  letterSpacing: .1)),
        ],
      ),
    );
  }
}
