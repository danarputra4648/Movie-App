import 'package:GrubNet/constant.dart';
import 'package:GrubNet/view/routes/routes_name.dart';
import 'package:GrubNet/view/screens/detail_screen.dart';
import 'package:GrubNet/view/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Material App',
      theme: ThemeData(
          appBarTheme: AppBarTheme(
            color: primaryColor,
            elevation: 0,
          ),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: primaryColor,
            selectedItemColor: iconColor,
            unselectedItemColor: navbarIconColor,
          ),
          canvasColor: primaryColor,
          primaryTextTheme: TextTheme()),
      debugShowCheckedModeBanner: false,
      // home: HomeScreens(),
      initialRoute: '/',
      getPages: [
        GetPage(name: homeScreen, page: () => HomeScreens()),
        GetPage(name: detailScreen, page: () => DetailScreen()),
      ],
    );
  }
}
