import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/model/sura_details_arguments.dart';
import 'package:islami/ui/utils/app_colors.dart';
import 'package:islami/ui/widgets/app_Scaffold.dart';

import '../../utils/app_styles.dart';

class SuraDetails extends StatefulWidget {
  static const String routeName = "sura_details";
  const SuraDetails({super.key});

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {
  late SuraDetailsArgs args;
  String fileContent = "";

  @override
  Widget build(BuildContext context) {
    args = ModalRoute.of(context)!.settings.arguments as SuraDetailsArgs;
    if (fileContent.isEmpty) {
      readFile();
    }
    return AppScaffold(
      appBarTitle: args.suraName,
      body:fileContent.isEmpty
          ? buildLoading()
          : buildSuraContent()

    );
  }

  Center buildLoading() {
    return Center(
      child:
      CircularProgressIndicator(color: AppColors.primary)
    );
  }

  Widget buildSuraContent() => Center(
    child: Container(
      height: MediaQuery.of(context).size.height*.8,
        width: MediaQuery.of(context).size.height*.8,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(25)),
      child: SingleChildScrollView(
        child: Text(
          fileContent,
          textAlign: TextAlign.center,
          textDirection: TextDirection.rtl,
          style: AppStyle.fontSura, // Adjust text style as needed
        ),
      ),
    ),
  );

  Future<void> readFile() async {
    fileContent = await rootBundle.loadString("assets/files/quran/${args.fileName}");
    List<String> fileLines = fileContent.split("\n");
    fileLines = fileLines.where((line) => line.trim().isNotEmpty).toList();
    for (int i = 0; i < fileLines.length; i++) {
      fileLines[i] += "(${i + 1})";
    }
    fileContent = fileLines.join();
    setState(() {});
    print("File Content = $fileContent");
  }
}
