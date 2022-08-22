import 'package:flutter/foundation.dart';

class Counter with ChangeNotifier {
  int count = 0;
  int point = 0;

  void increment() {
    count++;
    notifyListeners();
  }

  void decrement() {
    count--;
    notifyListeners();
  }

  void increasePoint() {
    point += 5;
    notifyListeners();
  }
}
