import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:fresh_market/components/category_component.dart';
import 'package:fresh_market/models/category_model.dart';

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

List<CategoryModel> categoryModel = [
  CategoryModel(title: "All"),
  CategoryModel(title: "Fruit"),
  CategoryModel(title: "Vegetable"),
  CategoryModel(title: "Meat"),
];

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home")),
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
              // Container(
              //   height: 100,
              //   color: Colors.amber,
              //   child: ListView.builder(
              //     // scrollDirection: Axis.horizontal,
              //     itemCount: categoryModel.length,
              //     itemBuilder: (context, index) {
              //       return CatecoryComponent(title: categoryModel[index].title);
              //     },
              //   ),
              // ),

              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 14),
                child: Container(
                  height: 80,   
                  // color: Colors.amber,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categoryModel.length,
                    itemBuilder: (context, index) {
                      return CatecoryComponent(title: categoryModel[index].title);
                    },
                  ),
                ),
              ),
              


            ],
          ),
        ),
      ),
    );
  }
}
