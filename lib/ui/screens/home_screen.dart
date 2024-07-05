import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foods/data/cubit/foods/cubit/foods_cubit.dart';
import 'package:foods/data/models/foods.dart';
import 'package:foods/ui/widgets/favorite_food_widget.dart';
import 'package:foods/ui/widgets/foods_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<FoodsCubit>().fetchApiFoods();
  }

  List<Widget> buildAllFoods(List<Food> foods) {
    return foods.map((food) {
      return restaurantWidget(context, food, 90, 90);
    }).toList();
  }

  List<Widget> buildPopularFoods(List<Food> foods) {
    return foods.take(2).map((food) {
      return popular(context, food);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                //biru
                Container(
                  width: constraints.maxWidth,
                  height: 150,
                  color: const Color(0xff2B3499),
                  padding: const EdgeInsets.all(20),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Hai, Yohoho',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                          Icon(
                            Icons.notifications,
                            color: Colors.white,
                            size: 30,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        'Mau Makan Apa Nih?',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ],
                  ),
                ),

                //putih
                Container(
                  color: const Color(0xffFCFCFC),
                  width: constraints.maxWidth,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //popular
                        const Text(
                          'Popular',
                          style: TextStyle(
                            fontSize: 25,
                            color: Color(0xff2B3499),
                          ),
                        ),
                        BlocBuilder<FoodsCubit, FoodsState>(
                          builder: (context, state) {
                            if (state is FoodsLoading) {
                              return const CircularProgressIndicator();
                            } else if (state is FoodsSuccess) {
                              return SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(children: buildPopularFoods(state.response.foods)),
                              );
                            } else {
                              return const Text("Error");
                            }
                          },
                        ),

                        //All
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          'All',
                          style: TextStyle(
                            fontSize: 25,
                            color: Color(0xff2B3499),
                          ),
                        ),
                        BlocBuilder<FoodsCubit, FoodsState>(
                          builder: (context, state) {
                            if (state is FoodsLoading) {
                              return const CircularProgressIndicator();
                            } else if (state is FoodsSuccess) {
                              return Column(children: buildAllFoods(state.response.foods));
                            } else {
                              return const Text("Error");
                            }
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
