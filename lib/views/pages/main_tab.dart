import 'package:flutter/material.dart';
import 'package:ecommerce_app/views/pages/cart_page.dart';
import 'package:ecommerce_app/views/pages/favorites_page.dart';
import 'package:ecommerce_app/views/pages/home_page.dart';
import 'package:ecommerce_app/views/pages/profile_page.dart';
import 'package:ecommerce_app/views/pages/shop_page.dart';

class MainTab extends StatefulWidget {
  const MainTab({Key? key}) : super(key: key);

  @override
  State<MainTab> createState() => _MainTabState();
}

class _MainTabState extends State<MainTab> {
  var _selectedIndex = 0;

  final List<Map<String, dynamic>> _pages = [
    {'page': const HomePage(), 'title': null},
    {'page': const ShopPage(), 'title': 'Categories'},
    {'page': const CartPage(), 'title': null},
    {'page': const FavoritesPage(), 'title': 'Favorites'},
    {'page': const ProfilePage(), 'title': null},
  ];

  @override
  Widget build(BuildContext context) {
    final page = _pages[_selectedIndex]['page'];
    final title = _pages[_selectedIndex]['title'];

    return Scaffold(
      body: page,
      appBar: title != null ? AppBar(title: Text(title)) : null,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.grey[400],
        showUnselectedLabels: true,
        selectedFontSize: 10,
        unselectedFontSize: 10,
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        items: const [
          BottomNavigationBarItem(
              activeIcon: Icon(Icons.home), icon: Icon(Icons.home_outlined), label: "Home"),
          BottomNavigationBarItem(
              activeIcon: Icon(Icons.shopping_cart),
              icon: Icon(Icons.shopping_cart_outlined),
              label: "Shop"),
          BottomNavigationBarItem(
              activeIcon: Icon(Icons.shopping_bag),
              icon: Icon(Icons.shopping_bag_outlined),
              label: "Bag"),
          BottomNavigationBarItem(
              activeIcon: Icon(Icons.favorite),
              icon: Icon(Icons.favorite_outline),
              label: "Favorites"),
          BottomNavigationBarItem(
              activeIcon: Icon(Icons.account_circle),
              icon: Icon(Icons.account_circle_outlined),
              label: "Profile"),
        ],
      ),
    );
  }
}
