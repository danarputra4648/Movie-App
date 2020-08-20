import 'package:GrubNet/core/getx/movie_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant.dart';

class Category extends StatelessWidget {
  final genre = Get.put(MovieController());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 8),
            child: FlatButton(
              onPressed: () {},
              color: iconColor,
              textColor: Colors.white,
              child: Text('Recommend'),
            ),
          ),
          Expanded(
            child: LimitedBox(
              maxHeight: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: genre.genreViewModel.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(5),
                  child: FlatButton(
                    onPressed: () {},
                    color: disabledIconColor,
                    textColor: Colors.grey,
                    child: Text(genre.genreViewModel[index].name),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
