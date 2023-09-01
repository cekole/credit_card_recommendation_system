import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';

class CarouselProvider with ChangeNotifier {
  int _currentIndex = 0;
  CarouselSliderController? _carouselController = CarouselSliderController();

  int get currentIndex => _currentIndex;

  CarouselSliderController? get carouselController => _carouselController;

  void nextPage() {
    _currentIndex++;
    _carouselController!.nextPage(
      const Duration(milliseconds: 500),
    );
    notifyListeners();
  }

  void previousPage() {
    _currentIndex--;
    _carouselController!.previousPage(
      const Duration(milliseconds: 500),
    );
    notifyListeners();
  }

  bool isLastIndex(int length) {
    return _currentIndex == length - 1;
  }

  bool isFirstIndex() {
    return _currentIndex == 0;
  }

  void setCarouselController(CarouselSliderController controller) {
    _carouselController = controller;
  }
}
