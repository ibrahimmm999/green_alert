import 'package:flutter/material.dart';
import 'package:green_alert/providers/page_provider.dart';
import 'package:green_alert/shared/themes.dart';
import 'package:provider/provider.dart';

class NavigationItems extends StatelessWidget {
  const NavigationItems({super.key, required this.text, required this.index});

  final String text;
  final int index;

  @override
  Widget build(BuildContext context) {
    PageProvider pageProvider = Provider.of<PageProvider>(context);

    return GestureDetector(
      onTap: () {
        pageProvider.setCurrPage = index;
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(),
          Text(text,
              textAlign: TextAlign.center,
              style: pageProvider.currPage == index
                  ? greenText.copyWith(fontWeight: bold)
                  : blackText.copyWith(fontWeight: bold)),
          Container(
            height: 3,
            width: (MediaQuery.of(context).size.width / 3) - 14,
            decoration: BoxDecoration(
              color: pageProvider.currPage == index
                  ? green
                  : const Color(0xffACACAF),
              borderRadius: BorderRadius.circular(18),
            ),
          )
        ],
      ),
    );
  }
}
