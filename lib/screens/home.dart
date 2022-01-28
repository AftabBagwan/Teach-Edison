import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'dashboard.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              "Hello, TeachEdison",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 35, bottom: 25, left: 30, right: 30),
            child: CarouselSlider.builder(
              itemCount: carouselImages.length,
              itemBuilder: (context, index, realIndex) {
                final urlImage = carouselImages[index];
                return Image.network(
                  urlImage,
                  fit: BoxFit.cover,
                );
              },
              options: CarouselOptions(
                enlargeCenterPage: true,
                height: 380,
                reverse: true,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 2),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
