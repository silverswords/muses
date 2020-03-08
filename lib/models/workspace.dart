import 'package:flutter/material.dart';

class WorkspaceStatus extends ChangeNotifier {
  bool _teacherViewVisible = false;
  bool _communicationViewVisible = false;

  bool get teacherViewVisible => _teacherViewVisible;
  set teacherViewVisible(bool v) {
    if (_teacherViewVisible != v) {
      _teacherViewVisible = v;
      notifyListeners();
    }
  }

  bool get communicationViewVisible => _communicationViewVisible;
  set communicationViewVisible(bool v) {
    if (_communicationViewVisible != v) {
      _communicationViewVisible = v;
      notifyListeners();
    }
  }

  void hiddenAll() {
    if (_teacherViewVisible || _communicationViewVisible) {
      _teacherViewVisible = false;
      _communicationViewVisible = false;
      notifyListeners();
    }
  }
}
