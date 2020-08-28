import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

import '../../core/view_model/nav_bar_view_model.dart';

class BottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<NavBarViewModel>(
      init: NavBarViewModel(),
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
