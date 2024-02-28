import 'package:e_commerce_app/app.dart';
import 'package:e_commerce_app/di/di.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  await configureDependencies();
  await _init();
  runApp(const MainApp());
}

Future<void> _init() async {
  // 组件初始化操作
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MyApp();
  }
}
