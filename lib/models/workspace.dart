import 'package:flutter/material.dart';

class WorkspaceStatus extends ChangeNotifier {
  bool _teacherViewVisible = false;
  bool _communicationViewVisible = false;

  bool get teacherViewVisible => _teacherViewVisible;
  void toggleTeacherViewVisible() {
    _teacherViewVisible = !_teacherViewVisible;
    notifyListeners();
  }

  bool get communicationViewVisible => _communicationViewVisible;
  void toggleCommunicationViewVisible() {
    _communicationViewVisible = !_communicationViewVisible;
    notifyListeners();
  }
}
