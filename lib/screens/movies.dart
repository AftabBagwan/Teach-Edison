import 'package:flutter/material.dart';
import 'dashboard.dart';
import 'description.dart';

class Movies extends StatelessWidget {
  const Movies({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 10,
        // shrinkWrap: true,
        itemBuilder: (context, index) {
          return Column(
            children: [
              GestureDetector(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      color: Colors.amber,
                    ),
                    child: Column(
                      children: [
                        Image.network(
                          data![index]['Poster'],
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(20),
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Description(
                        title: data![index]['Title'],
                        year: data![index]['Year'],
                        id: data![index]['imdbID'],
                        poster: data![index]['Poster'],
                        type: data![index]['Type'],
                      ),
                    ),
                  );
                },
              )
            ],
          );
        });
  }
}
