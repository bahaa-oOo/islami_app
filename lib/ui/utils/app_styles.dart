import 'package:flutter/material.dart';
import 'package:islami/ui/utils/app_colors.dart';

abstract class AppStyle {
 static const TextStyle appBarTextStyle = TextStyle(color: AppColors.accent , fontSize: 30 ,fontWeight:FontWeight.bold );
 static const TextStyle titles = TextStyle(color: AppColors.accent , fontSize: 22 ,fontWeight:FontWeight.w600 );
 static const TextStyle titless = TextStyle(color: AppColors.accent , fontSize: 29 ,fontWeight:FontWeight.w900 );
 static const TextStyle  fontSura= TextStyle(color: AppColors.accent , fontSize: 20 ,fontWeight:FontWeight.w900 );
 static const TextStyle  lang= TextStyle(color:AppColors.accentDark , fontSize: 18 ,fontWeight:FontWeight.w600 );
 static const TextStyle  languag= TextStyle(color:AppColors.accent , fontSize: 18 ,fontWeight:FontWeight.w600 );

 static ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor: AppColors.transparent,
  primaryColor: AppColors.primary,
  appBarTheme:  AppBarTheme(
   backgroundColor: AppColors.transparent,
   titleTextStyle: appBarTextStyle,
   elevation: 0,
   centerTitle: true,

  ),
   textTheme: TextTheme(
     displayLarge: appBarTextStyle,
     displayMedium: titles,
     displaySmall: languag,

   ),
     bottomNavigationBarTheme: BottomNavigationBarThemeData(
     selectedItemColor: AppColors.accent,
 )
 );
 static ThemeData  darkTheme = ThemeData(
     scaffoldBackgroundColor: AppColors.transparent,
     primaryColor: AppColors.primaryDark,
     appBarTheme:  AppBarTheme(
       backgroundColor: AppColors.transparent,
       titleTextStyle: appBarTextStyle.copyWith(color: AppColors.white),
       elevation: 0,
       centerTitle: true,
     ),

     textTheme: TextTheme(
       displayLarge: appBarTextStyle.copyWith(color: AppColors.white),
       displayMedium: titles.copyWith(color: AppColors.white),
       displaySmall: lang,

     ),
   bottomNavigationBarTheme: BottomNavigationBarThemeData(
   selectedItemColor: AppColors.accentDark,
 )
 );
}