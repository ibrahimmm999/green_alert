import 'package:flutter/material.dart';
import 'package:green_alert/main.dart';
import 'package:green_alert/pages/sign_in_page.dart';
import 'package:green_alert/shared/themes.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameC = TextEditingController(text: "Olivia");
    TextEditingController emailC =
        TextEditingController(text: "olivia@gmail.com");
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
              width: 88,
            ),
            Text(
              "Profile",
              style: blackText.copyWith(fontSize: 20, fontWeight: bold),
            )
          ],
        ),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            header(),
            Padding(
              padding: const EdgeInsets.only(top: 60),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(90),
                child: Image.asset(
                  "assets/avatar.png",
                  height: 148,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    controller: nameC,
                    decoration: InputDecoration(
                        labelText: "Name",
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: green)),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(defaultRadius))),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: emailC,
                    decoration: InputDecoration(
                        labelText: "Email",
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: green)),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(defaultRadius))),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: defaultMargin),
              child: TextButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(green)),
                  onPressed: () {},
                  child: Text(
                    "Save",
                    style: whiteText.copyWith(fontSize: 16),
                  )),
            ),
            Container(
              width: double.infinity,
              margin:
                  EdgeInsets.symmetric(horizontal: defaultMargin, vertical: 8),
              child: TextButton(
                  style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                          Color.fromARGB(255, 171, 54, 54))),
                  onPressed: () async {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignInPage()),
                        (route) => false);
                    await supabase.auth.signOut();
                  },
                  child: Text(
                    "Log Out",
                    style: whiteText.copyWith(fontSize: 16),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
