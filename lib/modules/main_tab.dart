import 'package:ecommerce_app/models/cart_item_model.dart';
import 'package:ecommerce_app/providers/gobal_settings_provider.dart';
import 'package:ecommerce_app/utils/routing.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'package:ecommerce_app/modules/cart/cart_page.dart';
import 'package:ecommerce_app/modules/favorites/favorites_page.dart';
import 'package:ecommerce_app/modules/home/home_page.dart';
import 'package:ecommerce_app/modules/profile/profile_page.dart';
import 'package:provider/provider.dart';

class MainTab extends StatefulWidget {
  const MainTab({Key? key}) : super(key: key);

  @override
  State<MainTab> createState() => _MainTabState();
}

class _MainTabState extends State<MainTab> {
  var _selectedIndex = 0;

  final List<Widget> _pages = const [
    HomePage(),
    Navigator(onGenerateRoute: onGenerateShopStack),
    CartPage(),
    FavoritesPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    final visible = Provider.of<GlobalSettings>(context).isBottomTabVisible;

    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: Visibility(
        visible: visible,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.grey[400],
          showUnselectedLabels: true,
          selectedFontSize: 10,
          unselectedFontSize: 10,
          currentIndex: _selectedIndex,
          onTap: (index) => setState(() => _selectedIndex = index),
          items: [
            const BottomNavigationBarItem(
              activeIcon: Icon(Icons.home),
              icon: Icon(Icons.home_outlined),
              label: "Home",
            ),
            const BottomNavigationBarItem(
              activeIcon: Icon(Icons.shopping_cart),
              icon: Icon(Icons.shopping_cart_outlined),
              label: "Shop",
            ),
            BottomNavigationBarItem(
              activeIcon: const Icon(Icons.shopping_bag),
              icon: Badge(
                  showBadge: true,
                  badgeContent:
                      Consumer<List<CartItem>>(builder: (_, cart, __) {
                    int total = 0;
                    for (var e in cart) {
                      total += e.qty;
                    }
                    return Text(total.toString(),
                        style: const TextStyle(
                          fontSize: 11,
                          color: Colors.white,
                        ));
                  }),
                  child: const Icon(Icons.shopping_bag_outlined)),
              label: "Bag",
            ),
            const BottomNavigationBarItem(
              activeIcon: Icon(Icons.favorite),
              icon: Icon(Icons.favorite_outline),
              label: "Favorites",
            ),
            const BottomNavigationBarItem(
              activeIcon: Icon(Icons.account_circle),
              icon: Icon(Icons.account_circle_outlined),
              label: "Profile",
            ),
          ],
        ),
      ),
    );
  }
}
