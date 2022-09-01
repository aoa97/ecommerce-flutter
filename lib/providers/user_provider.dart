import 'package:ecommerce_app/models/user_data_model.dart';
import 'package:ecommerce_app/services/auth_services.dart';
import 'package:ecommerce_app/services/db_services.dart';
import 'package:flutter/foundation.dart';

class UserProvider with ChangeNotifier {
  final _uid = AuthServices.instance.currentUser.uid;
  final _db = DBServices.instance;
  late final UserData user;

  loadUserData() async {
    final res = await _db.getDocData('users/$_uid');
    user = UserData.fromMap(res['data'], res['id']);
  }
}
