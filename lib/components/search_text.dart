import 'package:flutter/material.dart';

import '../screens/search_result.dart';

class SearchText extends StatelessWidget {
  const SearchText({
    Key? key,
    required this.widget,
    required this.text,
  }) : super(key: key);

  final SearchResult widget;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
