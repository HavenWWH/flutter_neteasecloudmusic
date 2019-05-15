import 'package:flutter/material.dart';
import 'package:flutter_neteasecloudmusic/utils/route_util.dart';
import 'package:flutter_neteasecloudmusic/test/testScreenPage.dart';


typedef void CartChangeCallBack(Product product, bool inCart);

class Product {
  const Product({this.name});
  final String name;
}

const List<Product> _productsList = <Product>[

  const Product(name: 'Eggs'),
  const Product(name: 'Flour'),
  const Product(name: 'oranger'),
  const Product(name: 'fisher'),
  const Product(name: 'banana'),
  const Product(name: 'apple'),
];

class Friend_screen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Friend_screen'),),
      body: FriendPage(),
    );
  }
}

class FriendPage extends StatefulWidget {
  FriendPage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _FriendPageState createState() => _FriendPageState();
}

class _FriendPageState extends State<FriendPage> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ShoppingList(
      products: _productsList,
    );
  }
}


// 商品列表
class ShoppingList extends StatefulWidget {
  ShoppingList({Key key, this.products}) : super(key: key);

  final List<Product> products;

  @override
  _ShoppingListState createState() => new _ShoppingListState();
}
class _ShoppingListState extends State<ShoppingList> {

  Set<Product> _shoppingCart = new Set<Product>();

  void _handleOnChanged(Product product, bool inCart) {
    setState(() {
      if (inCart) {

        _shoppingCart.add(product);
      } else {

        _shoppingCart.remove(product);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        color: Colors.white,
        padding: new EdgeInsets.symmetric(vertical: 8.0),
        child: new ListView.builder(
          itemCount: widget.products.length,
          itemBuilder: (BuildContext context, int index) {
            return new ShoppinglistItem(
              product: widget.products[index],
              inCart: _shoppingCart.contains(widget.products[index]),
              onCartChanged: _handleOnChanged,
              index: index,
              );
            },
          ),
        ),
      );
  }
}

// 商品列表行
class ShoppinglistItem extends StatelessWidget {

  ShoppinglistItem({Key key, this.product, this.inCart, this.onCartChanged, this.index}) : super(key: key);

  final Product product;
  final bool inCart;
  final int index;
  final CartChangeCallBack onCartChanged;

  Color _getColor(BuildContext context) {

    return inCart ? Colors.black38 : Theme.of(context).primaryColor;
  }

  TextStyle _getTextStyle(BuildContext context) {

    if(!inCart) return new TextStyle(
      color: Colors.orange,
      fontSize: 20,
    );
    return new TextStyle(
      color: Colors.black38,
      fontSize: 14,
      decoration: TextDecoration.lineThrough,
    );
  }

  // 弹窗
  void _showAlert(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) => new AlertDialog(
            title: new Text("Dialog Title"),
            content: new Text("This is my content"),
            actions:<Widget>[
              new FlatButton(child:new Text("CANCEL"), onPressed: (){
//                  Navigator.pop(context);
              },),
              new FlatButton(child:new Text("OK"), onPressed: (){
//                  Navigator.pop(context);
              },)
            ]

        ));
  }

  void _buttonClickT() {

    print('888');
  }

  @override
  Widget build(BuildContext context) {
    return new ListTile(
      onTap: () {
        onCartChanged(product, !inCart);
      },
      leading: new CircleAvatar(
        backgroundColor: _getColor(context),
        child: new Text(
          product.name[0],
          style: new TextStyle(
            fontSize: 20,
            color: Colors.black54),
        ),
      ),
      trailing: new RaisedButton(
        color: Colors.cyanAccent,
        onPressed: () {
//          _showAlert(context)
//          静态路由跳转
//          Navigator.push(
//            context,
//            new MaterialPageRoute(builder: (context) => new Test_screen(index: index,)),
//          );
//          Navigator.of(context).pushNamed('/a');
//          Navigator.of(context).pushNamed('/a/555555').then((value) {
//
//            print('$value');
//          });
          // 动态路由跳转
          RouteUtil.routeTestScreenPage(context, index);
        },
        child: new Text(
          product.name,
          style: new TextStyle(fontSize: 14, color: Colors.black38),
        ),
      ),
      title: new Text(product.name, style: _getTextStyle(context)),
      subtitle: new Text(
        '数量 10',
        style: new TextStyle(fontSize: 14, color: Colors.black38),
      ),
    );
  }
}