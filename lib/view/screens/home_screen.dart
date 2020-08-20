import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:GrubNet/constant.dart';
import 'package:GrubNet/core/getx/movie_controller.dart';
import '../widgets/category.dart' as widget;
import '../widgets/recommendation.dart' as widget;
import '../widgets/dot_indicator.dart' as widget;
import '../widgets/upcoming.dart' as widget;
import '../widgets/popular_carousel.dart' as widget;

class HomeScreens extends StatelessWidget {
  static const routeName = '/';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
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
            icon: Icon(Icons.search),
            title: Text('Find'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('Profile'),
          ),
        ],
      ),
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('MOVIE'),
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
      body: GetBuilder<MovieController>(
        init: MovieController(),
        builder: (movie) => SafeArea(
            child: SingleChildScrollView(
          child: Column(
            children: [
              widget.Category(),
              widget.Recommendation(),
              widget.DotIndicator(),
              widget.Upcoming(),
              _buildLabel(),
              widget.PopularCarousel(),
            ],
          ),
        )),
      ),
    );
  }

  Widget _buildLabel() {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Popular',
            style: TextStyle(color: Colors.white, fontSize: 28),
          ),
          Text(
            'More',
            style: TextStyle(
              color: navbarIconColor,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
