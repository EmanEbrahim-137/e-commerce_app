import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:my_s_project/screens/cart.dart';
import 'package:my_s_project/screens/favourite.dart';
import 'package:my_s_project/screens/home_screen.dart';
import 'package:my_s_project/screens/profile.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int pageIndex = 0; 

  final List<Widget> screens = [
    HomeScreen(),
    Profile(),
    Favourite(),
    Cart(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        onPressed: () {
        },
        child: Icon(Icons.qr_code, color: Colors.white, size: 30),
      ),
      
      body: screens[pageIndex], 
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: const [
          Icons.home,
          Icons.person,
          Icons.favorite,
          Icons.shopping_cart,
        ],
        activeColor: Colors.red,
        inactiveColor: Colors.grey,
        backgroundColor: Colors.white,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.smoothEdge,
        leftCornerRadius: 32,
        rightCornerRadius: 32,
        onTap: (index) {
          setState(() {
            pageIndex = index; 
          });
        },
        activeIndex: pageIndex,
      ),
    );
  }
}
