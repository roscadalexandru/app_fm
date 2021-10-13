import 'package:flutter/foundation.dart';
import 'dart:async';

class Debouncer {
  Debouncer(this.action, [this.milliseconds = 500]);
  final int milliseconds;
  final Function action;
  Timer? _timer;

  run(VoidCallback action) {
    _timer?.cancel();
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}
