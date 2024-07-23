import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';


class ImageCarousel extends StatelessWidget {
  const ImageCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white70, // Set your desired background color here
      child: CarouselSlider(
        items: const [
          CarouselItem(
              imagePath: 'assets/images/home-carousel/carousel-1.png',
              caption: 'Learn New Skills'),
          CarouselItem(
              imagePath: 'assets/images/home-carousel/carousel-2.png',
              caption: 'Earn Badges'),
          CarouselItem(
              imagePath: 'assets/images/home-carousel/carousel-3.png',
              caption: 'Get job-ready'),
        ],
        options: CarouselOptions(
          height: 250.0,
          enlargeCenterPage: false,
          autoPlay: true,
          aspectRatio: 16 / 9,
          autoPlayCurve: Curves.fastOutSlowIn,
          enableInfiniteScroll: true,
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          viewportFraction: 0.5,
        ),
      ),
    );
  }
}

class CarouselItem extends StatelessWidget {
  final String imagePath;
  final String caption;

  const CarouselItem(
      {required this.imagePath, required this.caption, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(5.0),
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: Text(
            caption,
            style: const TextStyle(
              color: Color.fromRGBO(13, 18, 28, 0.867),
              fontSize: 16.0,
              backgroundColor: Colors.white70,
              fontFamily: "Lexend",
            ),
          ),
        ),
      ],
    );
  }
}
