import 'package:flutter/material.dart';

class CurrentId with ChangeNotifier {
  int _currentId = 9;
  double _milicecond = 0.1;
  int _previosId = 9;
  int get previosId => _previosId;
  int get currentId => _currentId;
  double get milisecond => _milicecond;

  void setPrevios(int id) {
    _previosId = id;
    notifyListeners();
  }

  void setDuration(double x) {
    _milicecond = x;
    notifyListeners();
  }

  void onTab(int id) {
    _currentId = id;
    notifyListeners();
  }
}
