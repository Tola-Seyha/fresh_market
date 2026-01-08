import 'package:flutter/material.dart';
import 'package:fresh_market/models/item_card_model.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Cart",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),
      body: Consumer<ItemCardModel>(
        builder: (context, value, child) {
          return ListView.builder(
            itemCount: value.addCart.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.fromLTRB(14, 8, 14, 8),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  height: 70,
                  color: Colors.grey[100],
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [
                      Image.asset(value.addCart[index][0], height: 50),
                      Text(
                        value.addCart[index][1],
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      // Divider(),
                      VerticalDivider(thickness: 0.5),
                      Text(
                        "\$ " + value.addCart[index][2],
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      IconButton(
                        onPressed: () {
                          context.read<ItemCardModel>().removeItemeFromCart(
                            index,
                          );
                        },
                        icon: Icon(Icons.delete, color: Colors.red),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
