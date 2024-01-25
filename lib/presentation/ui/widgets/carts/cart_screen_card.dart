import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/counter_controller.dart';
import '../../utility/app_colors.dart';

class CartScreenCard extends StatefulWidget {
   CartScreenCard({Key? key,}) : super(key: key);

  @override
  State<CartScreenCard> createState() => _CartScreenCardState();
}

class _CartScreenCardState extends State<CartScreenCard> {
 // final CounterController counterController = Get.put(CounterController(),tag: UniqueKey().toString());

  @override
  Widget build(BuildContext context) {
    double cardWidth = MediaQuery.of(context).size.width * 0.8;
   // double cardHeight = MediaQuery.of(context).size.height * 0.16;
    return Card(
      color: Colors.white,
      elevation: 3,
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColors.primaryColor.withOpacity(.3),
              borderRadius: BorderRadius.circular(0).copyWith(
                bottomLeft: Radius.circular(10),
                topLeft: Radius.circular(10),
              ),
              border: Border(
                right: BorderSide(
                  color: Colors.black38,
                  width: .7,
                ),
              ),

            ),
            width: cardWidth * 0.35,
            height: cardWidth * 0.45,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: const Image(
                image: AssetImage('assets/images/shoe2.png'),
               // fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
               // vertical: 0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Nike Air Max 270',
                        style: TextStyle(
                          fontSize: cardWidth * 0.07,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Icon(
                        Icons.delete_rounded,
                        color: Colors.red.shade400,
                        size: cardWidth * 0.07,
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'Color: Red',
                        style: TextStyle(
                            fontSize: cardWidth * 0.05, color: Colors.grey),
                      ),
                      SizedBox(width: cardWidth * 0.02),
                      Text(
                        'Size: 9',
                        style: TextStyle(
                            fontSize: cardWidth * 0.05, color: Colors.grey),
                      ),
                    ],
                  ),
                  const SizedBox(height: 7),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$150',
                        style: TextStyle(
                          fontSize: cardWidth * 0.07,
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      GetBuilder<CounterController>(
                        builder: (counterController){
                          return Row(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        counterController.decrement();
                                      },
                                      child: buildCounterContainer(
                                        color:counterController.counter == 1
                                            ? AppColors.primaryColor.withOpacity(.4)
                                            : AppColors.primaryColor,
                                        icon: const Icon(Icons.remove),
                                      ),
                                    ),
                                    SizedBox(width: cardWidth * 0.01),
                                    Text(
                                      '${counterController.counter}',
                                      style: TextStyle(
                                        fontSize: cardWidth * 0.05,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    SizedBox(width: cardWidth * 0.01),
                                    InkWell(
                                      onTap: () {
                                        counterController.increment();
                                      },
                                      child: buildCounterContainer(
                                        icon: const Icon(Icons.add),
                                        color: AppColors.primaryColor,
                                      ),
                                    ),
                                  ],

                          );
                        }
                      ),

                    ],
                  ),
                ],
              ),
            ),
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
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 5),
        child: icon,
      ),
    );
  }
}
