import 'package:ecommerce_app/models/user_data_model.dart';
import 'package:ecommerce_app/modules/favorites/widgets/favorites_empty.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/controllers/db_controller.dart';
import 'package:ecommerce_app/models/product_model.dart';
import 'package:ecommerce_app/modules/favorites/widgets/favorites_list.dart';
import 'package:provider/provider.dart';

//TODO: AppBar shadow & filters
class FavoritesPage extends StatelessWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final favoriteIds = Provider.of<UserData>(context).favorites;
    final db = DB.instance;

    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(icon: const Icon(Icons.search), onPressed: () {})],
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              "Favorites",
              style: Theme.of(context).textTheme.headline1,
            ),
            const SizedBox(height: 24),
            if (favoriteIds.isEmpty) const FavoritesEmpty(),
            if (favoriteIds.isNotEmpty)
              Expanded(
                flex: 2,
                child: StreamBuilder(
                  stream: db.getFavoriteProducts(favoriteIds),
                  builder: (_, AsyncSnapshot<List<Product>> snap) {
                    if (snap.connectionState == ConnectionState.active) {
                      return FavoritesList(snap.data);
                    }
                    return const Center(child: CircularProgressIndicator());
                  },
                ),
              ),
          ])),
    );
  }
}
