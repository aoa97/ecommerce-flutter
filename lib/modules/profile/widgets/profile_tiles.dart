import 'package:flutter/material.dart';

class ProfileTiles extends StatelessWidget {
  const ProfileTiles({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}
