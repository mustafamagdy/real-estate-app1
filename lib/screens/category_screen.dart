import 'package:flutter/material.dart';

import 'package:realstate_app1/componenets/app_button.dart';
import 'package:realstate_app1/componenets/search_field.dart';
import 'package:realstate_app1/constants.dart';

import '../models/estate.dart';

class CategoryScreen extends StatelessWidget {
  final Estate property;
  const CategoryScreen({
    Key? key,
    required this.property,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: _buildAppBar(context),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            stops: const [0.0, 0.53, 1],
            colors: [
              Colors.white,
              Colors.grey[100]!,
              Colors.grey[200]!,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SearchField(),
            _populaRow(),
            const SizedBox(height: kDefaultPadding),
            _featuredItem(),
            const SizedBox(height: kDefaultPadding),
            const Text(
              'House Nearby',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: kDefaultPadding),
            SizedBox(
              height: size.height * 0.25,
              child: ShaderMask(
                blendMode: BlendMode.dstOut,
                shaderCallback: (Rect bounds) {
                  return LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: <Color>[
                      Colors.transparent,
                      Colors.black.withOpacity(0.6)
                    ],
                  ).createShader(bounds);
                },
                child: ListView.builder(
                  itemCount: properties.length,
                  itemBuilder: (ctx, idx) {
                    var item = properties[idx];
                    return Card(
                      elevation: 1,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      // color: Colors.amber,
                      child: Container(
                          margin: const EdgeInsets.all(5),
                          padding: const EdgeInsets.all(5),
                          child: _nearbyItem(item)),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _nearbyItem(Estate item) {
    const itemHeight = 90.0;
    return Row(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
          child: Image.asset(
            item.image,
            width: itemHeight,
            height: itemHeight,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Container(
            height: itemHeight,
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                Text(
                  item.description,
                  style: const TextStyle(fontWeight: FontWeight.w200),
                ),
                Row(
                  children: [
                    Text(
                      item.price,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    const Spacer(),
                    const Icon(Icons.star, color: Colors.amber),
                    const SizedBox(width: 5),
                    Text(
                      property.rating.toStringAsFixed(1),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _populaRow() {
    return Row(
      children: [
        const Text(
          'Popular',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        const Spacer(),
        TextButton(
          onPressed: () {},
          child: const Text(
            'See all',
            style: TextStyle(color: kLinkColor),
          ),
        )
      ],
    );
  }

  Widget _featuredItem() {
    return Container(
      padding: const EdgeInsets.all(kDefaultPadding),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            offset: const Offset(0, 5),
            spreadRadius: 1,
            blurRadius: 20,
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 180,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              image: const DecorationImage(
                image: AssetImage('assets/images/img3.png'),
                fit: BoxFit.cover,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  offset: const Offset(5, 15),
                  spreadRadius: 2,
                  blurRadius: 10,
                )
              ],
            ),
          ),
          const SizedBox(height: kDefaultPadding),
          Row(
            children: [
              Text(
                property.price,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const Spacer(),
              const Icon(Icons.star, color: Colors.amber),
              const SizedBox(width: 5),
              Text(
                property.rating.toStringAsFixed(1),
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            property.description,
            style: TextStyle(
              fontSize: 16,
              color: kTextColor.withOpacity(0.7),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: AppButton(
                  borderRadius: 10,
                  height: 50,
                  color: kButtonColor,
                  onPress: () {},
                  text: 'DETAIL',
                ),
              ),
              const SizedBox(width: kDefaultPadding),
              AppButton(
                height: 50,
                color: Colors.black,
                borderColor: Colors.black26,
                shallow: true,
                onPress: () {},
                icon: Icons.chat_outlined,
              ),
            ],
          ),
        ],
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      leading: InkWell(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: const Icon(
          Icons.arrow_back_ios,
          color: kTextColor,
        ),
      ),
      title: const Align(
        alignment: Alignment.centerLeft,
        child: Text(
          'House',
          style: TextStyle(fontWeight: FontWeight.bold, color: kTextColor),
        ),
      ),
    );
  }
}
