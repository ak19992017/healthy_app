// ignore_for_file: prefer_const_constructors

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:healthy_app/models/to_do_model.dart';
import 'package:healthy_app/widgets/custom_card.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ToDosPage extends StatefulWidget {
  const ToDosPage({Key? key}) : super(key: key);

  @override
  State<ToDosPage> createState() => _ToDosPageState();
}

class _ToDosPageState extends State<ToDosPage> {
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

    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        if (sizingInformation.deviceScreenType == DeviceScreenType.desktop) {
          return GridView.count(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 25),
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            crossAxisCount: 4,
            children: buildCardWidgets(),
          );
        }
        if (toDoModel.toDoList.isEmpty) {
          return Center(
            child: Column(
              children: [
                Text("To Do",
                    style:
                        TextStyle(fontSize: 60, fontWeight: FontWeight.bold)),
                ElevatedButton.icon(
                  label: Text("Add Task"),
                  icon: Icon(EvaIcons.plus),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.black),
                  ),
                  onPressed: () => _displayCreateDialog(context),
                ),
                Text("No task. Add now")
              ],
            ),
          );
        }
        return ListView.builder(
          itemCount: toDoModel.toDoList.length,
          itemBuilder: (context, index) {
            if (index == 0) {
              return Column(
                children: [
                  Text("To Do",
                      style:
                          TextStyle(fontSize: 60, fontWeight: FontWeight.bold)),
                  ElevatedButton.icon(
                    label: Text("Add Task"),
                    icon: Icon(EvaIcons.plus),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.black),
                    ),
                    onPressed: () => _displayCreateDialog(context),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 8, bottom: 8, left: 12, right: 12),
                    child: ListTile(
                      title: Text(
                        toDoModel.toDoList[index].task,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          decoration: toDoModel.toDoList[index].completed
                              ? TextDecoration.lineThrough
                              : null,
                          decorationThickness:
                              toDoModel.toDoList[index].completed ? 3 : null,
                        ),
                      ),
                      // subtitle: Text(toDoModel.toDoList[index].task),
                      leading: toDoModel.toDoList[index].completed
                          ? Icon(EvaIcons.checkmark,
                              color: Colors.white, size: 35)
                          : Icon(EvaIcons.bulb, color: Colors.yellow, size: 35),
                      trailing: IconButton(
                        icon: Icon(EvaIcons.trash2Outline),
                        color: Colors.white,
                        onPressed: () =>
                            setState(() => toDoModel.removeToDo(index)),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      tileColor: Colors.redAccent,
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                      onTap: () => setState(() => toDoModel.toDoList[index]
                          .completed = !toDoModel.toDoList[index].completed),
                      onLongPress: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            TextEditingController _task = TextEditingController(
                                text: toDoModel.toDoList[index].task);
                            return AlertDialog(
                              title: Text("Update your TASK"),
                              content: TextFormField(
                                controller: _task,
                              ),
                              actions: [
                                ElevatedButton(
                                  child: const Text('UPDATE'),
                                  onPressed: () {
                                    // print(_task.text);
                                    toDoModel.updateToDo(_task.text, index);
                                    Navigator.of(context).pop();
                                  },
                                ),
                                TextButton(
                                  child: const Text('CANCEL'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              );
            }

            return Padding(
              padding:
                  const EdgeInsets.only(top: 8, bottom: 8, left: 12, right: 12),
              child: ListTile(
                title: Text(
                  toDoModel.toDoList[index].task,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    decoration: toDoModel.toDoList[index].completed
                        ? TextDecoration.lineThrough
                        : null,
                    decorationThickness:
                        toDoModel.toDoList[index].completed ? 3 : null,
                  ),
                ),
                // subtitle: Text(toDoModel.toDoList[index].task),
                leading: toDoModel.toDoList[index].completed
                    ? Icon(EvaIcons.checkmark, color: Colors.white, size: 35)
                    : Icon(EvaIcons.bulb, color: Colors.yellow, size: 35),
                trailing: IconButton(
                  icon: Icon(EvaIcons.trash2Outline),
                  color: Colors.white,
                  onPressed: () => setState(() => toDoModel.removeToDo(index)),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                tileColor: Colors.redAccent,
                contentPadding:
                    EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                onTap: () => setState(() => toDoModel.toDoList[index]
                    .completed = !toDoModel.toDoList[index].completed),
                onLongPress: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      TextEditingController _task = TextEditingController(
                          text: toDoModel.toDoList[index].task);
                      return AlertDialog(
                        title: Text("Update your TASK"),
                        content: TextFormField(
                          controller: _task,
                        ),
                        actions: [
                          ElevatedButton(
                            child: const Text('UPDATE'),
                            onPressed: () {
                              // print(_task.text);
                              toDoModel.updateToDo(_task.text, index);
                              Navigator.of(context).pop();
                            },
                          ),
                          TextButton(
                            child: const Text('CANCEL'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            );
          },
        );
      },
    );
  }

  _displayCreateDialog(BuildContext context) {
    TextEditingController _task = TextEditingController();

    //Create AlertDialog
    AlertDialog alert = AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      title: const Text('Add a task to your list'),
      content: SizedBox(
        child: TextFormField(
          autofocus: true,
          decoration: InputDecoration(hintText: 'Enter task here'),
          controller: _task,
        ),
      ),
      actions: <Widget>[
        ElevatedButton(
          child: const Text('ADD'),
          onPressed: () {
            context.read<ToDoModel>().addToDo(_task.text);
            // print(_title.value.toString());
            // print(_title.text);
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: const Text('CANCEL'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );

    //show the dialog
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
