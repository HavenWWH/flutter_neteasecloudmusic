

class BaseMode<T>{

  final int code;
  final String errorMsg;
  final T data;

  const BaseMode({this.code, this.errorMsg, this.data});
}