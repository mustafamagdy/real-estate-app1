import 'package:flutter/material.dart';
import 'package:realstate_app1/componenets/app_button.dart';
import 'package:realstate_app1/componenets/search_field.dart';
import 'package:realstate_app1/constants.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(context),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: Column(
          children: [
            const SearchField(),
            Row(
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
            ),
            const SizedBox(height: kDefaultPadding),
            Container(
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
                        width: 300,
                        height: 180,
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          image: const DecorationImage(
                            image: AssetImage('assets/images/img3.png'),
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
                      Text(
                        '1111',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'sssss',
                        style: const TextStyle(
                          fontSize: 10,
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
                              text: 'FOR SALE',
                            ),
                          ),
                          const SizedBox(width: 10),
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
                ),
              ),
            ),
          ],
        ),
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
