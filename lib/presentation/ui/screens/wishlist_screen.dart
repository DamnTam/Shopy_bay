import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopy_bay/controller/main_bottomNavController.dart';
import 'package:shopy_bay/presentation/ui/utility/app_colors.dart';

import '../widgets/product_card.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  @override
  Widget build(BuildContext context) {
    return  PopScope(
      canPop: false,
      onPopInvoked: (_) {
        Get.find<MainBottomNavController>().changeIndex(2);
      },
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.primaryColor.withOpacity(.5),
            title: const Text('Wishlist'),
            centerTitle: true,
            leading: IconButton(
              onPressed: () {
                Get.find<MainBottomNavController>().changeIndex(0);
              },
              icon: const Icon(Icons.arrow_back_ios),
            ),
          ),
          body: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.02),
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: MediaQuery.of(context).orientation ==
                              Orientation.portrait
                          ? 2
                          : 3,
                      childAspectRatio: MediaQuery.of(context).size.width * 0.003,
                      mainAxisSpacing: MediaQuery.of(context).size.width * 0.02,
                    ),
                    itemCount: 18,
                    itemBuilder: (context, index) {
                      return Scaffold();
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
    );
  }
}
