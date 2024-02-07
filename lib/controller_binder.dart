import 'package:get/get.dart';
import 'package:shopy_bay/controller/add_to_cart_controller.dart';
import 'package:shopy_bay/controller/auth_controller.dart';
import 'package:shopy_bay/controller/cart_controller.dart';
import 'package:shopy_bay/controller/create_profile_controller.dart';
import 'package:shopy_bay/controller/create_wish_list_controller.dart';
import 'package:shopy_bay/controller/delete_cart_controller.dart';
import 'package:shopy_bay/controller/invoice_create_controller.dart';
import 'package:shopy_bay/controller/product_details_controller.dart';
import 'package:shopy_bay/controller/read_profile_controller.dart';
import 'package:shopy_bay/controller/popular_product_controller.dart';
import 'controller/category_list_controller.dart';
import 'controller/home_carousel_product_controller.dart';
import 'controller/main_bottomNavController.dart';
import 'controller/new_product_controller.dart';
import 'controller/product_controller.dart';
import 'controller/product_wish_list_controller.dart';
import 'controller/sentEmailOtpController.dart';
import 'controller/special_product_controller.dart';
import 'controller/verify_otp_controller.dart';

class GetBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MainBottomNavController());
    Get.put(SentEmailOtpController());
    Get.put(VerifyOtpController());
    Get.put(ReadProfileController());
    Get.put(AuthController());
    Get.put(CreateProfileController());
    Get.put(HomeCarouselProductController());
    Get.put(CategotyListController());
    Get.put(PopularProductController());
    Get.put(SpecialProductController());
    Get.put(NewProductController());
    Get.put(ProductController());
    Get.put(ProductDetailsController());
    Get.put(AddToCartController());
    Get.put(CartController());
    Get.put(DeleteCartController());
    Get.put(CreateWishListController());
    Get.put(ProductWishListController());
    Get.put(InvoiceCreateController());
  }
}