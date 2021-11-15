import 'package:flutter/material.dart';
import 'package:healthy_app/screens/chat/widgets/chat_details.dart';
import 'package:healthy_app/screens/chat/widgets/conversations.dart';

class ChatsPage extends StatelessWidget {
  const ChatsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Expanded(
          flex: 2,
          child: Conversations(),
        ),
        Expanded(
          flex: 3,
          child: ChatDetails(),
        ),
      ],
    );
  }
}
