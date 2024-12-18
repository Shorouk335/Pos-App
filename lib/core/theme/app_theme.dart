import 'package:e_ticket_app/core/theme/app_colors.dart';
import 'package:e_ticket_app/core/theme/color_schema.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:material_color_gen/material_color_gen.dart';

class ThemeManager {
  // singleton
  ThemeManager._internal();
  static final ThemeManager _instance = ThemeManager._internal();
  factory ThemeManager() => _instance;

  static ThemeData lightTheme() {
    return ThemeData(

        // color schema
        colorScheme: AppColorsSchema.lightSchema,
        // primary
        primarySwatch: AppColorsSchema.lightSchema.primary.toMaterialColor(),
        //scaffold
        scaffoldBackgroundColor: AppColorsSchema.lightSchema.surface,
        // appBar
        appBarTheme: AppBarTheme(
            backgroundColor: AppColorsSchema.lightSchema.primary,
            elevation: 0.0,
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: AppColorsSchema.lightSchema.primary,
              statusBarIconBrightness: Brightness.light,
            )),
        //dialog
        dialogBackgroundColor: AppColorsSchema.lightSchema.surface,
        // check box
        checkboxTheme: CheckboxThemeData(
          side: BorderSide(color: Colors.grey),
        ),
        //divider
        dividerTheme: DividerThemeData(color: Colors.grey.shade400),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                backgroundColor: AppColorsSchema.lightSchema.primary,
                foregroundColor: Colors.black)),
        bottomSheetTheme: BottomSheetThemeData(
            backgroundColor: AppColorsSchema.lightSchema.surface));
  }

  static ThemeData darkTheme() {
    return ThemeData(
      //color schema
      colorScheme: AppColorsSchema.darkSchema,
      // primary
      primarySwatch: AppColorsSchema.darkSchema.primary.toMaterialColor(),
      //scaffold
      scaffoldBackgroundColor: AppColorsSchema.darkSchema.surface,
      // appBar
      appBarTheme: AppBarTheme(
          backgroundColor: AppColorsSchema.darkSchema.surface,
          elevation: 0.0,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: AppColors.darkColor,
            statusBarIconBrightness: Brightness.light,
          )),
      //dialog
      dialogBackgroundColor: AppColorsSchema.darkSchema.surface,
      //check box
      checkboxTheme: CheckboxThemeData(
        side: BorderSide(color: Colors.white),
      ),
      //divider
      dividerTheme: DividerThemeData(color: Colors.white70),

      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: AppColorsSchema.darkSchema.primary,
              foregroundColor: Colors.white)),
      bottomSheetTheme: BottomSheetThemeData(
          backgroundColor: AppColorsSchema.darkSchema.surface),
    );
  }
}
