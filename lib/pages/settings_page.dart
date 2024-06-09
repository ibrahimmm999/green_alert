import 'package:flutter/material.dart';
import 'package:green_alert/shared/themes.dart';
import 'package:group_radio_button/group_radio_button.dart';
import 'package:riff_switch/riff_switch.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

bool notifHumidity = false;
bool notifUv = false;
bool notifPH = false;
String radioButtonValue = "5 Menit";

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    Widget toggleCard(String type) {
      return Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: EdgeInsets.all(defaultMargin - 12),
        decoration: BoxDecoration(
            border: Border.all(
                width: 1,
                color: type == "humidity" && notifHumidity == true ||
                        type == "uv" && notifUv == true ||
                        type == "ph" && notifPH == true
                    ? green
                    : const Color(0xff757575).withOpacity(0)),
            borderRadius: BorderRadius.circular(defaultRadius),
            color: type == "humidity" && notifHumidity == true ||
                    type == "uv" && notifUv == true ||
                    type == "ph" && notifPH == true
                ? Colors.white
                : const Color(0xff757575).withOpacity(0.45)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 230,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    type == "humidity"
                        ? "Notifikasi Kelembapan Tanah"
                        : type == "uv"
                            ? "Notifikasi index UV"
                            : "Notifikasi tingkat pH",
                    style: blackText.copyWith(
                        color: const Color(0xff757575), fontWeight: bold),
                  ),
                  Text(
                    type == "humidity"
                        ? "Dapatkan notifikasi saat tingkat kelembapan tanah rendah"
                        : type == "uv"
                            ? "Dapatkan pembaruan tentang index UV untuk tanaman Anda"
                            : "Terima peringatan saat tingkat pH di luar rentang optimal",
                    style: blackText.copyWith(
                        color: const Color.fromARGB(255, 117, 117, 117)
                            .withOpacity(0.8),
                        fontWeight: regular),
                  )
                ],
              ),
            ),
            SizedBox(
              child: RiffSwitch(
                  type: RiffSwitchType.cupertino,
                  activeColor: green,
                  value: type == "humidity"
                      ? notifHumidity
                      : type == "uv"
                          ? notifUv
                          : notifPH,
                  onChanged: (bool newvalue) {
                    setState(() {
                      type == "humidity"
                          ? notifHumidity = newvalue
                          : type == "uv"
                              ? notifUv = newvalue
                              : notifPH = newvalue;
                    });
                  }),
            )
          ],
        ),
      );
    }

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
              "Pengaturan",
              style: blackText.copyWith(fontSize: 20, fontWeight: bold),
            )
          ],
        ),
      );
    }

    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          ListView(
            children: [
              header(),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: defaultMargin, vertical: defaultMargin),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Notifikasi",
                      style: blackText.copyWith(fontSize: 18, fontWeight: bold),
                    ),
                    Text(
                      "Atur pengaturan notifikasi Anda",
                      style:
                          blackText.copyWith(fontWeight: medium, fontSize: 16),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    toggleCard("humidity"),
                    toggleCard("uv"),
                    toggleCard("ph"),
                    Text(
                      "Interval Refresh Data",
                      style: blackText.copyWith(fontSize: 18, fontWeight: bold),
                    ),
                    Text(
                      "Atur seberapa sering data harus diperbarui",
                      style:
                          blackText.copyWith(fontSize: 14, fontWeight: medium),
                    ),
                    RadioGroup.builder(
                      groupValue: radioButtonValue,
                      textStyle:
                          blackText.copyWith(fontWeight: bold, fontSize: 13),
                      activeColor: green,
                      onChanged: (value) => setState(() {
                        radioButtonValue = value ?? '';
                      }),
                      items: const [
                        "5 Menit",
                        "10 Menit",
                        "15 Menit",
                        "30 Menit",
                        "1 Jam",
                        "3 Jam",
                        "6 Jam",
                        "12 Jam",
                      ],
                      itemBuilder: (item) => RadioButtonBuilder(
                        item,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: TextButton(
                  onPressed: () {},
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(green),
                      minimumSize:
                          const MaterialStatePropertyAll(Size(320, 30))),
                  child: Text(
                    "Simpan",
                    style: whiteText,
                  )),
            ),
          ),
        ],
      )),
    );
  }
}
