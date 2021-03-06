import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class ImagesAnim extends StatefulWidget {
  final Map<int, Image> imageCaches;
  final double width;
  final double height;
  final Color backColor;

  ImagesAnim(this.imageCaches, this.width, this.height, this.backColor, {Key key})
      : assert(imageCaches != null),
        super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new _WOActionImageState();
  }
}

class _WOActionImageState extends State<ImagesAnim> {
  bool _disposed;
  Duration _duration;
  int _imageIndex;
  Container _container;

  @override
  void initState() {
    super.initState();
    _disposed = false;
    _duration = Duration(milliseconds: 600);
    _imageIndex = 0;
    _container = Container(height: widget.height, width: widget.width);
    _updateImage();
  }

  void _updateImage() {
    if (_disposed || widget.imageCaches.isEmpty) {
      return;
    }

    setState(() {
      if (_imageIndex >= widget.imageCaches.length) {
        _imageIndex = 0;
      }
      _container = Container(
          color: widget.backColor,
          child: widget.imageCaches[_imageIndex],
          height: widget.height,
          width: widget.width);
      _imageIndex++;
    });
    Future.delayed(_duration, () {
      _updateImage();
    });
  }

  @override
  void dispose() {
    super.dispose();
    _disposed = true;
    widget.imageCaches.clear();
  }

  @override
  Widget build(BuildContext context) {
    return _container;
  }
}


//class FrameAnimationImage extends StatefulWidget {
//  final List<String> _assetList;
//  final double width;
//  final double height;
//  int interval = 200;
//
//  FrameAnimationImage(this._assetList, {this.width, this.height, this.interval});
//  @override State<StatefulWidget> createState() {
//
//    return _FrameAnimationImageState();
//  }
//}
//
//class _FrameAnimationImageState extends State<FrameAnimationImage> with SingleTickerProviderStateMixin {
//  //动画控制
//   Animation<double> _animation;
//   AnimationController _controller;
//   int interval = 200;
//   @override void initState() {
//     super.initState();
//
//     if (widget.interval != null) {
//       interval = widget.interval;
//     }
//     final int imageCount = widget._assetList.length;
//     final int maxTime = interval * imageCount;
//     // 启动动画controller
//      _controller = new AnimationController(
//          duration: Duration(milliseconds: maxTime), vsync: this);
//      _controller.addStatusListener((AnimationStatus status) {
//        if(status == AnimationStatus.completed) {
//          _controller.forward(from: 0.0); // 完成后重新开始
//        }
//      });
//      _animation = new Tween<double>(begin: 0, end: imageCount.toDouble()).animate(_controller)
//        ..addListener(() {
//          setState(() {
//            // the state that has changed here is the animation object’s value
//             });
//        });
//      _controller.forward();
//   }
//   @override void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//   @override Widget build(BuildContext context) {
//     int ix = _animation.value.floor() % widget._assetList.length;
//     List<Widget> images = []; // 把所有图片都加载进内容，否则每一帧加载时会卡顿
//      for (int i = 0; i < widget._assetList.length; ++i) {
//        if (i != ix) {
//          images.add(Image.asset( widget._assetList[i], width: 0, height: 0,));
//        }
//      }
//      images.add( Image.asset(
//        widget._assetList[ix],
//        width: widget.width,
//        height: widget.height,
//        fit: BoxFit.fill,
//      )
//      );
//      return Stack( alignment: AlignmentDirectional.center, children: images);
//   }
//}
