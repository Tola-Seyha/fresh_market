import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:fresh_market/components/category_component.dart';
import 'package:fresh_market/components/item_card_component.dart';
import 'package:fresh_market/models/category_model.dart';
import 'package:fresh_market/models/item_card_model.dart';
import 'package:fresh_market/pages/cart_page.dart';
import 'package:provider/provider.dart';

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
      // appBar: AppBar(title: Text("Home")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CartPage()),
          );
        },
        backgroundColor: Colors.grey[700],
        shape: CircleBorder(), 
        child: Icon(Icons.shopping_bag, size: 30, color: Colors.white),
        // shape: Border.all(),
      ),
      body: SafeArea(
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
                      margin: EdgeInsets.symmetric(horizontal: 8.0),
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
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
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
            // SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: SizedBox(
                height: 50,
                // color: Colors.amber,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categoryModel.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 2.0),
                      child: CatecoryComponent(
                        title: categoryModel[index].title,
                      ),
                    );
                  },
                ),
              ),
            ),
            Divider(),
            Expanded(
              child: Consumer<ItemCardModel>(
                builder: (context, value, child) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: GridView.builder(
                      itemCount: value.itemList.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1 / 1.3,
                      ),
                      itemBuilder: (context, index) {
                        return ItemCardComponent(
                          imagePath: value.itemList[index][0],
                          name: value.itemList[index][1],
                          price: value.itemList[index][2],
                          onPressed: () {
                            context.read<ItemCardModel>().addToCart(index);
                          },
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
