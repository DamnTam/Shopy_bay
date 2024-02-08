import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopy_bay/controller/add_to_cart_controller.dart';
import 'package:shopy_bay/controller/auth_controller.dart';
import 'package:shopy_bay/data/models/product_details_model.dart';
import 'package:shopy_bay/presentation/ui/screens/AuthScreen/email_screen.dart';
import 'package:shopy_bay/presentation/ui/screens/ShopScreen/cart_screen.dart';
import 'package:shopy_bay/presentation/ui/screens/ShopScreen/review_screen.dart';
import 'package:shopy_bay/presentation/ui/widgets/product_details/products_details_carousel.dart';
import '../../../../controller/product_details_controller.dart';
import '../../utility/app_colors.dart';
import '../../widgets/product_details/color_selector.dart';
import '../../widgets/product_details/size_selector.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key, required this.id});

  final int id;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  Color? _isSelectedColor;
  String? _isSelectedSize;

  @override
  void initState() {
    // TODO: implement initStatee
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Get.find<ProductDetailsController>().getProductDetails(widget.id);
    });
  }

  int counter = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
      ),
      body: GetBuilder<ProductDetailsController>(
          builder: (productDetailsController) {
        return Visibility(
          visible: productDetailsController.isLoading == false,
          replacement: const Center(child: CircularProgressIndicator()),
          child: Visibility(
            visible: productDetailsController.isDataLoaded == true,
            replacement: const Center(child: Text('No Data Available',style: TextStyle(fontSize: 20),)),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        ProductDetailsCarousel(onTap: () {}, imageUrls: [
                          productDetailsController.productDetails.img1 ?? '',
                          productDetailsController.productDetails.img2 ?? '',
                          productDetailsController.productDetails.img3 ?? '',
                          productDetailsController.productDetails.img4 ?? '',
                        ]),
                        const SizedBox(height: 10),
                        Visibility(
                          visible: productDetailsController.isLoading == false,
                          replacement: const Center(
                            child: LinearProgressIndicator(),
                          ),
                          child: ProductDetailsBody(
                            productDetails: productDetailsController.productDetails,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                buildCheckoutContainer(
                    productDetails: productDetailsController.productDetails)
              ],
            ),
          ),
        );
      }),
    );
  }

  Container buildCheckoutContainer({required ProductDetails productDetails}) {
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
                  'Price',
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  '\$${productDetails.product?.price ?? ''}',
                  style: TextStyle(
                      fontSize: 24,
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
            GetBuilder<AddToCartController>(builder: (addToCartController) {
              return Visibility(
                visible: addToCartController.isLoading == false,
                replacement: const Center(
                  child: CircularProgressIndicator(),
                ),
                child: ElevatedButton(
                    onPressed: () async {
                      log(Get.find<AuthController>().token.toString());
                      if (Get.find<AuthController>().token == null) {
                        Get.showSnackbar(GetSnackBar(
                          message: 'Please Login First',
                          duration: const Duration(seconds: 2),
                        ));
                        Get.offAll(() => const EmailScreen());
                        return;
                      } else {
                        log('is color selected $_isSelectedColor');
                        log('is size selected $_isSelectedSize');
                        if (_isSelectedColor != null &&
                            _isSelectedSize != null) {
                          final strColor = colorToColorName(_isSelectedColor!);
                          log('is color selected $_isSelectedColor');
                          final response = await Get.find<AddToCartController>()
                              .addToCart(widget.id, strColor, _isSelectedSize!,
                                  counter);
                          log(response.toString());
                          if (response) {
                            Get.showSnackbar(GetSnackBar(
                              message: 'Added cart!!',
                              title: 'Cart added!!',
                              duration: const Duration(seconds: 2),
                            ));
                             Get.to(() => CartScreen(id:widget.id,strColor: strColor,selectedSize: _isSelectedSize,cnt:counter));
                          } else {
                            Get.showSnackbar(GetSnackBar(
                              message:
                                  Get.find<AddToCartController>().errorMessage,
                              duration: const Duration(seconds: 2),
                            ));
                            Get.offAll(() => const EmailScreen());
                          }
                        }
                      }
                    },
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      child: Text('Add to Cart'),
                    )),
              );
            })
          ],
        ),
      ),
    );
  }

  Padding ProductDetailsBody({required ProductDetails productDetails}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                  child: Text(
                productDetails.product?.title ?? '',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
              )),
              InkWell(
                onTap: () {
                  setState(() {
                    if (counter > 1) counter--;
                  });
                },
                child: buildCounterContainer(
                    icon: const Icon(Icons.remove),
                    color: counter == 1 ? Colors.grey : AppColors.primaryColor),
              ),
              const SizedBox(width: 5),
              Text('$counter', style: TextStyle(fontSize: 24)),
              const SizedBox(width: 5),
              InkWell(
                onTap: () {
                  setState(() {
                    counter++;
                  });
                },
                child: buildCounterContainer(
                    icon: const Icon(Icons.add), color: AppColors.primaryColor),
              )
            ],
          ),
          Row(
            children: [
              const Icon(
                Icons.star,
                color: Colors.yellow,
                size: 24,
              ),
              Text(
                productDetails.product?.star?.toStringAsFixed(2) ?? '',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(width: 10),
              InkWell(
                onTap: () {
                  Get.to(() => ReviewScreen());
                },
                child: Text(
                  'Reviews',
                  style: TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(width: 10),
              Card(
                color: AppColors.primaryColor,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(3.0),
                  child: Icon(
                    Icons.favorite_border,
                    color: Colors.white,
                    size: 15,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Text('Color',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
          const SizedBox(height: 5),
          if (productDetails.color != null)
            ColorSelector(
                colors: productDetails.color!
                    .split(',')
                    .map((color) => getColorFromString(color))
                    .toList(),
                onTap: (isSelectedColor) {
                  _isSelectedColor = isSelectedColor;
                }),
          const SizedBox(height: 10),
          const Text('Size',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
          const SizedBox(height: 5),
          if (productDetails.size != null)
            SizeSelector(
                sizes: productDetails.size!.split(','),
                onTap: (isSelectedSize) {
                  log(isSelectedSize.toString());
                  _isSelectedSize = isSelectedSize.toString();
                }),
          const SizedBox(height: 10),
          const Text('Description',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
          const SizedBox(height: 5),
          Text(
            productDetails.product?.shortDes ?? '',
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.w400, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Card buildCounterContainer({
    required Icon icon,
    required Color color,
  }) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
      color: color,
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 9),
        child: icon,
      ),
    );
  }

  Color getColorFromString(String color) {
    color = color.toLowerCase();
    if (color == 'red') {
      return Colors.red;
    }
    if (color == 'white') {
      return Colors.white;
    }
    if (color == 'green') {
      return Colors.green;
    }
    return Colors.black;
  }

  String colorToColorName(Color colorCode) {
    if (colorCode == Colors.red) {
      return 'Red';
    }
    if (colorCode == Colors.white) {
      return 'White';
    }
    if (colorCode == Colors.green) {
      return 'Green';
    }
    return 'black';
  }

// Color getColorFromString(String ColorCode) {
//   String codeString = ColorCode.replaceAll("#", "");
//   String code = '0xff$codeString';
//   return Color(int.parse(code));
// }
//
// String colorToHashColorCode(String colorCode) {
//   return colorCode
//       .toString()
//       .replaceAll('0xff', '#')
//       .replaceAll('Color(', '')
//       .replaceAll(')', '');
// }
}
