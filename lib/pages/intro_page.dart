import 'package:flutter/material.dart';
import 'package:fresh_market/pages/home_page.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(
              top: 120, 
              bottom: 20, 
              left: 50,  
              right: 50,
            ),
            child: Image.asset('assets/image/vegetables.png'),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Welcome to Fresh Market!",
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 30),
          Text(
            "Get your groceries delivered \n from the Fresh Market to your doorstep",
            style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            textAlign: TextAlign.center,
          ), 
          Spacer(),
          GestureDetector( 
            onTap: () { 
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return HomePage();
              },));
            },
            child: Container(
              padding: const EdgeInsets.only(
                top: 20,
                left: 100,
                right: 100,
                bottom: 20,
              ),
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                "Get Start Now",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
          ),
          Spacer()
        ],
      ),
    );
  }
}
