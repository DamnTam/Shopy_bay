import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopy_bay/controller/create_wish_list_controller.dart';
import 'package:shopy_bay/controller/product_wish_list_controller.dart';

import '../../../data/models/product_model.dart';
import '../screens/product_details_screen.dart';
import '../utility/app_colors.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool isFav = false;

  @override
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(ProductDetailsScreen(
          id: widget.product.id ?? 0,
        ));
      },
      child: AspectRatio(
        aspectRatio: MediaQuery.of(context).size.height * 0.0012,
        child: Card(
          margin: const EdgeInsets.only(right: 12),
          elevation: 0,
          color: AppColors.primaryColor.withOpacity(.3),
          child: Column(
            children: [
              const SizedBox(height: 10),
              Image.network(
                widget.product.image.toString(),
                width: MediaQuery.of(context).size.width * 0.20,
                fit: BoxFit.fitWidth,
              ),
              const SizedBox(height: 16),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                      border: Border.all(color: Colors.grey.withOpacity(.5))),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.015,
                        vertical: 1),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.product.title.toString(),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.035,
                              fontWeight: FontWeight.w600),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  '\$${widget.product.price.toString()}',
                                  style: TextStyle(
                                      color: AppColors.primaryColor,
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.035,
                                      fontWeight: FontWeight.w700),
                                ),
                                SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.015),
                                Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                  size:
                                      MediaQuery.of(context).size.width * 0.035,
                                ),
                                Text(
                                  widget.product.star.toString(),
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.035,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),

                            //const SizedBox(width: 15),

                            GetBuilder<CreateWishListController>(
                                builder: (createWishListController) {
                              return InkWell(
                                onTap: () {
                                  setState(() {
                                    isFav = !isFav;
                                    if (isFav) {
                                      createWishListController.createWishList(
                                          widget.product.id ?? 0);
                                      Get.showSnackbar(
                                        GetSnackBar(
                                          title: 'Added to wishlist',
                                          message: 'Product added to wishlist',
                                          duration: const Duration(seconds: 2),
                                        ),
                                      );
                                    } else {
                                      createWishListController.removeWishList(
                                          widget.product.id ?? 0);
                                      Get.showSnackbar(
                                        GetSnackBar(
                                          title: 'Removed from wishlist',
                                          message: 'Product removed from wishlist',
                                          duration: const Duration(seconds: 2),
                                        ),
                                      );
                                    }
                                  });
                                },
                                child: GetBuilder<ProductWishListController>(
                                  init: Get.find<ProductWishListController>(),
                                    builder: (productWishListController) {
                                      bool isFav = productWishListController.wishListProductIds().contains(widget.product.id);
                                  return Card(
                                    color: AppColors.primaryColor,
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(3.0),
                                      child: isFav
                                          ? Icon(
                                              Icons.favorite,
                                              color: Colors.red,
                                              size: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.035,
                                            )
                                          : Icon(
                                              Icons.favorite_border,
                                              color: Colors.white,
                                              size: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.035,
                                            ),
                                    ),
                                  );
                                }),
                              );
                            }),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
