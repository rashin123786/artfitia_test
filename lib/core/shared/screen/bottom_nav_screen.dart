import 'package:artifitia_test/core/theme/app_theme.dart';
import 'package:artifitia_test/features/home/presentation/controller/home_controller.dart';
import 'package:artifitia_test/features/home/presentation/screen/home_screen.dart.dart';
import 'package:artifitia_test/features/home/presentation/screen/search_screen.dart.dart';
import 'package:artifitia_test/features/home/presentation/screen/setting_screen.dart';
import 'package:artifitia_test/features/home/presentation/screen/wishlist_screen.dart';
import 'package:artifitia_test/features/home/presentation/widgets/bottom_nav_widget.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class BottomNavScreen extends StatelessWidget {
  BottomNavScreen({super.key});
  final List<Widget> pages = [
    HomeScreen(),
    WishlistScreen(),
    SearchScreen(),
    SettingScreen()
  ];
  final controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => pages[controller.currentIndex.value]),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(60),
        ),
        child: Icon(
          Icons.shopping_cart_outlined,
          color: Colors.white,
        ),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
          surfaceTintColor: Colors.white,
          shadowColor: const Color.fromARGB(255, 213, 213, 213),
          color: Colors.white,
          notchMargin: 0,
          padding: EdgeInsets.all(0),
          elevation: 0,
          child: BottomNavBarWidget()),
    );
  }
}
