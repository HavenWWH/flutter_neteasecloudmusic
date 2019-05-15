import 'package:flutter/material.dart';


class Choice {
  const Choice({this.title, this.icon});
  final String title;
  final IconData icon;
}

const List<Choice> choices = const <Choice>[

  const Choice(title: 'Car',icon: Icons.directions_car),
  const Choice(title: 'Bike',icon: Icons.directions_bike),
  const Choice(title: 'Bus',icon: Icons.directions_bus),
  const Choice(title: 'Boat',icon: Icons.directions_boat),
  const Choice(title: 'Walk',icon: Icons.directions_walk),
  const Choice(title: 'Train',icon: Icons.directions_railway),
];


class Video_screen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: VideoPage(),
    );
  }
}

class VideoPage extends StatefulWidget {
  VideoPage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _VideoPageState createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {

  AppBar _homeAppBar = new AppBar(
    backgroundColor: Colors.white,
    titleSpacing: 0,
    title: new TabBar(
      unselectedLabelColor: Colors.black38,
      indicatorColor: Colors.orange,
      labelColor: Colors.orange,
      isScrollable: true,
      tabs: choices.map((Choice choice) {
        return new Tab(
          text: choice.title,
          icon: new Icon(choice.icon),
        );
      }).toList(),
    ),
  );

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          PopMemu(),
        ],
        title: new Text('Business'),
      ),
      body:  new DefaultTabController(
        length: choices.length,
        child: new Scaffold(
          appBar: _homeAppBar,
          body: new TabBarView(
            children: choices.map((Choice choice) {
              return new Padding(
                padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                child: TabBarViewCard(
                  choice: choice,
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}


class TabBarViewCard extends StatelessWidget {
  TabBarViewCard({Key key, this.choice}) : super(key: key);

  final Choice choice;

  @override
  Widget build(BuildContext context) {
    return new Container(
      alignment: Alignment.center,
      child: new Text(choice.title, style: new TextStyle(fontSize: 40, color: Colors.orange),),
    );
  }
}

// PopMemu
class PopMemu extends StatefulWidget {
  PopMemu({Key key}) : super(key: key);

  @override
  _PopMemuState createState() => new _PopMemuState();
}
class _PopMemuState extends State<PopMemu> {

  Choice _selectChoice = choices[0];

  void _memuSelect(Choice choice) {
    setState(() {
      _selectChoice = choice;
    });
  }

  @override
  Widget build(BuildContext context) {

    return new PopupMenuButton(
      onSelected: _memuSelect,
      itemBuilder: (BuildContext context) {
        return choices.skip(3).map((Choice choice) {
          return new PopupMenuItem<Choice>(
            value: choice,
            child: new Text(choice.title),
          );
        }).toList();
      },
    );
  }

}
