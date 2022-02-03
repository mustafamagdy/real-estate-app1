import 'package:flutter/material.dart';

import '../constants.dart';

class ImageSlider extends StatefulWidget {
  final List<Container> pages;
  const ImageSlider({
    Key? key,
    required this.pages,
  }) : super(key: key);

  @override
  _ImageSliderState createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  var activePageIndex = 0;
  late PageController pageController;
  @override
  void initState() {
    super.initState();
    pageController = PageController(
      initialPage: activePageIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: PageView(
              onPageChanged: (value) {
                setState(() {
                  activePageIndex = value;
                });
              },
              controller: pageController,
              children: widget.pages,
            ),
          ),
          const SizedBox(height: kDefaultPadding),
          Wrap(
            children: widget.pages.map((p) {
              final index = widget.pages.indexOf(p);
              return _buildDot(index == activePageIndex);
            }).toList(),
          )
        ],
      ),
    );
  }

  Widget _buildDot(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.symmetric(horizontal: kDefaultPadding / 8),
      height: 4,
      width: isActive ? 12 : 8,
      decoration: BoxDecoration(
        color: isActive ? kTextColor : kTextLightColor,
        borderRadius: BorderRadius.circular(25),
      ),
    );
  }
}
