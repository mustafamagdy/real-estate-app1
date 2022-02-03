import 'package:flutter/material.dart';

import '../componenets/search_field.dart';
import '../screens/category_screen.dart';
import '../screens/property_detail_screen.dart';
import '../../componenets/app_button.dart';
import '../../componenets/buttom_bar.dart';
import '../../constants.dart';
import '../../models/estate.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: kDefaultPadding / 2),
                _buildUserInfoBar(),
                const SizedBox(height: kDefaultPadding),
                const SearchField(),
                const SizedBox(height: kDefaultPadding),
                _buildCategoriesGrid(context),
                const SizedBox(height: kDefaultPadding),
                _propertyList(context),
                const SizedBox(height: kDefaultPadding),
                _buildBottomBar(size),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container _buildBottomBar(Size size) {
    return Container(
      height: 70,
      width: size.width,
      decoration: const BoxDecoration(
        color: kTextColor,
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: AppButtonBar(
          onGoToPage: () {},
        ),
      ),
    );
  }

  Widget _propertyList(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Recommendation',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        const SizedBox(height: kDefaultPadding),
        SizedBox(
          height: 320,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: properties.length,
            itemBuilder: (ctx, idx) {
              final property = properties[idx];
              return Container(
                margin: const EdgeInsets.only(right: kDefaultPadding),
                child: Card(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  elevation: 1,
                  shadowColor: Colors.white38,
                  child: Container(
                    margin: const EdgeInsets.all(kDefaultPadding / 2),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 180,
                          height: 180,
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            image: DecorationImage(
                              image: AssetImage(property.mainImage),
                              fit: BoxFit.cover,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                offset: const Offset(1, 10),
                                spreadRadius: 5,
                                blurRadius: 20,
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: kDefaultPadding),
                        AppButton(
                          color: kButtonColor,
                          textStyle: const TextStyle(
                            color: kTextColor,
                            fontWeight: FontWeight.bold,
                          ),
                          onPress: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (ctx) {
                                  return PropertyDetailScreen(
                                    property: property,
                                  );
                                },
                              ),
                            );
                          },
                          text: 'FOR SALE',
                        ),
                        const SizedBox(height: kDefaultPadding / 2),
                        Text(
                          property.price,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: kDefaultPadding / 2),
                        Text(
                          property.description,
                          style: const TextStyle(
                            color: kTextLightColor,
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }

  SizedBox _buildCategoriesGrid(BuildContext context) {
    return SizedBox(
      height: 150,
      child: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          // childAspectRatio: 0.5,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          mainAxisExtent: 70,
        ),
        children: categories.entries
            .map(
              (e) => InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (ctx) => CategoryScreen(property: properties[0]),
                    ),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.1),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  // width: 200,
                  // height: 100,
                  child: Row(
                    children: [
                      Expanded(
                        child: Center(
                          child: Text(
                            e.key,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      ClipRRect(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                        child: Image.asset(
                          e.value,
                          width: 55,
                          height: 55,
                          fit: BoxFit.cover,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }

  Widget _buildUserInfoBar() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CircleAvatar(
          backgroundImage: AssetImage('assets/images/avatar.png'),
        ),
        const SizedBox(width: kDefaultPadding / 2),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome back,',
              style: TextStyle(color: kTextColor.withOpacity(0.5)),
            ),
            const Text(
              'Myhammed Dzaki',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ],
        ),
        const Spacer(),
        const Icon(Icons.notifications_none)
      ],
    );
  }
}
