import 'package:flutter/material.dart';

class User extends ChangeNotifier {
  String message = "Let's see";
  bool isEligible = false;

  void checkEligibility(int age) {
    if (age > 18) {
      message = 'Eligible';
      isEligible = true;
    } else {
      message = 'Not Eligible';
      isEligible = false;
    }

    notifyListeners();
  }
}
