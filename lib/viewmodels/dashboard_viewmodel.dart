import 'package:flutter/material.dart';
import '../views/simple_interest_view.dart';
import '../views/area_of_circle_view.dart';
import '../views/arithmetic_view.dart';

class DashboardViewModel {
  int currentIndex = 0;

  void updateIndex(int index) {
    currentIndex = index;
  }

  Widget getCurrentView() {
    switch (currentIndex) {
      case 0:
        return const Center(child: Text('Welcome to the Dashboard'));
      case 1:
        return const SimpleInterestView();
      case 2:
        return const AreaOfCircleView();
      case 3:
        return const ArithmeticView();
      default:
        return const Center(child: Text('Invalid View'));
    }
  }
}
