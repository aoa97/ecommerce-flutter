import 'package:flutter/material.dart';
import 'package:ecommerce_app/models/user_data_model.dart';
import 'package:ecommerce_app/services/auth_services.dart';

class UserDetails extends StatefulWidget {
  final UserData user;

  const UserDetails(this.user, {super.key});

  @override
  State<UserDetails> createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  var _loading = false;

  _signOut() async {
    setState(() => _loading = true);
    try {
      await AuthServices.instance.logout();
    } catch (e) {
      // TODO: Visual Error Handling
      print('Error');
    } finally {
      setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(widget.user.avatar!),
          ),
          const SizedBox(width: 16),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.user.email,
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  const SizedBox(height: 5),
                  Text(widget.user.name,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(color: Colors.grey)),
                  const SizedBox(height: 2),
                  OutlinedButton(
                    onPressed: _signOut,
                    child: _loading
                        ? const SizedBox(
                            width: 15,
                            height: 15,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                            ),
                          )
                        : const Text("Sign Out"),
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
