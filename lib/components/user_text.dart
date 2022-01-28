import 'package:flutter/material.dart';

class UserText extends StatelessWidget {
  const UserText({Key? key, this.icon, this.text}) : super(key: key);

  final icon;
  final text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                icon,
                size: 25,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                text,
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
        const Divider(
          thickness: 2.0,
          height: 1.0,
          color: Colors.black,
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
