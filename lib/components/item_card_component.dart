import 'package:flutter/material.dart';

class ItemCardComponent extends StatelessWidget {
  final String imagePath;
  final String name;
  final String price;
  final void Function()? onPressed;
  

  const ItemCardComponent({
    super.key,
    required this.imagePath,
    required this.name,
    required this.price,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 1.6,
              child: Image.asset(imagePath, fit: BoxFit.contain),
            ),
            Divider(thickness: 0.5),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0), 
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(name, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                  Text("\$"+price, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                ],
              ),
            ),
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                children: [
                  Text(
                    "Avaiable",
                    style: TextStyle(fontSize: 12, color: Colors.green),
                  ),
                ],
              ),
            ),
            // Spacer(),
            SizedBox(height: 5),

            MaterialButton(
              onPressed: onPressed,
              color: Colors.green[300],
              // clipBehavior: Clip.antiAlias,
              height: 30,
              child: Text("Add to cart "),
            ),
            // Spacer(),
          ],
        ),
      ),
    );
  }
}
