
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sushi_restaurent_app/components/button.dart';
import 'package:sushi_restaurent_app/models/shop.dart';
import 'package:sushi_restaurent_app/themes/colors.dart';

import '../models/food.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  void removeFromCart(Food food, BuildContext context) {
    final shop = context.read<Shop>();

    shop.removeFromCart(food);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Shop>(
        builder: (context, value, child) => Scaffold(
              backgroundColor: primaryColor,
              appBar: AppBar(
                elevation: 0,
                title: const Text(
                  "My Cart",
                ),
                backgroundColor: primaryColor,
              ),
              body: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: value.cart.length,
                      itemBuilder: (context, index) {
                        final Food food = value.cart[index];

                        final String foodName = food.name;
                        final String foodPrice = food.price;

                        return Container(
                          decoration: BoxDecoration(
                              color: secondaryColor,
                              borderRadius: BorderRadius.circular(8)),
                          margin: const EdgeInsets.only(
                              left: 20, right: 20, top: 20, bottom: 20),
                          child: ListTile(
                            title: Text(
                              foodName,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              foodPrice,
                              style: TextStyle(
                                color: Colors.grey[200],
                              ),
                            ),
                            trailing: IconButton(
                              icon: Icon(
                                Icons.delete,
                                color: Colors.grey[300],
                              ),
                              onPressed: () => removeFromCart(food, context),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: MyButton(text: "Pay Now", onTap: () {}),
                  )
                ],
              ),
            ));
  }
}
