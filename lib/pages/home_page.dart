import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:fresh_market/components/category_component.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

List<String> imagesSlider = [
  "assets/image/vegetables.png",
  "assets/image/fruit.png",
  "assets/image/meats.png",
];

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              //Auto slide
              CarouselSlider(
                options: CarouselOptions(
                  onPageChanged: (index, reason) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  height: 200,
                  viewportFraction: 0.9, //1 full screen
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 4),
                ),
                items: imagesSlider.map((images) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 14.0),
                        decoration: BoxDecoration(
                          image: DecorationImage(image: AssetImage(images)),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),

              // category list
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 14.0),
                    child: Text(
                      "Welcome to Fresh Market!",
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 14.0),
                    child: Text(
                      "Get Fresh Items here",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
              Divider(thickness: 1),
              SizedBox(height: 10),

              // fresh items grid view
             
              // just a sameple back button to intro page
              OutlinedButton(
                onPressed: () => Navigator.pop(context),
                child: Text("Back to Intro"),
              ),
              OutlinedButton(
                onPressed: () => Navigator.pop(context),
                child: Text("Back to Intro"),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
