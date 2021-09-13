import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class Logger {
  static void log({String title = 'APP', required String content}) {
    debugPrint('[$title - LOG] -> $content');
  }
}