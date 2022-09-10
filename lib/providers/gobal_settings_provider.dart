import 'package:flutter/foundation.dart';

class GlobalSettings with ChangeNotifier {
  bool isBottomTabVisible = true;

  hideBottomTab() {
    isBottomTabVisible = false;
    notifyListeners();
  }

  showBottomTab() {
    isBottomTabVisible = true;
    notifyListeners();
  }
}
