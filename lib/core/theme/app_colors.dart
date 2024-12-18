import 'package:flutter/material.dart';

class AppColors {
  //######################Common Color######################
  // Basic Color
  static Color primary(context) => Theme.of(context).colorScheme.primary;
  // second Basic Color
  static Color onPrimary(context) => Theme.of(context).colorScheme.onPrimary;
  // for text and (withe x black)
  static Color textNormalColor(context) =>
      Theme.of(context).colorScheme.secondary; 
  // for hint text
  static Color hintText(context) => Theme.of(context).colorScheme.onSecondary;
    // (withe x witheGray)
  static  Color normalTextGrey (context)=> Theme.of(context).brightness == Brightness.light ?  Color(0xff736F6E) : Colors.white;
  // for background and  the same color of mode 
  static Color backgroundColorMode(context) => Theme.of(context).colorScheme.surface;
  // for second background 
  static  Color backgroundGray (context)=>Theme.of(context).brightness == Brightness.light ? Color(0xfff5f5f5) : darkColor ;
  // button
  static  Color buttonBackGroundLight (context)=>Theme.of(context).brightness == Brightness.light ? Colors.grey.shade100 : darkColor ;
  // button text (black in dark x withe in light)
  static  Color buttonTextColor (context)=>Theme.of(context).brightness == Brightness.light ? Colors.white : Colors.black ;
 
  static  Color dividerColor (context)=>Theme.of(context).brightness == Brightness.light ? Colors.grey.shade400 : Colors.white70 ;

  static Color greyBorder = Colors.grey.withOpacity(0.4); 
  //########################## only use in Dark Schema#######################
  static const Color darkColor = Color(0xff262626); // الون الغامق
  static const Color lightBlackColor = Colors.white38; //الون الاسود الفاتح جدا 
}
