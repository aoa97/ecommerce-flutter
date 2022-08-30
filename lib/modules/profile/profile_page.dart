import 'package:ecommerce_app/utils/assets.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(icon: const Icon(Icons.search), onPressed: () {})],
      ),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14.0),
            child: Text(
              "My Profile",
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(AppAssets.profileAvatar),
                ),
                const SizedBox(width: 16),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Matilda Brown', style: Theme.of(context).textTheme.headline3),
                        const SizedBox(height: 5),
                        Text('matildabrown@mail.com',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(color: Colors.grey)),
                        const SizedBox(height: 2),
                        OutlinedButton(child: const Text("Sign Out"), onPressed: () {})
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
          Column(
            children: [
              ListTile(
                title: const Text(
                  "My Orders",
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                subtitle: const Text("Already have 12 orders"),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {},
              ),
              const Divider(height: 0),
              ListTile(
                title: const Text(
                  "Shipping addresses",
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                subtitle: const Text("3 addresses"),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {},
              ),
              const Divider(height: 0),
              ListTile(
                title: const Text(
                  "Payment methods",
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                subtitle: const Text("Visa  **34"),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {},
              ),
              const Divider(height: 0),
              ListTile(
                title: const Text(
                  "Promocodes",
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                subtitle: const Text("You have special promocodes"),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {},
              ),
              const Divider(height: 0),
              ListTile(
                title: const Text(
                  "My reviews",
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                subtitle: const Text("Reviews for 4 items"),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {},
              ),
              const Divider(height: 0),
              ListTile(
                title: const Text(
                  "Settings",
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                subtitle: const Text("Notifications, password"),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {},
              ),
              const Divider(height: 0),
            ],
          )
        ]),
      ),
    );
  }
}
