import 'package:flutter/material.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:untitled2/screens/discounts_screen.dart';
import '../screens/home_screen.dart';
import '../screens/menu_screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  // قائمة الصفحات
  final List<Widget> _pages = [
    const HomeScreen(), // الصفحة الرئيسية
    const DiscountsScreen(), // صفحة الكوبونات
    const MenuScreen(), // صفحة القائمة
  ];

  @override
  Widget build(BuildContext context) {
   // Color transparentBlue = Colors.blue.withOpacity(0.5);
    return Scaffold(
      extendBody: true,

      backgroundColor: Colors.white.withValues(alpha: 10.0),


      body: _pages[_selectedIndex], // الصفحة الحالية
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(15),
        child: CustomNavigationBar(

          iconSize: 30.0,

          selectedColor: Colors.purple,
          strokeColor: Colors.purple.withOpacity(0.5),
          unSelectedColor: Colors.grey,
          backgroundColor: Colors.white,
          borderRadius: const Radius.circular(100.0),
          items: [
            CustomNavigationBarItem(icon: Icon(Icons.home), title: Text('الرئيسية')),
            CustomNavigationBarItem(icon: Icon(Icons.discount), title: Text('الكوبونات')),
            CustomNavigationBarItem(icon: Icon(Icons.menu), title: Text('القائمة')),
          ],
          currentIndex: _selectedIndex,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
      ),
    );
  }
}