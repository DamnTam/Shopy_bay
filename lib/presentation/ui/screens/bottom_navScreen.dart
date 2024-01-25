import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopy_bay/controller/category_list_controller.dart';
import 'package:shopy_bay/controller/home_carousel_product_controller.dart';
import 'package:shopy_bay/controller/main_bottomNavController.dart';
import 'package:shopy_bay/controller/popular_product_controller.dart';
import 'package:shopy_bay/presentation/ui/screens/wishlist_screen.dart';

import '../../../controller/new_product_controller.dart';
import '../../../controller/special_product_controller.dart';
import 'cart_screen.dart';
import 'categories_screen.dart';
import 'home_screen.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  final List<Widget> _screens = const [
    HomeScreen(),
    CategoriesScreen(),
    CartScreen(),
    WishlistScreen(),
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Get.find<HomeCarouselProductController>().getHomeCarouselProduct();
    Get.find<CategotyListController>().getCategoryList();
    Get.find<PopularProductController>().getPopularProduct();
    Get.find<SpecialProductController>().getSpecialProduct();
    Get.find<NewProductController>().getNewProduct();


  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<MainBottomNavController>(
        builder:(controller){
          return  Scaffold(
            body: _screens[controller.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              elevation: 5,
              onTap: (index) =>controller.changeIndex(index),
              currentIndex: controller.currentIndex,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.dashboard), label: 'Categories'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.shopping_cart_outlined), label: 'Cart'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.card_giftcard), label: 'WishList'),
              ],
            ));
        },
      ),
    );
  }
}
