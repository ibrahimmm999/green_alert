import 'dart:async';

import 'package:flutter/material.dart';
import 'package:green_alert/main.dart';
import 'package:green_alert/pages/home_page.dart';
import 'package:green_alert/pages/sign_in_page.dart';
import 'package:green_alert/providers/data_provider.dart';
import 'package:green_alert/shared/themes.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    getinit();
    super.initState();
  }

  getinit() async {
    DataProvider dataProvider =
        Provider.of<DataProvider>(context, listen: false);
    await Future.delayed(Duration.zero);
    if (!mounted) {
      return;
    }
    Timer(const Duration(seconds: 2), () {});

    final session = supabase.auth.currentSession;
    await dataProvider.getData();

    if (session != null) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const HomePage()),
          (route) => false);
    } else {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const SignInPage()),
          (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "assets/splash.png",
                height: 240,
                fit: BoxFit.contain,
              ),
              Text(
                "GreenAlert",
                style: greenText.copyWith(fontSize: 32, fontWeight: bold),
              ),
              Text(
                "Monitor and manage your plant's health effortlessly with real-time insights.",
                style: greyText.copyWith(
                    fontWeight: medium,
                    color: const Color.fromARGB(255, 70, 70, 70)),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}
