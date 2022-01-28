import 'package:flutter/material.dart';

import '../screens/description.dart';

class DescriptionText extends StatelessWidget {
  const DescriptionText({
    Key? key,
    required this.widget,
    this.text,
  }) : super(key: key);

  final Description widget;
  final text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 30,
          fontStyle: FontStyle.italic,
        ),
      ),
    );
  }
}
