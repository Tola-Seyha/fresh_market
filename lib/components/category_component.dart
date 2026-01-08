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
              border: Border.all(), 
              color: Colors.grey[200],  
              borderRadius: BorderRadius.circular(20),
            ),
            height: 35,
             // width: 100,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),  
              child: Center(child: Text(title, style: TextStyle(fontSize: 16))),
            ),
          ),
        ),
      ),
    );
  }
}
