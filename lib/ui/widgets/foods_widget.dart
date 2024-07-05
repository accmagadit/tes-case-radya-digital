import 'package:flutter/material.dart';
import 'package:foods/data/models/foods.dart';
import 'package:foods/ui/screens/detail_food.dart';
import 'package:foods/utils/extensions.dart';

Widget restaurantWidget(BuildContext context, Food food, double height, double width) {
  return GestureDetector(
    onTap: () {
      pushScreen(context, Detail(food: food));
    },
    child: Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.black45,
            ),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Hero(
                  tag: food.image,
                  child: Image.network(
                    food.image,
                    fit: BoxFit.cover,
                  ),
                )),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                food.name,
                style: const TextStyle(fontWeight: FontWeight.w800),
              ),
              Text(
                food.name,
                style: const TextStyle(fontWeight: FontWeight.w300),
              ),
            ],
          )
        ],
      ),
    ),
  );
}
