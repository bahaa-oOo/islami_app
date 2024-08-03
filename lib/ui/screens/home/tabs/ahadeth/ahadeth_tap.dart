import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/ui/screens/home/tabs/ahadeth/item_ahadeth_name.dart';
import '../../../../utils/app_assets.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_styles.dart';


class Ahadeth extends StatefulWidget {

  Ahadeth({super.key});

  @override
  State<Ahadeth> createState() => _AhadethState();
}

class _AhadethState extends State<Ahadeth> {
  List<Hadeth> ahadethList = [];

  @override
  void initState() {
    super.initState();
    loadHadethFile();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: Image.asset(AppAssets.ahadethTapLogo)),
        Divider(
          color: AppColors.primary,
          thickness: 3,
        ),
        Text('الاحاديث', style: Theme.of(context).textTheme.displayMedium,),
        Divider(
          color: AppColors.primary,
          thickness: 3,
        ),
        Expanded(
          flex: 2,
          child: ahadethList.isEmpty
              ? Center(
            child: CircularProgressIndicator(
              color: AppColors.primary,
            ),
          )
              : ListView.separated(
            separatorBuilder: (context, index) {
              return Divider(color: AppColors.primary, thickness: 2);
            },
            itemBuilder: (context, index) {
              return ListTile(
                title: ItemHadethName(hadeth :ahadethList[index]),
                onTap: () {
                  // Navigate to details screen if needed
                },
              );
            },
            itemCount: ahadethList.length,
          ),
        ),
      ],
    );
  }

  void loadHadethFile() async {
    String hadethContent = await rootBundle.loadString("assets/files/ahadeth.txt");
    List<String> hadethList = hadethContent.split("#\r\n");
    for (int i = 0; i < hadethList.length; i++) {
      List<String> hadethLines = hadethList[i].split("\n");
      String hadethName = hadethLines[0];
      hadethLines.removeAt(0);
      Hadeth hadeth = Hadeth(title: hadethName, content: hadethLines);
      ahadethList.add(hadeth);
    }
    setState(() {});
  }
}

class Hadeth {
  String title;
  List<String> content;

  Hadeth({required this.title, required this.content});
}
