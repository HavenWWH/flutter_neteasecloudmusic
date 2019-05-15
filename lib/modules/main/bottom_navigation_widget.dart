import 'package:flutter/material.dart';

import 'package:flutter_neteasecloudmusic/modules/video/video_screen.dart';
import 'package:flutter_neteasecloudmusic/modules/discovery/discovery_screen.dart';
import 'package:flutter_neteasecloudmusic/modules/friend/friend_screen.dart';
import 'package:flutter_neteasecloudmusic/modules/my/my_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_neteasecloudmusic/common/constant.dart';
import 'package:flutter_neteasecloudmusic/modules/account/account_screen.dart';

class BottomNavigationWidget extends StatefulWidget {
  
  BottomNavigationWidget({Key key}) : super(key: key);
  
  @override
  _BottomNavigationWidgetState createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {

  int _currentIndex = 0;
  List<Widget> screenList = List();

  BottomNavigationBarItem createBottomBarItem(String iconName, String title, double width, double height) {
    return new BottomNavigationBarItem(
      icon: new Container(
        width: width,
        height: height,
//        color: Constant.themeColor,
        child: new Image.asset(iconName),
      ),
      title: new Text(title)
    );
  }

  List<BottomNavigationBarItem> createItems () {
    List<BottomNavigationBarItem> itemsss = List();
    itemsss
      ..add(createBottomBarItem('images/discovery_normal.png', '发现', 30, 30))
      ..add(createBottomBarItem('images/video_normal.png', '视频', 30, 30))
      ..add(createBottomBarItem('images/music_normal.png', '我的', 30, 30))
      ..add(createBottomBarItem('images/friend_normal.png', '朋友', 30, 30))
      ..add(createBottomBarItem('images/account_normal.png', '账号', 30, 30));
    return itemsss;
  }

  void _selectItem(int index) {
    setState(() {
      _currentIndex = index;
    });
  }


  @override
  void initState() {
    screenList
      ..add(Discovery_screen())
      ..add(Video_screen())
      ..add(My_screen())
      ..add(Friend_screen())
      ..add(Account_screen());
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    // 适配
    //设置适配尺寸 (填入设计稿中设备的屏幕尺寸)
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    print('设备宽度:${ScreenUtil.screenWidth}');
    print('设备高度:${ScreenUtil.screenHeight}');
    print('设备的像素密度:${ScreenUtil.pixelRatio}');
    print('底部安全区距离:${ScreenUtil.bottomBarHeight}');
    print('状态栏高度:${ScreenUtil.statusBarHeight}px');
    print('实际宽度的dp与设计稿px的比例:${ScreenUtil.getInstance().scaleWidth}');
    print('实际高度的dp与设计稿px的比例:${ScreenUtil.getInstance().scaleHeight}');
    print('宽度和字体相对于设计稿放大的比例:${ScreenUtil.getInstance().scaleWidth * ScreenUtil.pixelRatio}');
    print('高度相对于设计稿放大的比例:${ScreenUtil.getInstance().scaleHeight * ScreenUtil.pixelRatio}');
    print('系统的字体缩放比例:${ScreenUtil.textScaleFactory}');

    return Scaffold(
      body: screenList[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Constant.themeColor,
        unselectedItemColor: Colors.black38,
        currentIndex: _currentIndex,
        onTap: _selectItem,
        items: createItems(),
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}