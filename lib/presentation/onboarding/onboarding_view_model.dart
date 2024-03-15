import 'dart:async';

import 'package:flutter_advanced_course/domain/model/model.dart';
import 'package:flutter_advanced_course/presentation/base/base_view_model.dart';
import 'package:flutter_advanced_course/presentation/resources/assets_manager.dart';
import 'package:flutter_advanced_course/presentation/resources/strings_manager.dart';

class OnBoardingViewModel implements BaseViewModel, OnBoardingViewModelInputs, OnBoardingViewModelOutputs {
  final StreamController _streamController = StreamController<SliderViewObject>();
  late final List<SliderObject> _list;
  int _currentIndex = 0;

  @override
  void start() {
    _list = _getSliderData();
    _postDataToView();
  }

  @override
  void dispose() {
    _streamController.close();
  }

  @override
  int goNext() {
    if (_currentIndex < _list.length - 1) {
      _currentIndex++;
      _postDataToView();
    }
    return _currentIndex;
  }

  @override
  int goBack() {
    if (_currentIndex > 0) {
      _currentIndex--;
      _postDataToView();
    }
    return _currentIndex;

  }

  @override
  void onPageChanged(int index) {
    _currentIndex = index;
    _postDataToView();
  }

  @override
  Sink get inputSLiderViewObject => _streamController.sink;

  @override
  Stream<SliderViewObject> get outputSliderViewObject => _streamController.stream.map((sliverViewObject) => sliverViewObject);

  List<SliderObject> _getSliderData() => [
        SliderObject(
          StringsManager.onBoardingTitle1,
          StringsManager.onBoardingSubTitle1,
          AssetsManager.onboardingLogo1,
        ),
        SliderObject(
          StringsManager.onBoardingTitle2,
          StringsManager.onBoardingSubTitle2,
          AssetsManager.onboardingLogo2,
        ),
        SliderObject(
          StringsManager.onBoardingTitle3,
          StringsManager.onBoardingSubTitle3,
          AssetsManager.onboardingLogo3,
        ),
        SliderObject(
          StringsManager.onBoardingTitle4,
          StringsManager.onBoardingSubTitle4,
          AssetsManager.onboardingLogo4,
        )
      ];

  void _postDataToView() {
    inputSLiderViewObject.add(SliderViewObject(_list[_currentIndex], _list.length, _currentIndex));
  }
}

abstract class OnBoardingViewModelInputs {
  int goNext();
  int goBack();
  void onPageChanged(int index);

  Sink get inputSLiderViewObject;
}

abstract class OnBoardingViewModelOutputs {
  Stream<SliderViewObject> get outputSliderViewObject;
}

class SliderViewObject {
  SliderObject sliderObject;
  int numberOfPages;
  int currentIndex;

  SliderViewObject(this.sliderObject, this.numberOfPages, this.currentIndex);
}
