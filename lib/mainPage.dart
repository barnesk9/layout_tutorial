import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'favoriteWidgetState.dart';
import 'imageHolderState.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PageStorageKey('Page1');
    return Scaffold(
      //appBar: ab,
      body: ListView(
        children: [
          imageHolder,
          titleSection,
          textSection,
          buttonSection,
        ],
      ),
    );
    //bottomNavigationBar: bcb);
  }
}

Widget imageHolder = ParentWidget( key: PageStorageKey('placeholder') );

AppBar ab = AppBar(
    centerTitle: true,
    backgroundColor: Colors.orange,
    title: Text('My test App'));

 Widget titleSection = Container(
  padding: const EdgeInsets.all(32),
  child: Row(
    children: [
      Expanded(
        /*1*/
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /*2*/
            Container(
              padding:
                  //const EdgeInsets.only(bottom: 8, left: 24, right: 24),
                  const EdgeInsets.only(bottom: 8),
              child: Text(
                'Oeschinen Lake Campground',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(
              'Kandersteg, Switzerland',
              style: TextStyle(
                color: Colors.grey[500],
              ),
            ),
          ],
        ),
      ),
      FavoriteWidget(key: PageStorageKey('favorited'),),
    ],
  ),
);

Widget textSection = Container(
  padding: const EdgeInsets.all(32),
  child: Text(
    whatsTheText(),
    softWrap: true,
  ),
);

String whatsTheText() {
  return 'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
      'Alps. Situated 1,578 meters above sea level, it is one of the '
      'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
      'half-hour walk through pastures and pine forest, leads you to the '
      'lake, which warms to 20 degrees Celsius in the summer. Activities '
      'enjoyed here include rowing, and riding the summer toboggan run.';
}

List<Column> allButtons = new List<Column>();

//Places all the buttons created above in a row.
Widget buttonSection = Container(
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [],
  ),
);

Column _createApplicationButton(Color color, IconData icon, String label) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(icon, color: color),
      // MaterialButton(
      //   onPressed: makeaThing,
      //   minWidth: 35,
      //   color: Colors.yellow,
      //   focusColor: Colors.orange,
      //   ),
      Container(
        margin: const EdgeInsets.only(top: 8),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: color,
          ),
        ),
      ),
    ],
  );
}

BottomNavigationBar bcb = BottomNavigationBar(
  currentIndex: 0, // this will be set when a new tab is tapped
  //onTap: changeIndex(index),
  items: [
    BottomNavigationBarItem(
      icon: new Icon(CupertinoIcons.home),
      title: new Text('Home'),
    ),
    BottomNavigationBarItem(
      icon: new Icon(Icons.mail),
      title: new Text('Messages'),
    ),
    BottomNavigationBarItem(icon: Icon(Icons.person), title: Text('Profile'))
  ],
);

void buttonColumns() {
  List<Color> colors = [Colors.red, Colors.green, Colors.yellow];
  Random random = new Random();

  allButtons.add(
      _createApplicationButton(colors[random.nextInt(3)], Icons.call, 'CALL'));
  allButtons.add(_createApplicationButton(
      colors[random.nextInt(3)], CupertinoIcons.lab_flask, 'ROUTE'));
  allButtons.add(_createApplicationButton(
      colors[random.nextInt(3)], CupertinoIcons.share, 'SHARE'));
  allButtons.add(_createApplicationButton(
      colors[random.nextInt(3)], Icons.alarm, 'ALARM'));
}
