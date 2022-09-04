import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ecommerce_app/models/user_data_model.dart';
import 'package:ecommerce_app/modules/profile/widgets/profile_tiles.dart';
import 'package:ecommerce_app/modules/profile/widgets/user_details.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserData>(context);

    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(icon: const Icon(Icons.search), onPressed: () {})],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14.0),
              child: Text(
                "My Profile",
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
            const SizedBox(height: 24),
            UserDetails(user),
            const ProfileTiles()
          ],
        ),
      ),
    );
  }
}
