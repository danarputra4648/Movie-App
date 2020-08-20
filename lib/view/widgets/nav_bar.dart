import 'package:GrubNet/core/getx/nav_bar_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class BottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<NavBarController>(
      init: NavBarController(),
      builder: (navigation) => BottomNavigationBar(
        currentIndex: navigation.selectedIndex.value,
        onTap: navigation.onSelectedIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.movie),
            title: Text('Movie'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.date_range),
            title: Text('Ranking'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.thumb_up),
            title: Text('Top Rated'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('Profile'),
          ),
        ],
      ),
    );
  }
}
