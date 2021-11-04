import 'dart:ui';
import 'package:flutter/material.dart';

class ExtendedFAB extends StatelessWidget {
  const ExtendedFAB({Key? key}) : super(key: key);

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
            vertical: lerpDouble(0, 5, animation.value)!,
          ),
          child: animation.value == 0
              ? FloatingActionButton(
                  child: const Icon(Icons.add),
                  onPressed: () {},
                )
              : Align(
                  alignment: AlignmentDirectional.centerStart,
                  widthFactor: animation.value,
                  child: Padding(
                    padding: const EdgeInsetsDirectional.only(start: 8),
                    child: FloatingActionButton.extended(
                      icon: const Icon(Icons.add),
                      label: const Text('CREATE'),
                      onPressed: () {},
                    ),
                  ),
                ),
        );
      },
    );
  }
}
