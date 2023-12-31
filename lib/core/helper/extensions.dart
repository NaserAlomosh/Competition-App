import 'package:flutter/widgets.dart';

// Navigation extension for help me => context.pushNamed/pushReplacementNamed...()
extension Navigation on BuildContext {
  Future<dynamic> pushNamed(String routeName) {
    return Navigator.of(this).pushNamed(routeName);
  }

  Future<dynamic> pushReplacementNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this).pushReplacementNamed(routeName);
  }

  void pop() => Navigator.of(this).pop();
}
