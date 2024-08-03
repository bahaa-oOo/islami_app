import 'package:flutter/material.dart';
import 'package:islami/ui/utils/app_assets.dart';
import 'package:islami/ui/utils/app_colors.dart';
import 'package:islami/ui/utils/app_styles.dart';


class Sebha extends StatefulWidget {
  const Sebha({super.key});

  @override
  State<Sebha> createState() => _SebhaState();
}

class _SebhaState extends State<Sebha> {
  int counter = 0;
  List<String> Azkar = [
    "الحمد لله",
    "سبحان الله",
    "الله اكبر",
    "لا اله الا الله"
  ];
  int index = 0;
  double angle = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Stack(
          alignment: Alignment.topCenter,
          children: [
            Image.asset(AppAssets.headSebha),
            Padding(
              padding: const EdgeInsets.only(top: 75.0),
              child: Transform.rotate(
                angle: angle,
                child: GestureDetector(
                  onTap: () {
                    OnTap();
                  },
                  child: Image.asset(AppAssets.icSebha),
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 27.0),
          child: Text(
            "عدد التسبيحات",
            textAlign: TextAlign.center,
            style: AppStyle.titless,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 26.0),
          child: Center(
            child: Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Text(
                "$counter",
                style: AppStyle.titless,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 26.0),
          child: Center(
            child: Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Text(
                "${Azkar[index]}",
                style: AppStyle.titless,
              ),
            ),
          ),
        ),
      ],
    );
  }

  OnTap() {
    counter++;
    if (counter % 33 == 0) {
      index++;
      counter = 0;
    }
    if (index == Azkar.length) {
      index = 0;
    }
    angle += 360 / 4;
    setState(() {});
  }
}
