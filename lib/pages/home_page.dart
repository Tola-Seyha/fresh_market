import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      body: SafeArea( 
        child: Column(
          children: [
             //Auto slide 

             // category list

             // fresh items grid view
             

             OutlinedButton(onPressed: () => Navigator.pop(context), child: Text("Back to Intro")) 
          ],
        ), 

      ),
    );
  }
}