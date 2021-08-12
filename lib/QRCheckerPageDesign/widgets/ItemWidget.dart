import 'package:curecode/QRCheckerPageDesign/models/MyHomePage.dart';
import 'package:curecode/QRCheckerPageDesign/scheme/DataItemClass.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ItemWidget extends StatefulWidget {
  final int itemIndex;
  const ItemWidget({required this.itemIndex, Key? key}) : super(key: key);

  @override
  _ItemWidgetState createState() => _ItemWidgetState();
}

class _ItemWidgetState extends State<ItemWidget> {
  @override
  Widget build(BuildContext context) {
    DataItem item = HomePage.variables.historyList[widget.itemIndex];
    return InkWell(
      onTap: (){
        Navigator.of(context).pushNamed('/itemQCode/${widget.itemIndex}');
      },
      child: Dismissible(
        key: Key('${item.itemID}'),
        onDismissed: (DismissDirection direction){
          print(direction);
          if (direction == DismissDirection.endToStart){
          } else {
            print('move to trash');
            print("move to favorite");
          }

          setState(() {
            HomePage.variables.historyList.removeAt(widget.itemIndex);
          });
        },
        child: ListTile(
          leading: Icon(
            Icons.qr_code_2,
            color: Colors.white,
            size: 40,
          ),
          title: Text(
            "Web Address",
            style: TextStyle(color: Colors.white, fontSize: 18.0),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${item.address}",
                style: TextStyle(color: Colors.grey, fontSize: 12.0),
              ),
              Text(
                "Scanned - ${DateFormat('dd MMMM y').format(item.date)}",
                style: TextStyle(color: Colors.grey, fontSize: 12.0),
              ),
            ],
          ),
        ),
        background: Container(
          height: 10,
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: Row(
              children: <Widget>[
                Icon(Icons.favorite, color: HomePage.variables.backgroundColor),
                SizedBox(width: 10.0),
                Text('Move to favorites',
                    style: TextStyle(color: HomePage.variables.backgroundColor)),
              ],
            ),
          ),
        ),
        secondaryBackground: Container(
          color: Colors.red,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Icon(Icons.delete, color: Colors.white),
                SizedBox(width: 10.0),
                Text('Move to trash',
                    style: TextStyle(color: Colors.white)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
