import 'package:flutter/material.dart';
import 'package:flutter_neteasecloudmusic/modules/video/video_screen.dart';
import 'package:flutter_neteasecloudmusic/modules/discovery/discovery_screen.dart';
import 'package:flutter_neteasecloudmusic/modules/friend/friend_screen.dart';
import 'package:flutter_neteasecloudmusic/modules/my/my_screen.dart';
import 'package:flutter_neteasecloudmusic/test/testScreenPage.dart';

class RouteUtil {

  // 跳转动画， 新页面从右边划入
  static SlideTransition createTransition(Animation<double> animation, Widget child) {
    return new SlideTransition(
      position: new Tween<Offset>(
        begin: const Offset(1.0, 0.0),
        end: const Offset(0.0, 0.0),
      ).animate(animation),
      child: child,
    );
  }

  // 跳转动画， 新页面从透明度0.5变到1.0
  static FadeTransition createOpacityTransition(Animation<double> animation, Widget child) {
    return new FadeTransition(
      opacity: animation,
      child: new FadeTransition(
        opacity:
        new Tween<double>(begin: 0.5, end: 1.0).animate(animation),
        child: child,
      ),
    );
}

  // 跳转到TestScreen页面， 并传入index值
  static routeTestScreenPage(BuildContext context, int index) {
    Navigator.of(context).push(
      new PageRouteBuilder(
        pageBuilder: (BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation) {
          // 跳转的路由对象
          return new Test_screen(index: index);
        },
        transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
          return createTransition(animation, child);
        },
        opaque: false,
      ),
    );
  }
}