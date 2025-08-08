import 'package:flutter/material.dart';

class CarouselWidget extends StatefulWidget {
  final PageController carouselController;
  final List<Map<String, dynamic>> carouselItems;
  final int currentCarouselIndex;
  final double height;

  const CarouselWidget({
    Key? key,
    required this.carouselController,
    required this.carouselItems,
    required this.currentCarouselIndex,
    this.height = 500,
  }) : super(key: key);

  @override
  State<CarouselWidget> createState() => _CarouselWidgetState();
}

class _CarouselWidgetState extends State<CarouselWidget> {
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.currentCarouselIndex;
  }

  @override
  void didUpdateWidget(covariant CarouselWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.currentCarouselIndex != widget.currentCarouselIndex) {
      _currentIndex = widget.currentCarouselIndex;
    }
  }

  void _previousPage() {
    if (_currentIndex > 0) {
      widget.carouselController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      setState(() {
        _currentIndex--;
      });
    }
  }

  void _nextPage() {
    if (_currentIndex < widget.carouselItems.length - 1) {
      widget.carouselController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      setState(() {
        _currentIndex++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      child: Stack(
        children: [
          // Carrusel de imágenes
          PageView.builder(
            controller: widget.carouselController,
            itemCount: widget.carouselItems.length,
            itemBuilder: (context, index) {
              return Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(widget.carouselItems[index]['image']),
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

          // Flecha Izquierda (solo visible si no estamos en la primera imagen)
          if (_currentIndex > 0)
            Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                icon: const Icon(Icons.arrow_back_ios, size: 40, color: Colors.white),
                onPressed: _previousPage,
              ),
            ),

          // Flecha Derecha (solo visible si no estamos en la última imagen)
          if (_currentIndex < widget.carouselItems.length - 1)
            Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                icon: const Icon(Icons.arrow_forward_ios, size: 40, color: Colors.white),
                onPressed: _nextPage,
              ),
            ),
        ],
      ),
    );
  }
}