
import 'package:cui_admission/screens/front.dart';
import 'package:cui_admission/screens/message.dart';
import 'package:cui_admission/screens/paymentscreen.dart';
import 'package:cui_admission/screens/profile.dart';
import 'package:cui_admission/screens/see_all.dart';
import 'package:flutter/material.dart';


class Bottom extends StatefulWidget {
  const Bottom({super.key});

  @override
  State<Bottom> createState() => _BottomState();
}

class _BottomState extends State<Bottom> {
  int? selectedIndex;
  int _currentIndex = 0; // Index of the selected bottom navigation bar item

  // List of pages to display
  final List<Widget> _pages = [
    Front(),
    MeassageScreen(),
    AllCoursesScreen(),
    FeePaymentApp(),
    ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex, 
        onTap: (index) {
          setState(() {
            _currentIndex = index; 
          });
        },
        type: BottomNavigationBarType.fixed, 
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Message'),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book_rounded),
            label: 'Programs',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.payment_sharp),
            label: 'ParFee',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
