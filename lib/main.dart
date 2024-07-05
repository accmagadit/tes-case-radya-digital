import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:foods/data/cubit/foods/cubit/foods_cubit.dart';
import 'package:foods/ui/screens/home_screen.dart';
import 'package:foods/ui/screens/splash_screen.dart';
import 'env/env.dart' as AppEnv;
import 'package:flutter_bloc/flutter_bloc.dart';

void main(List<String> args) async {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => FoodsCubit(),
        child: const HomeScreen(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.routename,
      routes: {
        SplashScreen.routename: (context) => const SplashScreen(),
      },
    );
  }
}

class Config {
  static const String baseUrl = kDebugMode ? AppEnv.BASE_URL : AppEnv.BASE_URL;
}
