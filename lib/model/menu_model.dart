
const String wx = '微信好友';
const String wx_circle = '微信朋友圈';
const String qq = 'QQ';


class Menu {
  final int index;
  final String title;
  final String icon;
  const Menu({this.index,this.title, this.icon});
}

// 分享
const List<Menu> menus_share = const <Menu>[
  const Menu(index: 0,title: wx, icon: "images/icon_wx.png"),
  const Menu(index: 1,title: wx_circle, icon: "images/icon_circle.png"),
];

// 授权登录
const List<Menu> menus_login = const <Menu>[
  const Menu(index: 0,title: wx, icon: "images/icon_wx.png"),
  const Menu(index: 1,title: qq, icon: "images/icon_sina.png"),
];
