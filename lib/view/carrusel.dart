
import 'package:flutter/material.dart';



class CarouselWidget extends StatelessWidget {
  final PageController carouselController;
  final List<Map<String, dynamic>> carouselItems;
  final Function(int) onPageChanged;
  final int currentCarouselIndex;
  final double height;

  const CarouselWidget({
    Key? key,
    required this.carouselController,
    required this.carouselItems,
    required this.onPageChanged,
    required this.currentCarouselIndex,
    this.height = 500,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: PageView.builder(
        controller: carouselController,
        itemCount: carouselItems.length,
        onPageChanged: onPageChanged,
        itemBuilder: (context, index) {
          return Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(carouselItems[index]['image']),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.3),
                      BlendMode.darken,
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}