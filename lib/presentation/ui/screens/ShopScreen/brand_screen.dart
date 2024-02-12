import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopy_bay/controller/get_brand_controller.dart';
import 'package:shopy_bay/controller/main_bottomNavController.dart';
import 'package:shopy_bay/presentation/ui/utility/app_colors.dart';
import 'package:shopy_bay/presentation/ui/widgets/home/brand_container.dart';
import 'package:shopy_bay/presentation/ui/widgets/home/categories_container.dart';
import '../../../../controller/category_list_controller.dart';

class BrandScreen extends StatefulWidget {
  const BrandScreen({super.key});

  @override
  State<BrandScreen> createState() => _BrandScreenState();
}

class _BrandScreenState extends State<BrandScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvoked: (_) {
        Get.find<MainBottomNavController>().changeIndex(0);
      },
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.primaryColor.withOpacity(.5),
            leading: IconButton(
              onPressed: () {
                Get.find<MainBottomNavController>().changeIndex(0);
              },
              icon: const Icon(Icons.arrow_back_ios_new),
            ),
            title: const Text('Brands'),
          ),
          body: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 10,vertical: 5),
            child: GetBuilder<BrandController>(
                builder: (brandController) {
                  return Visibility(
                    visible: brandController.isLoading == false,
                    replacement: const Center(child: CircularProgressIndicator()),
                    child: GridView.builder(
                        itemCount: brandController.brand.brandList?.length??0,
                        gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          childAspectRatio: .78,
                          mainAxisSpacing: 0,
                          crossAxisSpacing: 5,
                        ),
                        itemBuilder: (context, index) {
                          return  Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: FittedBox(child: BrandContainer(
                              brand: brandController.brand.brandList![index],
                            ),
                          ));
                        }),
                  );
                }
            ),
          )),
    );
  }
}
