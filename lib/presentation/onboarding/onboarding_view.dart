import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_advanced_course/domain/model.dart';
import 'package:flutter_advanced_course/presentation/onboarding/onboarding_view_model.dart';
import 'package:flutter_advanced_course/presentation/resources/assets_manager.dart';
import 'package:flutter_advanced_course/presentation/resources/colors_manager.dart';
import 'package:flutter_advanced_course/presentation/resources/routes_manager.dart';
import 'package:flutter_advanced_course/presentation/resources/strings_manager.dart';
import 'package:flutter_advanced_course/presentation/resources/values_manager.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  _OnBoardingViewState createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final PageController _pageController = PageController(initialPage: 0);
  final OnBoardingViewModel _viewModel = OnBoardingViewModel();

  @override
  void initState() {
    _viewModel.start();
    super.initState();
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<SliderViewObject>(
        stream: _viewModel.outputSliderViewObject,
        builder: (context, snapShot) {
          return _getContentWidget(snapShot.data);
        });
  }

  Widget _getContentWidget(SliderViewObject? sliderViewObject) {
    if (sliderViewObject == null) {
      return Container();
    } else {
      return Scaffold(
        backgroundColor: ColorsManager.white,
        appBar: AppBar(
          backgroundColor: ColorsManager.white,
          elevation: SizesManager.s0,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: ColorsManager.white,
            statusBarBrightness: Brightness.dark,
            statusBarIconBrightness: Brightness.dark,
          ),
        ),
        body: PageView.builder(
            controller: _pageController,
            itemCount: sliderViewObject.numberOfPages,
            onPageChanged: (index) {
              _viewModel.onPageChanged(index);
            },
            itemBuilder: (context, index) {
              return OnBoardingPage(sliderViewObject.sliderObject);
            }),
        bottomSheet: Container(
          color: ColorsManager.white,
          height: SizesManager.s100,
          child: Column(
            children: [
              Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, Routes.loginRoute);
                    },
                    child: Text(
                      StringsManager.skip,
                      style: Theme.of(context).textTheme.titleSmall,
                      textAlign: TextAlign.end,
                    ),
                  )),
              // add layout for indicator and arrows
              _getBottomSheetWidget(sliderViewObject)
            ],
          ),
        ),
      );
    }
  }

  Widget _getBottomSheetWidget(SliderViewObject sliderViewObject) {
    return Container(
      color: ColorsManager.primary,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // left arrow
          Padding(
            padding: const EdgeInsets.all(PaddingsManager.p14),
            child: GestureDetector(
              child: SizedBox(
                height: SizesManager.s20,
                width: SizesManager.s20,
                child: SvgPicture.asset(AssetsManager.leftArrowIc),
              ),
              onTap: () {
                // go to previous slide
                _pageController.animateToPage(_viewModel.goBack(), duration: const Duration(milliseconds: ConstantsManager.d300), curve: Curves.bounceInOut);
              },
            ),
          ),

          // circles indicator
          Row(
            children: [
              for (int i = 0; i < sliderViewObject.numberOfPages; i++)
                Padding(
                  padding: const EdgeInsets.all(PaddingsManager.p8),
                  child: _getProperCircle(i, sliderViewObject.currentIndex),
                )
            ],
          ),

          // right arrow
          Padding(
            padding: const EdgeInsets.all(PaddingsManager.p14),
            child: GestureDetector(
              child: SizedBox(
                height: SizesManager.s20,
                width: SizesManager.s20,
                child: SvgPicture.asset(AssetsManager.rightarrowIc),
              ),
              onTap: () {
                // go to next slide
                _pageController.animateToPage(_viewModel.goNext(), duration: const Duration(milliseconds: ConstantsManager.d300), curve: Curves.bounceInOut);
              },
            ),
          )
        ],
      ),
    );
  }

  Widget _getProperCircle(int index, int currentIndex) {
    if (index == currentIndex) {
      return SvgPicture.asset(AssetsManager.hollowCircleIc); // selected slider
    } else {
      return SvgPicture.asset(AssetsManager.solidCircleIc); // unselected slider
    }
  }
}

class OnBoardingPage extends StatelessWidget {
  final SliderObject _sliderObject;

  const OnBoardingPage(this._sliderObject, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(height: SizesManager.s40),
        Padding(
          padding: const EdgeInsets.all(PaddingsManager.p8),
          child: Text(
            _sliderObject.title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(PaddingsManager.p8),
          child: Text(
            _sliderObject.subTitle,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        const SizedBox(
          height: SizesManager.s60,
        ),
        SvgPicture.asset(_sliderObject.image)
        // image widget
      ],
    );
  }
}
