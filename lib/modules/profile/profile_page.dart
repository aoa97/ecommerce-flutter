import 'package:ecommerce_app/utils/assets.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(icon: const Icon(Icons.search), onPressed: () {})],
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              "My Profile",
              style: Theme.of(context).textTheme.headline1,
            ),
            const SizedBox(height: 24),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(AppAssets.profileAvatar),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Matilda Brown', style: Theme.of(context).textTheme.headline3),
                    const SizedBox(height: 5),
                    Text('matildabrown@mail.com',
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(color: Colors.grey)),
                  ],
                )
              ],
            ),
            const SizedBox(height: 46),
            Text("List")
          ])),
    );
  }
}
