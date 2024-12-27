import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../util.dart';

class PhotoWidget extends StatefulWidget {
  const PhotoWidget({super.key});

  @override
  State<PhotoWidget> createState() => _PhotoWidgetState();
}

class _PhotoWidgetState extends State<PhotoWidget> {
  double imageWidth = Util.getWidgetSize(3 / 5);
  double radiusSize = Util.getWidgetSize(1 / 55);

  int activeIndex = 0;
  final List<String> images = [
    'assets/TestImage.png',
    'assets/TestImage2.png',
    'assets/TestImage3.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CarouselSlider.builder(
          options: CarouselOptions(
            initialPage: 0,
            viewportFraction: 1,
            enlargeCenterPage: true,
            onPageChanged: (index, reason) =>
                setState(() {
                  activeIndex = index;
                }),
          ),
          itemCount: images.length,
          itemBuilder: (context, index, realIndex) {
            final path = images[index];
            return SizedBox(
              width: imageWidth,
              height: imageWidth,
              child: Image.asset(path, fit: BoxFit.contain),
            );
          },
        ),
        Container(
          margin: EdgeInsets.only(top: 10.h),
          child: AnimatedSmoothIndicator(
            activeIndex: activeIndex,
            count: images.length,
            effect: JumpingDotEffect(
              dotHeight: radiusSize,
              dotWidth: radiusSize,
              activeDotColor: const Color(0xff469D7B),
              dotColor: const Color(0xffD9D9D9),
            ),
          ),
        ),
      ],
    );
  }
}
