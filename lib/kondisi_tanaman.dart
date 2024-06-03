import 'package:flutter/material.dart';
import 'package:green_alert/side_contents/humidity_content.dart';
import 'package:green_alert/side_contents/ph_content.dart';
import 'package:green_alert/providers/page_provider.dart';
import 'package:green_alert/shared/themes.dart';
import 'package:green_alert/side_contents/uv_content.dart';
import 'package:green_alert/widgets/navigation_item.dart';
import 'package:provider/provider.dart';

class KondisiTanamanPage extends StatelessWidget {
  const KondisiTanamanPage({super.key});

  @override
  Widget build(BuildContext context) {
    PageProvider pageProvider = Provider.of<PageProvider>(context);
    Widget header() {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        decoration: BoxDecoration(
            color: white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.25),
                offset: const Offset(0.0, 4.0),
                blurRadius: 4.0,
                spreadRadius: 0.0,
              ), //BoxShadow
            ],
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20))),
        width: double.infinity,
        child: Row(
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_rounded,
                  color: Colors.black,
                  size: 28,
                )),
            const SizedBox(
              width: 48,
            ),
            Text(
              "Kondisi Tanaman",
              style: purpleText.copyWith(fontSize: 20, fontWeight: bold),
            )
          ],
        ),
      );
    }

    Widget daun() {
      return Padding(
        padding: const EdgeInsets.only(top: 36),
        child: Image.asset(
          "assets/daun.png",
          width: 150,
          height: 136,
          fit: BoxFit.contain,
        ),
      );
    }

    Widget changeContent() {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        height: 60,
        width: double.infinity,
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            NavigationItems(
              index: 0,
              text: "Kelembaban\nTanah",
            ),
            NavigationItems(
              index: 1,
              text: "pH Tanah",
            ),
            NavigationItems(
              index: 2,
              text: "Index UV",
            ),
          ],
        ),
      );
    }

    Widget buildContent() {
      switch (pageProvider.currPage) {
        case 0:
          {
            return const HumidityContent();
          }
        case 1:
          {
            return const PhContent();
          }
        case 2:
          {
            return const UvContent();
          }
        default:
          {
            return const HumidityContent();
          }
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [header(), daun(), changeContent(), buildContent()],
      ),
    );
  }
}
