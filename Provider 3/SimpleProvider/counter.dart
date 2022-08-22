import 'package:flutter/foundation.dart';

class Counter extends ChangeNotifier {
  int count = 0;
  void increment() {
    count++;
    // ignore: avoid_print
    print(count);
    notifyListeners();
  }
}
