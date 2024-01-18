import 'package:flutter/widgets.dart';

extension Navigation on BuildContext {
  navigateTo(String route) {
    return Navigator.pushReplacementNamed(this, route);
  }
}
