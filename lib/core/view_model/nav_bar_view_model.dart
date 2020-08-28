import 'package:get/get.dart';

import '../../view/screens/find_screen.dart';
import '../../view/screens/profile_screen.dart';
import '../../view/screens/top_rated_screen.dart';
import '../../view/widgets/home.dart';

class NavBarViewModel extends GetxController {
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
