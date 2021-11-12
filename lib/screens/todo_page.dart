import 'package:flutter/material.dart';
import 'package:healthy_app/models/to_do_model.dart';
import 'package:healthy_app/widgets/custom_card.dart';
import 'package:provider/provider.dart';

class ToDoPage extends StatelessWidget {
  const ToDoPage({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    var toDoModel = context.watch<ToDoModel>();

    List<Widget> buildCardWidgets() {
      List<Widget> widgetList = [];
      for (int i = 0; i < toDoModel.toDoList.length; i++) {
        widgetList.add(CustomCard(todo: toDoModel.toDoList[i]));
      }
      return widgetList;
    }

    return Scaffold(
      body: Wrap(
        children: buildCardWidgets(),
      ),
    );
  }
}
