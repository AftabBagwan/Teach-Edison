import 'package:flutter/material.dart';

import '../components/search_text.dart';

class SearchResult extends StatefulWidget {
  const SearchResult(
      {Key? key,
      this.title,
      this.year,
      this.released,
      this.runtime,
      this.genre,
      this.director,
      this.writer,
      this.actors,
      this.plot,
      this.language,
      this.country,
      this.awards,
      this.poster,
      this.boxoffice})
      : super(key: key);

  final title;
  final year;
  final released;
  final runtime;
  final genre;
  final director;
  final writer;
  final actors;
  final plot;
  final language;
  final country;
  final awards;
  final poster;
  final boxoffice;

  @override
  State<SearchResult> createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {
  @override
  Widget build(BuildContext context) {
    dispose();
    return Scaffold(
      appBar: AppBar(
        title: const Text("TeachEdisson"),
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
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                padding: const EdgeInsets.all(23),
                child: Image.network(
                  widget.poster,
                  height: 230,
                ),
              ),
            ),
            SearchText(
              widget: widget,
              text: "Title: " + widget.title,
            ),
            SearchText(
              widget: widget,
              text: "Year: " + widget.year,
            ),
            SearchText(
              widget: widget,
              text: "Released: " + widget.released,
            ),
            SearchText(
              widget: widget,
              text: "Runtime: " + widget.runtime,
            ),
            SearchText(
              widget: widget,
              text: "Genre: " + widget.genre,
            ),
            SearchText(
              widget: widget,
              text: "Director: " + widget.director,
            ),
            SearchText(
              widget: widget,
              text: "Writer: " + widget.writer,
            ),
            SearchText(
              widget: widget,
              text: "Actors: " + widget.actors,
            ),
            SearchText(
              widget: widget,
              text: "Plot: " + widget.plot,
            ),
            SearchText(
              widget: widget,
              text: "Language: " + widget.language,
            ),
            SearchText(
              widget: widget,
              text: "Country: " + widget.country,
            ),
            SearchText(
              widget: widget,
              text: "Awards: " + widget.awards,
            ),
            SearchText(
              widget: widget,
              text: "BoxOffice: " + widget.boxoffice,
            ),
          ],
        ),
      ),
    );
  }
}
