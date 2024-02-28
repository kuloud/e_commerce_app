import 'package:e_commerce_app/generated/l10n.dart';
import 'package:e_commerce_app/global.dart';
import 'package:e_commerce_app/pages/index/index_page.dart';
import 'package:e_commerce_app/routes.dart';
import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      localizationsDelegates: const [
        S.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      onGenerateRoute: appRoutes,
      initialRoute: IndexPage.routeName,
    );
  }
}
