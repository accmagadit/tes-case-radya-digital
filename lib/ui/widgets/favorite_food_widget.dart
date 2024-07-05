import 'package:flutter/material.dart';
import 'package:foods/data/models/foods.dart';
import 'package:foods/ui/screens/detail_food.dart';
import 'package:foods/utils/extensions.dart';

Widget popular(BuildContext context, Food food,) {
  return GestureDetector(
    onTap: () {
      pushScreen(context, Detail(food: food));
    },
    child: Container(
      margin: const EdgeInsets.only(right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(boxShadow: [BoxShadow(blurRadius: 7, blurStyle: BlurStyle.outer, color: Color.fromARGB(50, 0, 0, 0), offset: Offset(0, 4))], borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Row(
              children: [
                Container(
                  width: 100,
                  height: 90,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
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
                SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      food.name,
                      style: const TextStyle(fontWeight: FontWeight.w800),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
