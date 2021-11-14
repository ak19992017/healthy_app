import 'package:flutter/material.dart';
import 'package:healthy_app/models/to_do_model.dart';
import 'package:healthy_app/widgets/custom_card.dart';
import 'package:provider/provider.dart';

class ToDosPage extends StatelessWidget {
  const ToDosPage({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    var toDoModel = context.watch<ToDoModel>();

    List<Widget> buildCardWidgets() {
      List<Widget> widgetList = [];
      for (int i = toDoModel.toDoList.length - 1; i >= 0; i--) {
        widgetList.add(CustomCard(todo: toDoModel.toDoList[i]));
      }
      return widgetList;
    }

    return Scaffold(
      body: GridView.count(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 25),
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        crossAxisCount: 4,
        children: buildCardWidgets(),
      ),
    );
  }
}
