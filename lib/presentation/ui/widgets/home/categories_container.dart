import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopy_bay/data/models/category_list_model.dart';

import '../../screens/ShopScreen/individual_categories_screen.dart';
import '../../utility/app_colors.dart';

class CategoriesContainer extends StatefulWidget {
  const CategoriesContainer({
    super.key,
    required this.category,
  });

  final Category category;

  @override
  State<CategoriesContainer> createState() => _CategoriesContainerState();
}

class _CategoriesContainerState extends State<CategoriesContainer> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            Get.to(IndividualCategoriesScreen(
              categoryName: widget.category.categoryName,
              categoryId: widget.category.id??0,
            ));
          },
          child: Card(
            color: AppColors.primaryColor.withOpacity(.2),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 0,
            // color: AppColors.primaryColor.withOpacity(.2),
            child: Center(
                child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Image.network(widget.category.categoryImg.toString(),
                  width: 50, height: 50, fit: BoxFit.cover),
            )),
          ),
        ),
        const SizedBox(height: 3),
        Text(
          widget.category.categoryName.toString(),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: AppColors.primaryColor,
              fontSize: 18,
              fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
