import 'package:flutter/material.dart';

class ListenSongs_screen extends StatelessWidget{

  final int index;

  ListenSongs_screen({Key key, @required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ListenSongs_screen'),),
      body: new Container(
        color: Colors.blue,
        child: new Center(
          child: new RaisedButton(
            onPressed: (){
              Navigator.of(context).pop('ListenSongs_screen');
            },
            child: new Text('$index'),
          ),
        ),
      ),
    );
  }
}