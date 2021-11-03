import 'package:flutter/material.dart';

class HealthyLogo extends StatelessWidget {
  const HealthyLogo({
    Key? key,
    required bool extended,
  })  : _extended = extended,
        super(key: key);

  final bool _extended;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.favorite,
            color: Colors.red,
          ),
          if (_extended)
            const Text(
              "Healthy",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
        ],
      ),
    );
  }
}
