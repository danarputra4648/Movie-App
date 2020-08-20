import 'package:GrubNet/view/screens/find_screen.dart';
import 'package:GrubNet/view/screens/profile_screen.dart';
import 'package:GrubNet/view/screens/top_rated_screen.dart';
import 'package:GrubNet/view/widgets/home.dart';
import 'package:get/get.dart';

class NavBarInjection extends GetxController {
  var listTitleWidget = [
    'Movie',
    'Ranking',
    'Top Rated',
    'Profile',
  ].obs;

  var listWidget = [
    Home(),
    FindScreen(),
    TopRatedScreen(),
    ProfileScreen(),
  ].obs;

  var selectedIndex = 0.obs;

  void onSelectedIndex(int index) {
    selectedIndex.value = index;
    update();
  }
}
