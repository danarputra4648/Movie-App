import 'package:GrubNet/core/getx/movie_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class DotIndicator extends StatelessWidget {
  final movieIndicator = Get.put(MovieController());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25),
      child: AnimatedSmoothIndicator(
        activeIndex: movieIndicator.pageIndex.value,
        count: movieIndicator.recommendViewModel
                    .map((e) => e.posterImg)
                    .length >=
                5
            ? 5
            : movieIndicator.recommendViewModel.map((e) => e.posterImg).length,
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
