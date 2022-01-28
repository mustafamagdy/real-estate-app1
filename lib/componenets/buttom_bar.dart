import 'package:flutter/material.dart';

class AppButtonBar extends StatefulWidget {
  var selectedIndex = 0;
  var pages = [
    Icons.home,
    Icons.favorite_border,
    Icons.message_rounded,
    Icons.settings,
  ];
  final VoidCallback onGoToPage;
  AppButtonBar({
    Key? key,
    required this.onGoToPage,
  }) : super(key: key);

  @override
  _AppButtonBarState createState() => _AppButtonBarState();
}

class _AppButtonBarState extends State<AppButtonBar> {
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
