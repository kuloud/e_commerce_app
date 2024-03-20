import 'package:e_commerce_app/generated/l10n.dart';
import 'package:e_commerce_app/pages/index/home/home_page.dart';
import 'package:e_commerce_app/pages/index/me/me_page.dart';
import 'package:e_commerce_app/pages/index/shop/shop_page.dart';
import 'package:e_commerce_app/pages/index/warehouse/warehouse_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({super.key});

  static const routeName = '/index';

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    const ShopPage(),
    const WarehousePage(),
    const MePage(),
  ];

  final List<BottomNavigationBarItem> _barItems = [
    BottomNavigationBarItem(
      icon: const FaIcon(FontAwesomeIcons.house),
      label: S.current.tabBarHome,
    ),
    BottomNavigationBarItem(
      icon: const FaIcon(FontAwesomeIcons.shop),
      label: S.current.tabBarShop,
    ),
    BottomNavigationBarItem(
      icon: const FaIcon(FontAwesomeIcons.warehouse),
      label: S.current.tabBarWarehouse,
    ),
    BottomNavigationBarItem(
      icon: const FaIcon(FontAwesomeIcons.user),
      label: S.current.tabBarMe,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          useLegacyColorScheme: false,
          items: _barItems),
    );
  }
}
