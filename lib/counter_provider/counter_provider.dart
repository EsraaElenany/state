import 'package:flutter/cupertino.dart';

class CounterProvider extends ChangeNotifier {

  int counter = 0;

  void incrementCounter() {
    counter++;
    print(counter);
    notifyListeners();
  }
  void decrementCounter() {
    counter--;
    print(counter);
    notifyListeners();
  }
}