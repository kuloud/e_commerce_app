import 'package:e_commerce_app/pages/index/index_page.dart';
import 'package:e_commerce_app/pages/not_found_page.dart';
import 'package:flutter/material.dart';

Route<dynamic>? appRoutes(RouteSettings? settings) {
  return MaterialPageRoute(builder: (context) {
    switch (settings?.name) {
      case IndexPage.routeName:
        return const IndexPage();
      default:
        return const NotFoundPage();
    }
  });
}
