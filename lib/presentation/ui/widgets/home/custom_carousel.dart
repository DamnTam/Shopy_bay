import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shopy_bay/data/models/home_carousel_product_model.dart';


import '../../utility/app_colors.dart';

class CustomCarousel extends StatefulWidget {
  const CustomCarousel({
    super.key,
    required this.onTap, required this.homeCarouselProductList,
  });

  final VoidCallback onTap;
  final List<HomeCarouselProduct> homeCarouselProductList;

  @override
  State<CustomCarousel> createState() => _CustomCarouselState();
}

class _CustomCarouselState extends State<CustomCarousel> {
  final ValueNotifier<int> _index = ValueNotifier<int>(0);
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
     final height= MediaQuery.of(context).size.height;
    return Column(
      children: [
        CarouselSlider(
          items: widget.homeCarouselProductList
              .map(
                (product) => Container(
                  margin: const EdgeInsets.symmetric(horizontal: 1.5),
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.network(
                       product.image.toString(),
                        width: width * 0.43,
                        fit: BoxFit.cover,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                           Wrap(
                            children: [
                              Text(
                                product.title.toString(),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: width * 0.055,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                          ElevatedButton(
                            onPressed: widget.onTap,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: AppColors.primaryColor,
                            ),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 12),
                              child: Text('Shop Now'),
                            ),
                          ),
                         // SizedBox(height: 100)
                        ],
                      ),
                    ],
                  ),
                ),
              )
              .toList(),
          options: CarouselOptions(
              viewportFraction: 1,
              height: width * 0.45,
              onPageChanged: (index, reason) {
                _index.value = index;
              }),
        ),
        const SizedBox(height: 5),
        ValueListenableBuilder(
          valueListenable: _index,
          builder: (BuildContext context, int value, Widget? child) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i <widget.homeCarouselProductList.length; i++)
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: .9),
                    alignment: Alignment.center,
                    height: 10,
                    width: 10,
                    decoration: BoxDecoration(
                      color: _index.value == i
                          ? AppColors.primaryColor
                          : Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
              ],
            );
          },
        ),
      ],
    );
  }
}
