import 'package:flutter/material.dart';

// ParentWidget manages the state for TapboxB.

//------------------------ ParentWidget --------------------------------

class ParentWidget extends StatefulWidget {
   const ParentWidget({Key key}) : super(key: key);

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

//------------------------- TapboxB ----------------------------------

class TapboxB extends StatelessWidget {
  TapboxB({Key key, this.active: false, @required this.onChanged})
      : super(key: key);

  final bool active;
  final ValueChanged<bool> onChanged;

  void _handleTap() {
    onChanged(!active);
  }

  BoxDecoration myBoxDecoration(bool isit) {
  Color maybe = Colors.blue;

  if(isit){
    maybe = Colors.pink;
  }
  //else maybe = 40.0;
  return BoxDecoration(border: Border.all(width: 20.0,color:maybe)
  );
}

  Widget build(BuildContext context) {
    const double _width = 40;

    return GestureDetector(
      onTap: _handleTap,
      child: Container(
        width: 40,
        padding: const EdgeInsets.only(top: 1, left: _width, right:_width ),
        decoration: myBoxDecoration(active),
        child:
          Image.asset( active? 'images/1.jpg': 'images/2.jpg',
          width: MediaQuery.of(context).size.height,
          height: MediaQuery.of(context).size.height/2.7,
          fit: BoxFit.cover,
        )
      )
    );
  }
}


      
      //  Container(
      //   child: Center(
      //     child: Text(
      //       active ? 'Active' : 'Inactive',
      //       style: TextStyle(fontSize: 32.0, color: Colors.white),
      //     ),
      //   ),
      //   width: 200.0,
      //   height: 200.0,
      //   decoration: BoxDecoration(
      //     color: active ? Colors.lightGreen[700] : Colors.grey[600],
      //   ),
      // ),