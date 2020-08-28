import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../core/view_model/movie_view_model.dart';

class DotIndicator extends StatelessWidget {
  final movieIndicator = Get.put(MovieViewModel());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25),
      child: AnimatedSmoothIndicator(
        activeIndex: movieIndicator.pageIndex.value,
        count: 5,
        effect: ExpandingDotsEffect(
          dotWidth: 25,
          dotHeight: 5,
          dotColor: Color(0xff363d58),
          activeDotColor: Color(0xff4575da),
          offset: 10,
          expansionFactor: 2,
        ),
      ),
    );
  }
}
