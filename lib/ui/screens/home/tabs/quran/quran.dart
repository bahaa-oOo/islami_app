import 'package:flutter/material.dart';
import 'package:islami/model/sura_details_arguments.dart';
import 'package:islami/ui/screens/sura_details/sura_details.dart';
import 'package:islami/ui/utils/app_colors.dart';
import 'package:islami/ui/utils/app_styles.dart';
import 'package:islami/ui/utils/constant.dart';

import '../../../../utils/app_assets.dart';
class Quran extends StatelessWidget {
  const Quran({super.key});




  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        buildHeaderImage(),

        Expanded(
          flex: 7,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Column(children: [
                buildDivider(),
                Row(

                  children: [
                    Expanded(child: Text("Sura Name",style:Theme.of(context).textTheme.displayMedium,textAlign: TextAlign.center,)),
                    Expanded(child: Text("Verses",style:Theme.of(context).textTheme.displayMedium,textAlign: TextAlign.center,))
                  ],
                ),
                buildDivider(),
                buildSurasList()],),
              VerticalDivider(color: AppColors.primary,thickness: 3,indent: 10,)
            ],
          ),
        )
      ],

    );
  }

  Expanded buildSurasList() =>  Expanded(flex: 7,child: ListView.builder(
      itemCount: Constants.suraNames.length ,
      itemBuilder: (context,index){
        return InkWell(
          onTap: (){
            Navigator.pushNamed(context, SuraDetails.routeName,arguments: SuraDetailsArgs(suraName: Constants.suraNames[index], fileName: "${index+1}.txt"));
          },
          child: Row(
            children: [
              Expanded(child: Text(Constants.suraNames[index],style:Theme.of(context).textTheme.displayMedium,textAlign: TextAlign.center,)),
              Expanded(child: Text(Constants.versesNumber[index].toString(),style:Theme.of(context).textTheme.displayMedium,textAlign: TextAlign.center,))
            ],
          ),
        );

      }),);

  Divider buildDivider() =>  Divider(color: AppColors.primary,thickness: 3,);

  Expanded buildHeaderImage() {
    return Expanded(
        flex: 3,
        child: Image.asset(AppAssets.quranTapLogo),
      );
  }
}
