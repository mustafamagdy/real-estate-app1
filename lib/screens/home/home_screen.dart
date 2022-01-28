import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:realstate_app1/componenets/app_button.dart';
import 'package:realstate_app1/constants.dart';
import 'package:realstate_app1/models/estate.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    var categories = {
      'Resort': 'assets/images/img1.png',
      'Cotage': 'assets/images/img2.png',
      'Office': 'assets/images/img3.png',
      'Urban': 'assets/images/img4.png',
    };
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(kDefaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildUserInfoBar(),
              const SizedBox(height: kDefaultPadding),
              _buildSearchBar(),
              const SizedBox(height: kDefaultPadding),
              _buildCategoriesGrid(categories),
              const SizedBox(height: kDefaultPadding),
              _propertyList(),
              const SizedBox(height: kDefaultPadding / 2),
              _buildBottomBar(size),
            ],
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
        child: ButtonBar(
          onGoToPage: () {},
        ),
      ),
    );
  }

  Widget _propertyList() {
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
          height: 300,
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
                    margin: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 160,
                          height: 160,
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            image: DecorationImage(
                              image: AssetImage(property.image),
                              fit: BoxFit.cover,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                offset: const Offset(5, 15),
                                spreadRadius: 2,
                                blurRadius: 20,
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        AppButton(
                          color: kButtonColor,
                          onPress: () {},
                          text: 'FOR SALE',
                        ),
                        const SizedBox(height: 10),
                        Text(
                          property.price,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          property.description,
                          style: const TextStyle(
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

  SizedBox _buildCategoriesGrid(Map<String, String> categories) {
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
              (e) => Container(
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
            )
            .toList(),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.1),
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      child: const TextField(
        autofocus: false,
        decoration: InputDecoration(
          prefixIconColor: Colors.grey,
          iconColor: Colors.grey,
          hintText: 'Searcch ...',
          hintStyle: TextStyle(color: Colors.grey),
          prefixIcon: Icon(Icons.search),
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
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

class ButtonBar extends StatefulWidget {
  var selectedIndex = 0;
  var pages = [
    Icons.home,
    Icons.favorite_border,
    Icons.message_rounded,
    Icons.settings,
  ];
  final VoidCallback onGoToPage;
  ButtonBar({
    Key? key,
    required this.onGoToPage,
  }) : super(key: key);

  @override
  _ButtonBarState createState() => _ButtonBarState();
}

class _ButtonBarState extends State<ButtonBar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: widget.pages.asMap().entries.map((e) {
        final isSelected = e.key == widget.selectedIndex;
        return InkWell(
          onTap: () {
            setState(() {
              widget.selectedIndex = e.key;
            });
            widget.onGoToPage();
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 5),
            width: 50,
            height: 50,
            child: Column(
              children: [
                Icon(
                  e.value,
                  color:
                      isSelected ? Colors.white : Colors.white.withOpacity(0.3),
                  size: 30,
                ),
                const SizedBox(height: 5),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  height: 5,
                  width: 5,
                  decoration: BoxDecoration(
                    color: isSelected ? Colors.amber : Colors.transparent,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(50),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}
