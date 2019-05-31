class Utils {

  // 获取图片
  static String getImgPath(String name, {String format: 'png'}) {
    return 'images/$name.$format';
  }
}
