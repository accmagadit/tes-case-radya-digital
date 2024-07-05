// ignore_for_file: use_build_context_synchronously

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:foods/ui/widgets/app.dart';
import 'package:foods/utils/assets.dart';
import 'package:foods/utils/extensions.dart';

class SplashScreen extends StatelessWidget {
  static const routename = '/splash_screen';

  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 2), () {
      pushScreen(context, const App(), RouteTransition.fade);
    });

    return Scaffold(
      backgroundColor: const Color(0xffFCFCFC),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(),
            Image.asset(img_logo),
            const Padding(
              padding: EdgeInsets.only(bottom: 15),
              child: Text(
                'v 1.0.0',
                style: TextStyle(fontSize: 25),
              ),
            )
          ],
        ),
      ),
    );
  }
}
