import 'package:carousel_slider/carousel_options.dart';
import 'package:get/get.dart';

class PageInjection extends GetxController {
  var pageIndex = 0.obs;

  void onPageChanged(int index, CarouselPageChangedReason reason) {
    pageIndex.value = index;
    update();
  }
}
