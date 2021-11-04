import 'package:flutter/material.dart';
import 'package:healthy_app/widgets/custom_card.dart';

class ToDoPage extends StatelessWidget {
  const ToDoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        CustomCard(
          title: "Today's task",
          description: "Noting much to do today",
        ),
        Text("To do screen"),
        CustomCard(
          title: "Today's task",
          description: "Noting much toooooooooooooooo do today",
        ),
      ],
    );
  }
}
