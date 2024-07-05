import 'package:flutter/material.dart';
import 'package:foods/ui/screens/home_screen.dart';
import 'package:foods/ui/screens/profile_screen.dart';

class App extends StatefulWidget {
  static const routname = '/home';
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int _selectedIndex = 0;

  static List<Widget> _screen = [HomeScreen(), ProfileScreen()];

  void _onTappedScreen(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
        BottomNavigationBarItem(
            icon: Icon(Icons.person_pin_sharp), label: 'profile'),
      ], currentIndex: _selectedIndex, onTap: _onTappedScreen),
      body: _screen.elementAt(_selectedIndex),
    );
  }
}