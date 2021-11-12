// ignore_for_file: unnecessary_getters_setters

import 'package:flutter/cupertino.dart';

class SideBarModel extends ChangeNotifier {
  int _selectdIndex = 0;
  bool _extnded = true;

  int get selectdIndex => _selectdIndex;

  set selectdIndex(int selectdIndex) {
    _selectdIndex = selectdIndex;
    notifyListeners();
  }

  bool get extnded => _extnded;

  set extnded(bool extnded) {
    _extnded = extnded;
    notifyListeners();
  }
}
