import 'package:flutter/material.dart';
import 'package:ticketapp/views/event/index_page.dart';
import 'package:ticketapp/views/widgets/app_bar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  final int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      bottomNavigationBar: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.black38, Colors.transparent],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
            ),
          ),
          BottomNavigationBar(
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white30,
            backgroundColor: Colors.transparent,
            currentIndex: _selectedIndex,
            elevation: 0,
            iconSize: 28,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.calendar_today_rounded), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.star_outline_rounded), label: 'Favorites'),
            ],
          )
        ],
      ),
      body: const EventIndexPage(),
    );
  }
}
