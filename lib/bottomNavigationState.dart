import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:layout_tutorial/mainPage.dart';
import 'first_page.dart';
import 'imageHolderState.dart';

class MainPageSkeleton extends StatefulWidget {
  @override
  MainPageSkeletonState createState() => MainPageSkeletonState();
}

class MainPageSkeletonState extends State<MainPageSkeleton>
    with AutomaticKeepAliveClientMixin {
  final List<Widget> pages = [
    const MainPage(
      key: PageStorageKey('Page1'),
    ),
    FirstPage(
      key: PageStorageKey('Page2'),
    ),
    AnotherPage(
      key: PageStorageKey('Page3'),
    ),
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  int _selectedIndex = 0;

  AppBar ab = AppBar(
    centerTitle: true,
    backgroundColor: Colors.orange,
    title: Text('My test App'),
  );

  Widget _bottomNavigationBar(int selectedIndex) => BottomNavigationBar(
        onTap: (int index) => setState(() => _selectedIndex = index),
        currentIndex: selectedIndex,
        items: [
          BottomNavigationBarItem(
            icon: _selectedIndex == 0
                ? new Icon(CupertinoIcons.heart_solid)
                : new Icon(CupertinoIcons.heart),
            title: new Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 1
                ? new Icon(CupertinoIcons.mail_solid)
                : new Icon(CupertinoIcons.mail),
            title: new Text('Messages'),
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 2
                ? new Icon(CupertinoIcons.person_solid)
                : new Icon(CupertinoIcons.person),
            title: new Text('Contacts'),
          )
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ab,
      bottomNavigationBar: _bottomNavigationBar(_selectedIndex),
      body: PageStorage(
        child: pages[_selectedIndex],
        bucket: bucket,
      ),
      //onTap: changeIndex(index),
      //onTap: _onTap,
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class NewPage extends StatelessWidget {
  const NewPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
          children: [
            titleSection,
            textSection,
            buttonSection,
          ],
        ));
  }
}

class TapboxA extends StatefulWidget {
  TapboxA({Key key}) : super(key: key);

  @override
  _TapboxAState createState() => _TapboxAState();
}

class _TapboxAState extends State<TapboxA> {
  bool _active = false;

  void doStuff ()
  {
    int x = 0;
  }

  void _handleTap() {
    setState(() {
      _active = !_active;
    });
  }

  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      GestureDetector(
        onTap: _handleTap,
        child: Container(
          child: Center(
            child: Text(
              _active ? 'Active' : 'Inactive',
              style: TextStyle(fontSize: 32.0, color: Colors.white),
            ),
          ),
          width: 200.0,
          height: 200.0,
          decoration: BoxDecoration(
            color: _active ? Colors.lightGreen[700] : Colors.grey[600],
          ),
        ),
      ),
      MaterialButton(onPressed: doStuff, minWidth: 30,enableFeedback: true,),
    ]);
  }
}

class AnotherPage extends StatelessWidget {
  const AnotherPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return scf;
  }
}

Widget scf = Scaffold(
    body: ListView(
      children: [
        TapboxA(),
      ],
    ));

class AnotherWidget extends StatefulWidget {
  const AnotherWidget({Key key}) : super(key: key);

  @override
  _ParentWidgetState createState() => _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget> {
  bool _active = false;

  void _handleTapboxChanged(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TapboxB(
        key: PageStorageKey('ImageHolder'),
        active: _active,
        onChanged: _handleTapboxChanged,
      ),
    );
  }
}

// _onTap(int index) {
//   switch (index) {
//     case 2:
//       {
//         Navigator.of(context)
//             .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
//           return new MainPage();
//         }));
//       }
//       break;

//     case 1:
//       {
//         Navigator.of(context)
//             .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
//           return new NewPage();
//         }));
//       }
//       break;
//   }
// }
