import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';

class Counter with ChangeNotifier {
  int _count = 0;
  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }
}

ChangeNotifierProvider counterProvider() {
  return ChangeNotifierProvider(create: (_) => Counter());
}
