// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:healthy_app/screens/chat/widgets/chat_details.dart';
import 'package:healthy_app/screens/chat/widgets/conversations.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ChatsPage extends StatelessWidget {
  const ChatsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        if (sizingInformation.deviceScreenType == DeviceScreenType.desktop) {
          return Row(
            children: const [
              Expanded(flex: 2, child: Conversations()),
              Expanded(flex: 3, child: ChatDetails()),
            ],
          );
        }
        return ChatDetails();
      },
    );
  }
}
