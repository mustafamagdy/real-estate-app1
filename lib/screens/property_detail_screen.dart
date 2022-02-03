import 'package:flutter/material.dart';

import '../componenets/app_button.dart';
import '../componenets/image_slider.dart';
import '../componenets/detail_screen_app_bar.dart';
import '../constants.dart';
import '../models/estate.dart';

class PropertyDetailScreen extends StatelessWidget {
  final Estate property;
  const PropertyDetailScreen({
    Key? key,
    required this.property,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(context),
      body: Column(
        children: [
          ImageSlider(
            pages: property.images.map((img) {
              return Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(img), fit: BoxFit.cover),
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: kDefaultPadding),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _productBasicDetails(),
                  const SizedBox(height: kDefaultPadding),
                  _properties(),
                  const SizedBox(height: kDefaultPadding),
                  _description(),
                  const SizedBox(height: kDefaultPadding),
                  _actions()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _productBasicDetails() {
    return Flexible(
      flex: 1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                property.price,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
              const Spacer(),
              const Icon(Icons.star, color: Colors.amber),
              const SizedBox(width: kDefaultPadding / 4),
              Text(
                property.rating.toStringAsFixed(1),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ],
          ),
          const SizedBox(height: kDefaultPadding / 2),
          Text(
            property.description,
            style: TextStyle(
              fontSize: 16,
              color: kTextColor.withOpacity(0.6),
            ),
          ),
        ],
      ),
    );
  }

  Widget _properties() {
    return Flexible(
      flex: 1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _roundedIcon(Icons.house_outlined),
          const Text(
            '4 rooms',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          _roundedIcon(Icons.square_foot),
          const Text(
            '132 m2',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          _roundedIcon(Icons.business_outlined),
          const Text(
            '2 floors',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _roundedIcon(IconData icon) {
    return Container(
      width: 45,
      height: 45,
      decoration: BoxDecoration(
        color: kButtonColor,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Icon(
        icon,
        color: Colors.black.withOpacity(0.6),
        size: 28,
      ),
    );
  }

  Widget _description() {
    return Flexible(
      flex: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Description',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: kDefaultPadding / 2),
          Expanded(
            child: SingleChildScrollView(
              child: Text(
                property.longDescription,
                style: const TextStyle(color: kTextLightColor),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _actions() {
    return Flexible(
      flex: 1,
      child: Row(
        children: [
          AppButton(
            height: 50,
            width: 50,
            shallow: true,
            color: kTextColor,
            borderRadius: 10,
            borderColor: kTextLightColor.withOpacity(0.6),
            onPress: () {},
            icon: Icons.chat,
          ),
          const SizedBox(width: kDefaultPadding / 2),
          AppButton(
            height: 50,
            width: 50,
            shallow: true,
            color: kTextColor,
            borderRadius: 10,
            borderColor: kTextLightColor.withOpacity(0.6),
            onPress: () {},
            icon: Icons.favorite_border,
          ),
          const SizedBox(width: kDefaultPadding / 2),
          Expanded(
            child: AppButton(
              height: 50,
              borderRadius: 10,
              color: Colors.white,
              borderColor: kTextColor,
              onPress: () {},
              text: 'BUY NOW',
              textStyle: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
