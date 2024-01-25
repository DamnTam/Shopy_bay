import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../../utility/app_colors.dart';

class ProductDetailsCarousel extends StatefulWidget {
  const ProductDetailsCarousel({
    super.key,
    required this.onTap,
  });

  final VoidCallback onTap;

  @override
  State<ProductDetailsCarousel> createState() => _ProductDetailsCarouselState();
}

class _ProductDetailsCarouselState extends State<ProductDetailsCarousel> {
  final ValueNotifier<int> _index = ValueNotifier<int>(0);

  List<int> items = List.generate(5, (index) => index);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Stack(children: [
      Column(
        children: [
          CarouselSlider(
            items: items
                .map(
                  (index) => Container(
                    margin: const EdgeInsets.symmetric(horizontal: 1.5),
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Image.asset('assets/images/shoe2.png',
                          width: width * 0.45),
                    ),
                  ),
                )
                .toList(),
            options: CarouselOptions(
                viewportFraction: 1.2,
                height: width * 0.55,
                onPageChanged: (index, reason) {
                  _index.value = index;
                }),
          ),
        ],
      ),
      Positioned(
        bottom: 0,
        left: 0,
        right: 0,
        child: ValueListenableBuilder<int>(
          valueListenable: _index,
          builder: (_, value, __) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: items.map((e) {
                return Container(
                  width: 10.0,
                  height: 10.0,
                  margin: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 2.0),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _index.value == e
                          ? AppColors.primaryColor
                          : Colors.white),
                );
              }).toList(),
            );
          },
        ),
      ),
    ]);
  }
}
