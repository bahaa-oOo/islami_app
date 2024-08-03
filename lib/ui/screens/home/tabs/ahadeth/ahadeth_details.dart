import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/ui/screens/home/tabs/ahadeth/item_hadeth_details.dart';
import 'package:islami/ui/widgets/app_Scaffold.dart';
import '../../../../utils/app_styles.dart';
import 'ahadeth_tap.dart';

class HadethDetails extends StatefulWidget {
  static const String routeName = "hadeth_details";
  const HadethDetails({super.key});

  @override
  State<HadethDetails> createState() => _HadethDetailsState();
}

class _HadethDetailsState extends State<HadethDetails> {



  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as Hadeth;
    return AppScaffold(
        appBarTitle: args.title,
        body:
        Container(
          child: ListView.builder(itemBuilder:(context,index){
            return ItemHadethDetails(content: args.content[index]);
          } ,itemCount:args.content.length),
        )

    );
  }



  Widget buildHadethContent(String contant) => Center(
    child: Container(
      height: MediaQuery.of(context).size.height*.8,
      width: MediaQuery.of(context).size.height*.8,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(25)),
      child: SingleChildScrollView(
        child: Text(
          contant,
          textAlign: TextAlign.center,
          textDirection: TextDirection.rtl,
          style: AppStyle.fontSura, // Adjust text style as needed
        ),
      ),
    ),
  );


}
