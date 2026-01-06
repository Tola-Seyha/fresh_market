import 'package:flutter/material.dart';

class CatecoryComponent extends StatelessWidget {
  final String title;
  const CatecoryComponent({super.key, required this.title});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4),
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(20),
            ),
            height: 40,
            width: 100,
            child: Center(child: Text(title, style: TextStyle(fontSize: 16))),
          ),
        ),
      ),
    );
  }
}
