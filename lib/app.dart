import 'package:e_commerce_app/generated/l10n.dart';
import 'package:e_commerce_app/global.dart';
import 'package:e_commerce_app/pages/index/index_page.dart';
import 'package:e_commerce_app/routes.dart';
import 'package:e_commerce_app/styles/common_styles.dart';
import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  // static final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;
  // static final FirebaseAnalyticsObserver _analyticsObserver =
  //     FirebaseAnalyticsObserver(analytics: _analytics);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      // navigatorObservers: [_analyticsObserver],
      localizationsDelegates: const [
        S.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      theme: ThemeData(
        fontFamily: fontFamilyGillSans, // 全局自定义字体
      ),
      onGenerateRoute: appRoutes,
      initialRoute: IndexPage.routeName,
    );
  }
}
