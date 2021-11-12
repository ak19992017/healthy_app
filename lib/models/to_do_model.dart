// ignore_for_file: unnecessary_getters_setters

import 'package:flutter/cupertino.dart';
import 'package:healthy_app/models/to_do.dart';

class ToDoModel extends ChangeNotifier {
  List<ToDo> toDoList = [
    ToDo("Today's task", "Noting much to do today"),
    ToDo("Today's task", "Noting much toooooooooooooo do today"),
    ToDo("Today's task", "Noting much to do today"),
    ToDo("Today's task", "Noting much toooooooooooooo do today"),
    ToDo("Today's task", "Noting much to do today"),
    ToDo("Today's task", "Noting much to do today"),
    ToDo("Today's task", "Noting much toooooooooooooo do today"),
    ToDo("Today's task", "Noting much to do today"),
    ToDo("Today's task", "Noting much toooooooooooooo do today"),
    ToDo("Today's task", "Noting much to do today"),
    ToDo("Today's task", "Noting much to do today"),
    ToDo("Today's task", "Noting much toooooooooooooo do today"),
    ToDo("Today's task", "Noting much to do today"),
    ToDo("Today's task", "Noting much toooooooooooooo do today"),
    ToDo("Today's task", "Noting much to do today"),
  ];

  void addToDo(String title, String task) {
    toDoList.add(ToDo(title, task));
    notifyListeners();
  }
}
