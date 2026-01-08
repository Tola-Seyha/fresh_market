import 'package:flutter/cupertino.dart';

class ItemCardModel extends ChangeNotifier{

  final List _itemList = [
    ["assets/image/beef.png", "Beef", "30.50" ],
    ["assets/image/broccoli.png", "Broccoli", "20.00" ],
    ["assets/image/mutton.png", "Mutton", "20.00" ],
    ["assets/image/chicken-meat.png", "Chicken", "20.00" ],
    ["assets/image/mushroom.png", "Mushroom", "20.00" ], 
    ["assets/image/zucchini.png", "Zucchini", "20.00" ],
    ["assets/image/steak-and-meat.png", "Meat", "20.00" ],

  ];

  final List _addCart = [];

  get itemList => _itemList;
  get addCart => _addCart;

  void addToCart(index){
    _addCart.add(_itemList[index]);

    notifyListeners(); 
  }
  void removeItemeFromCart (index){
    _addCart.removeAt(index);
  
    notifyListeners();
  }


  

}