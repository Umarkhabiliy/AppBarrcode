import 'package:curecode/QRCheckerPageDesign/models/MyHomePage.dart';
import 'package:curecode/QRCheckerPageDesign/scheme/DataItemClass.dart';
import 'package:curecode/QRCheckerPageDesign/widgets/ClearDialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Text(
          "Favorite",
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => ClearDialogWidget(list: 'history'),
              ).then((value) => setState(() {}));
            },
            child: Text(
              "Clear",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
                fontWeight: FontWeight.w400,
                letterSpacing: .5,
              ),
            ),
          ),
        ],
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: HomePage.variables.favoriteList.length != 0
            ? ListView.builder(
                padding: EdgeInsets.all(10.0),
                physics: AlwaysScrollableScrollPhysics(
                    parent: BouncingScrollPhysics()),
                shrinkWrap: true,
                itemCount: HomePage.variables.favoriteList.length,
                itemBuilder: (context, index) {
                  return makeItem(itemIndex: index);
                },
              )
            : Center(
                child: Text('Empty',
                    style: TextStyle(
                      color: Colors.grey.shade500,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w400,
                      letterSpacing: .5,
                    )),
              ),
      ),
    );
  }

  Widget makeItem({itemIndex}) {
    DataItem item = HomePage.variables.favoriteList[itemIndex];
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed('/itemQCode/$itemIndex');
      },
      child: Dismissible(
        key: Key('${item.address}'),
        onDismissed: (DismissDirection direction) {
          setState(() {
            if (direction == DismissDirection.endToStart) {
              HomePage.variables.favoriteList.removeAt(itemIndex);
            } else {
              HomePage.variables.historyList.add(HomePage.variables.favoriteList[itemIndex]);
              HomePage.variables.favoriteList.removeAt(itemIndex);
            }
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
                Icon(CupertinoIcons.heart, color: HomePage.variables.backgroundColor),
                SizedBox(width: 10.0),
                Text('Remove from favorites',
                    style:
                        TextStyle(color: HomePage.variables.backgroundColor)),
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
                Text('Move to trash', style: TextStyle(color: Colors.white)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
