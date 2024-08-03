import 'package:flutter/material.dart';

import 'package:islami/ui/screens/home/tabs/ahadeth/ahadeth_details.dart';
import 'package:islami/ui/screens/home/tabs/ahadeth/ahadeth_tap.dart';

class ItemHadethName extends StatelessWidget {
  Hadeth hadeth;
   ItemHadethName({required this.hadeth});

  @override
  Widget build(BuildContext context) {
  return InkWell(
      onTap: (){
      Navigator.pushNamed(context, HadethDetails.routeName,arguments: hadeth);
      },
      child: Text(hadeth.title,textAlign: TextAlign.center,style: Theme.of(context).textTheme.displayMedium,),
    );
  }
}
