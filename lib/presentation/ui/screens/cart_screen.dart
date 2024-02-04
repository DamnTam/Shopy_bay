import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopy_bay/controller/cart_controller.dart';
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
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<CartController>().getCart();
    });
  }
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
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
                Get.back();
              },
              icon: const Icon(Icons.arrow_back_ios)),
          centerTitle: true,
        ),
        body: GetBuilder<CartController>(
          builder: (cartController) {
            return Column(
                children: [
                  Expanded(
                    child: Visibility(
                      visible: cartController.isLoading==false,
                      replacement: const Center(child: CircularProgressIndicator()),
                      child: Visibility(
                        visible: cartController.cartModel.cartList?.isNotEmpty??false,
                        replacement: const Center(child: Text('No item in cart')),
                        child: ListView.separated(
                          itemCount: cartController.cartModel.cartList?.length??0,
                          itemBuilder: (context, index) {
                            return  Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: CartScreenCard(
                                cartItem: cartController.cartModel.cartList![index],
                              ),
                            );
                          },
                          separatorBuilder: (_, __) => const SizedBox(height: 7),
                        ),
                      ),
                    ),
                  ),
                  buildCheckoutContainer(
                   cartController.totalAmount
                  ),
                ],
              );
          }
        ),
      ),
    );
  }

  Container buildCheckoutContainer(RxDouble totalAmount) {
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
             Column(
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
                Obx(() => Text(
                  '৳${totalAmount}',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w600),
                ))
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
