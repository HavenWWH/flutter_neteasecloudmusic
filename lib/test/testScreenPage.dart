import 'package:flutter/material.dart';

class Test_screen extends StatelessWidget{
  
  final int index;
  
  Test_screen({Key key, @required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Test_screen'),),
      body: new Container(
        color: Colors.blue,
        child: new Center(
          child: new RaisedButton(
            onPressed: (){
              Navigator.of(context).pop('111111');
            },
            child: new Text('$index'),
          ),
        ),
      ),
    );
  }
}