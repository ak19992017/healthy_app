// ignore_for_file: prefer_const_constructors

import 'dart:ui';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:healthy_app/models/to_do_model.dart';
import 'package:provider/provider.dart';

class ExtendedFAB extends StatefulWidget {
  const ExtendedFAB({Key? key}) : super(key: key);

  @override
  State<ExtendedFAB> createState() => _ExtendedFABState();
}

class _ExtendedFABState extends State<ExtendedFAB> {
  @override
  Widget build(BuildContext context) {
    final Animation<double> animation =
        NavigationRail.extendedAnimation(context);

    return AnimatedBuilder(
      animation: animation,
      builder: (BuildContext context, Widget? child) {
        // The extended fab has a shorter height than the regular fab.
        return Container(
          height: 56,
          padding: EdgeInsets.symmetric(
            vertical: lerpDouble(0, 1, animation.value)!,
          ),
          child: animation.value == 0
              ? FloatingActionButton(
                  child: const Icon(EvaIcons.plus),
                  onPressed: () => _displayDialog(context),
                  tooltip: "Add task",
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  backgroundColor: Colors.black,
                )
              : FloatingActionButton.extended(
                  icon: const Icon(Icons.add),
                  label: const Text('CREATE'),
                  onPressed: () => _displayDialog(context),
                  tooltip: "Add task",
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  backgroundColor: Colors.black,
                ),
        );
      },
    );
  }

  _displayDialog(BuildContext context) {
    TextEditingController _task = TextEditingController();

    //Create AlertDialog
    AlertDialog alert = AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      title: const Text('Add a task to your list'),
      content: SizedBox(
        child: TextField(
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
