// ignore_for_file: unnecessary_getters_setters

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ToDoModel extends ChangeNotifier {
  List<ToDo> toDoList = [
    ToDo("Become an inspiration to others", true),
    ToDo("Master a difficult skill", false),
    ToDo("Gain a more positive mindset", false),
    ToDo("Learn about how to become a millionaire.", true),
    ToDo("Go on a trip around the world.", false),
    ToDo("Invest in the stock market", false),
    ToDo("Regularly call your parents", false),
    ToDo("Build your dream house", false),
  ];

  void addToDo(String task) {
    toDoList.insert(0, ToDo(task, false));
    notifyListeners();
  }

  void removeToDo(int index) {
    toDoList.removeAt(index);
    notifyListeners();
  }

  void updateToDo(String newText, int index) {
    toDoList[index].task = newText;
    notifyListeners();
  }
}

class ToDo {
  String task;
  bool completed = false;
  ToDo(this.task, this.completed);
}
