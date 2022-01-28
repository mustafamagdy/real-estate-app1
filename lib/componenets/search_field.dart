import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  const SearchField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
}
