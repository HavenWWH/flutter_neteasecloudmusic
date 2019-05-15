import 'package:flutter/material.dart';
import 'package:flutter_neteasecloudmusic/utils/http_util.dart';
import 'package:flutter_neteasecloudmusic/common/api.dart';
import 'package:flutter_neteasecloudmusic/modules/discovery/model/banner_model.dart';

class Discovery_screen extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: HomeDrawer(),
      appBar: AppBar(
        title: Text('Discovery_screen'),
      ),
      body: DiscoveryPage(title: 'Discovery'),
    );
  }
}

// 主函数
class DiscoveryPage extends StatefulWidget {
  DiscoveryPage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _DiscoveryPageState createState() => _DiscoveryPageState();
}

class _DiscoveryPageState extends State<DiscoveryPage> {

  Widget titleSection = new Container(
    padding: new EdgeInsets.fromLTRB(10, 10, 10, 0),
    child: new Row(
      children: <Widget>[
        new Expanded(
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Container(
                padding: new EdgeInsets.only(bottom: 5.0),
                child: new Text(
                  '这是第一个flutter App',
                  style: new TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
              ),
              new Text(
                "不知道怎么玩 还在学习中, 加油",
                style: new TextStyle(
                  color: Colors.black38,
                ),
              ),
            ],
          ),
        ),
        new CollectionStars(),
      ],
    ),
  );

  Column buildButtonColumn(IconData icon, String name) {
    return new Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        new Icon(icon, color: Colors.orange),
        new Container(
          margin: const EdgeInsets.only(top: 5.0),
          child: new Text(
            name,
            style: new TextStyle(
              color: Colors.black38,
              fontSize: 15.0,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }

  Widget detailSection = new Container(
    padding: new EdgeInsets.fromLTRB(10, 10, 10, 10),
    child: new Text(
      '圣诞节返回上福多寿课件发生的范德萨发生的机会飞机上的匡扶汉室地方但是返回福多寿课件发生的范德萨发'
          '生的机会飞机上的匡扶汉室地方但是返回课法律是多福多寿课件发生的范德萨发'
          '生的机会飞机上福多寿课件发生的范德萨发生的机会飞机上的匡扶汉室地方但是返回福多寿课件'
          '发生的范德萨发生的机会飞机上的匡扶汉室地方但是返回福多寿课件发生的范德萨发生的机会飞'
          '机上的匡扶汉室地方但是返回福多寿课件发生的范德萨发生的机会飞机上的匡扶汉室地方但是返回的匡扶'
          '汉室地方但是返回圣诞节返回都是复活节岛上即可发货速度加快返回的就是飞机上的发货速度回复速度快放假都是粉'
          '色的飞机上等咖啡豆苏里科夫吉林省地方就是到了附近索科洛夫就是打开了房间 ',
      style: new TextStyle(
        color: Colors.grey,
        fontWeight: FontWeight.w400,
        fontSize: 16.0,
      ),
    ),
  );

  @override
  void initState() {
    super.initState();

    loadData();
  }

  void loadData() {

    HttpUtil.request(
      Apis.banner,
      params: {'type' : '2'},
      callBack: (data) {

        print("success:" + '$data');
        List banners = data['banners'];
        List<banner_model> bannerList = banners.map((model) {
          return banner_model.fromJson(model);
        }).toList();

        print('banners:' + '$bannerList');
      },
      errorCallBack: (errorMsg) {

        print("error:" + errorMsg);
      }
    );
  }
  @override
  Widget build(BuildContext context) {

    Widget buttonSection = new Container(
      padding: new EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          buildButtonColumn(Icons.call, 'Call'),
          buildButtonColumn(Icons.near_me, 'Route'),
          buildButtonColumn(Icons.share, 'Share'),
        ],
      ),
    );

    return Scaffold(
      body: new ListView(
        children: <Widget>[
          Banner(),
          titleSection,
          buttonSection,
          detailSection,
        ],
      ),
    );
  }
}

// banner
class Banner extends StatefulWidget {
  @override
  _BannerState createState() => _BannerState();
}
class _BannerState extends State<Banner> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      height: 200,
      child: new ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          new Image.asset(
            'images/lf.jpg',
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.fill,
          ),
          new Image.asset(
            'images/zz.jpg',
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.fill,
          ),
          new Image.asset(
            'images/kks.jpg',
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.fill,
          ),
        ],
      ),
    );
  }
}

// 收藏功能
class CollectionStars extends StatefulWidget {
  @override
  _CollectionStars createState() => _CollectionStars();
}
class _CollectionStars extends State<CollectionStars> {

  bool _isCollection = true;
  int _collectionCounts = 41;

  void _collection() {
    setState(() {
      if(_isCollection) {

        _collectionCounts -= 1;
        _isCollection = false;
      } else {

        _collectionCounts += 1;
        _isCollection = true;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return new Row(
      children: <Widget>[
        new IconButton(
          icon: (_isCollection ? new Icon(Icons.star) : new Icon(Icons.star_border,color: Colors.black38)),
          color: Colors.orange,
          onPressed: _collection,
        ),
        new Text('$_collectionCounts'),
      ],
    );
  }
}

// 侧边 抽屉效果
class HomeDrawer extends StatefulWidget {
  @override
  _HomeDrawerState createState() => _HomeDrawerState();
}
class _HomeDrawerState extends State<HomeDrawer> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Drawer(
      child: new ListView(
        padding: const EdgeInsets.only(),
        children: <Widget>[
          new UserAccountsDrawerHeader(
            currentAccountPicture: new ClipOval(
              child: new Image.asset(
                'images/lf.jpg',
                fit: BoxFit.cover,
              ),
            ),
            accountName: new Text(
              'wuwenhai',
               style: new TextStyle(color: Colors.black54, fontSize: 25),
            ),
            accountEmail: new Text(
              '513433750@qq.com',
               style: new TextStyle(color: Colors.black38, fontSize: 15),),
          ),
          new ClipRect(
            child: new ListTile(
              leading: new CircleAvatar(
                backgroundColor: Colors.orange,
                child: new Text("A", style: new TextStyle(color: Colors.white),),
              ),
              title: new Text('Drawer item A',style: new TextStyle(color: Colors.orange),),
              onTap: () => {},
            ),
          ),
          new ListTile(
            leading: new CircleAvatar(
              backgroundColor: Colors.orange,
              child: new Text("B", style: new TextStyle(color: Colors.white),),
            ),
            title: new Text('Drawer item B', style: new TextStyle(color: Colors.orange),),
            subtitle: new Text("Drawer item B subtitle", style: new TextStyle(color: Colors.orange),),
            onTap: () => {},
          ),
          new AboutListTile(
            icon: new CircleAvatar(
              backgroundColor: Colors.orange,
              child: new Text("Ab", style: new TextStyle(color: Colors.white),)),
            child: new Text("About", style: new TextStyle(color: Colors.orange),),
            applicationName: "HavenApp",
            applicationVersion: "1.0",
            applicationIcon: new Image.asset(
              'images/kks.jpg',
              fit: BoxFit.cover,
              width: 64.0,
              height: 64.0,
            ),
            applicationLegalese: "wuwenhai app",
            aboutBoxChildren: <Widget>[
              new Text("这是系统自带的关于App的弹窗",style: new TextStyle(color: Colors.black38)),
              new Text("你可以直接选择使用", style: new TextStyle(color: Colors.black38))
            ],
          ),
        ],
      ),
    );
  }

}