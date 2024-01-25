import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopy_bay/controller/category_list_controller.dart';
import 'package:shopy_bay/controller/home_carousel_product_controller.dart';
import 'package:shopy_bay/controller/popular_product_controller.dart';
import 'package:shopy_bay/data/models/remark_product_list_model.dart';
import '../../../controller/main_bottomNavController.dart';
import '../../../controller/new_product_controller.dart';
import '../../../controller/special_product_controller.dart';
import '../widgets/home/categories_container.dart';
import '../widgets/home/section_title.dart';
import '../widgets/home/custom_carousel.dart';
import '../widgets/home/my_appbar.dart';
import '../widgets/home/search_inputdecoration.dart';
import '../widgets/product_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    // final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: myAppBar(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 7),
              TextFormField(decoration: searchInputDecoration()),
              const SizedBox(height: 7),
              SizedBox(
                height: width * 0.5,
                child: GetBuilder<HomeCarouselProductController>(
                    builder: (homeCarouselProductController) {
                  return Visibility(
                    visible: homeCarouselProductController.isLoading == false,
                    replacement:
                        const Center(child: CircularProgressIndicator()),
                    child: CustomCarousel(
                      homeCarouselProductList: homeCarouselProductController
                              .homeCarouselProductModel
                              .homeCarouselProductList ??
                          [],
                      onTap: () {},
                    ),
                  );
                }),
              ),
              const SizedBox(height: 7),
              SectionTitle(
                text: 'All Categories',
                onTap: () {
                  Get.find<MainBottomNavController>().changeIndex(1);
                },
              ),
              const SizedBox(height: 5),
              buildCategoryContainer,
              const SizedBox(height: 5),
              SectionTitle(
                text: 'Popular',
                onTap: () {},
              ),
              const SizedBox(height: 5),

              GetBuilder<PopularProductController>(
                builder: (popularProductController) {
                  return Visibility(
                      visible: popularProductController.isLoading==false,
                      replacement: Center(child: CircularProgressIndicator(),),
                      child: buildProductCardByRemark(
                        remarkProductList:popularProductController.remarkProductModel.ProductList??[]
                      ));
                }
              ),
              SectionTitle(
                text: 'Special',
                onTap: () {},
              ),
              const SizedBox(height: 5),
              GetBuilder<SpecialProductController>(
                  builder: (specialProductController) {
                    return Visibility(
                        visible: specialProductController.isLoading==false,
                        replacement: Center(child: CircularProgressIndicator(),),
                        child: buildProductCardByRemark(
                            remarkProductList:specialProductController.remarkProductModel.ProductList??[]
                        ));
                  }
              ),
              SectionTitle(
                text: 'New',
                onTap: () {},
              ),
              const SizedBox(height: 5),
              GetBuilder<NewProductController>(
                  builder: (newProductController) {
                    return Visibility(
                        visible: newProductController.isLoading==false,
                        replacement: Center(child: CircularProgressIndicator(),),
                        child: buildProductCardByRemark(
                            remarkProductList:newProductController.remarkProductModel.ProductList??[]
                        ));
                  }
              ),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox buildProductCardByRemark({required List<ProductItem> remarkProductList}) {
    return SizedBox(
      height: 160,
      child:  ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: remarkProductList.length,
        itemBuilder: (context, index) {
          return ProductCard(
            product: remarkProductList[index],
          );
        },
      ));
  }

  SizedBox get buildCategoryContainer {
    return SizedBox(
      height: 120,
      child:
          GetBuilder<CategotyListController>(builder: (categoryListController) {
        final categoryList =
            categoryListController.categoryListModel.categoryList;
        return Visibility(
          visible: categoryListController.isLoading == false,
          replacement: const Center(child: CircularProgressIndicator()),
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: categoryList?.length ?? 0,
            itemBuilder: (context, index) {
              return CategoriesContainer(
                category: categoryList![index],
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(width: MediaQuery.of(context).size.width * 0.07);
            },
          ),
        );
      }),
    );
  }
}
