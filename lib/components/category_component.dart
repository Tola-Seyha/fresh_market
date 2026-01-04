import 'package:flutter/material.dart';

class CatecoryComponent extends StatelessWidget {
  final String title;
  const CatecoryComponent({super.key, required this.title});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container( 
        height: 220,
        // width: 100,
        color: Colors.green,
        child: Text(title),
      
      
      ),
    );
  }
}