// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

import 'food.dart';

class Shop extends ChangeNotifier {
  final List<Food> _FoodMenu = [
    Food(
        name: "Salmon Sushi",
        price: "21.00",
        imagePath: "lib/images/nigiri.png",
        rating: "4.9",
        desc:
            "Delicate sliced, fresh salmon drapes elegantly over a pillow of perfectly seasoned sushi rice."),
    Food(
        name: "Tuna Sushi",
        price: "18.00",
        imagePath: "lib/images/sushi-3.png",
        rating: "4.8",
        desc:
            "Delicate sliced, fresh tuna drapes elegantly over a pillow of perfectly seasoned sushi rice."),
  ];

  final List<Food> _cart = [];

  List<Food> get foodMenu => _FoodMenu;
  List<Food> get cart => _cart;

  void addToCart(Food foodItem, int quantity) {
    for (int i = 0; i < quantity; i++) {
      _cart.add(foodItem);
    }
    notifyListeners();
  }

  void removeFromCart(Food food) {
    _cart.remove(food);
    notifyListeners();
  }
}
