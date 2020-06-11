import 'package:flutter/services.dart';

class NativeText{
  final _platform = MethodChannel('com.goandreus/native_text');

  Future<String> getText(String text) async {
   String result = await _platform.invokeMethod('getText');

   return result;
  }
}