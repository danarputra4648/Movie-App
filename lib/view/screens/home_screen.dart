import 'package:GrubNet/core/view_model/nav_bar_view_model.dart';
import 'package:flutter/material.dart';

import 'package:GrubNet/view/widgets/nav_bar.dart';
import 'package:GrubNet/constant.dart';
import 'package:get/state_manager.dart';

class HomeScreens extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavBar(),
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GetBuilder<NavBarViewModel>(
              init: NavBarViewModel(),
              builder: (appbarName) => Text(
                appbarName.listTitleWidget
                    .elementAt(appbarName.selectedIndex.value),
              ),
            ),
            Container(
              width: 200,
              margin: const EdgeInsets.all(10),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                  filled: true,
                  fillColor: searchBoxColor,
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                  ),
                  hintText: 'Search Movies',
                ),
              ),
            ),
          ],
        ),
      ),
      body: GetBuilder<NavBarViewModel>(
        init: NavBarViewModel(),
        builder: (navigator) =>
            navigator.listWidget.elementAt(navigator.selectedIndex.value),
      ),
    );
  }
}
