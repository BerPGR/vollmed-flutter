import 'package:flutter/material.dart';
import 'package:vollmed/app/app_widget.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Future.delayed(Duration(seconds: 2), () {
    runApp(const AppWidget());
  });
}
