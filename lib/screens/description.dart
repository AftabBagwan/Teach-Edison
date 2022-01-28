import 'package:flutter/material.dart';

import '../components/description_text.dart';

class Description extends StatefulWidget {
  const Description(
      {Key? key, this.title, this.year, this.type, this.id, this.poster})
      : super(key: key);

  final title;
  final year;
  final type;
  final id;
  final poster;

  @override
  State<Description> createState() => _DescriptionState();
}

class _DescriptionState extends State<Description> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.mic,
              )),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.language,
              )),
        ],
        title: const Text("TeachEdison Review"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              color: Colors.amber,
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(50),
              width: 230,
              height: 280,
              child: Image.network(
                widget.poster,
                cacheHeight: 250,
                cacheWidth: 200,
              ),
            ),
          ),
          DescriptionText(
            widget: widget,
            text: "Title: " + widget.title,
          ),
          DescriptionText(
            widget: widget,
            text: "Year: " + widget.year,
          ),
          DescriptionText(
            widget: widget,
            text: "Type: " + widget.type,
          ),
          DescriptionText(
            widget: widget,
            text: "imdbID: " + widget.id,
          ),
        ],
      ),
    );
  }
}
