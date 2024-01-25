import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopy_bay/controller/counter_controller.dart';
import 'package:shopy_bay/controller/main_bottomNavController.dart';

import '../utility/app_colors.dart';
import '../widgets/carts/cart_screen_card.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (_) {
        Get.find<MainBottomNavController>().changeIndex(1);
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 5,
          title: const Text('Cart'),
          leading: IconButton(
              onPressed: () {
                Get.find<MainBottomNavController>().changeIndex(0);
              },
              icon: const Icon(Icons.arrow_back_ios)),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.separated(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: CartScreenCard(),
                  );
                },
                separatorBuilder: (_, __) => const SizedBox(height: 7),
              ),
            ),
            buildCheckoutContainer()
          ],
        ),
      ),
    );
  }

  Container buildCheckoutContainer() {
    return Container(
      height: 85,
      decoration: BoxDecoration(
        color: AppColors.primaryColor.withOpacity(.3),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Total Price',
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  '\$150.00',
                  style: TextStyle(
                      fontSize: 24,
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
            ElevatedButton(
                onPressed: () {},
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  child: Text('Checkout'),
                ))
          ],
        ),
      ),
    );
  }
}
