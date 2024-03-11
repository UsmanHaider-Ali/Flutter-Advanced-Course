import 'package:flutter/material.dart';
import 'package:flutter_advanced_course/presentation/resources/colors_manager.dart';
import 'package:flutter_advanced_course/presentation/resources/fonts_manager.dart';
import 'package:flutter_advanced_course/presentation/resources/styles_manager.dart';
import 'package:flutter_advanced_course/presentation/resources/values_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    useMaterial3: false,
    // main colors of the app
    primaryColor: ColorsManager.primary,
    primaryColorLight: ColorsManager.primaryOpacity70,
    primaryColorDark: ColorsManager.darkPrimary,
    disabledColor: ColorsManager.grey1,
    // ripple color
    splashColor: ColorsManager.primaryOpacity70,
    // will be used incase of disabled button for example
    // accentColor: ColorsManager.grey,
    // card view theme
    cardTheme: CardTheme(
      color: ColorsManager.white,
      shadowColor: ColorsManager.grey,
      elevation: SizesManager.s4,
    ),
    // App bar theme
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: ColorsManager.primary,
      elevation: SizesManager.s4,
      shadowColor: ColorsManager.primaryOpacity70,
      titleTextStyle: getRegularStyle(
        color: ColorsManager.white,
        fontSize: FontsSizeManager.s16,
      ),
    ),
    // Button theme
    buttonTheme: ButtonThemeData(
      shape: const StadiumBorder(),
      disabledColor: ColorsManager.grey1,
      buttonColor: ColorsManager.primary,
      splashColor: ColorsManager.primaryOpacity70,
    ),
    // elevated button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: getRegularStyle(color: ColorsManager.white),
        // primary: ColorsManager.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            SizesManager.s12,
          ),
        ),
      ),
    ),
    // Text theme
    textTheme: TextTheme(
      displayLarge: getSemiBoldStyle(
        color: ColorsManager.darkGrey,
        fontSize: FontsSizeManager.s16,
      ),
      titleMedium: getMediumStyle(
        color: ColorsManager.lightGrey,
        fontSize: FontsSizeManager.s14,
      ),
      bodySmall: getRegularStyle(
        color: ColorsManager.grey1,
      ),
      bodyLarge: getRegularStyle(
        color: ColorsManager.grey,
      ),
    ),
    // input decoration theme (text form field)
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(
        PaddingsManager.p8,
      ),
      // hint style
      hintStyle: getRegularStyle(
        color: ColorsManager.grey1,
      ),
      // label style
      labelStyle: getMediumStyle(
        color: ColorsManager.darkGrey,
      ),
      // error style
      errorStyle: getRegularStyle(
        color: ColorsManager.error,
      ),
      // enabled border
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorsManager.grey,
          width: SizesManager.s1_5,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(
            SizesManager.s8,
          ),
        ),
      ),
      // focused border
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorsManager.primary,
          width: SizesManager.s1_5,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(
            SizesManager.s8,
          ),
        ),
      ),
      // error border
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorsManager.error,
          width: SizesManager.s1_5,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(
            SizesManager.s8,
          ),
        ),
      ),
      // focused error border
      focusedErrorBorder: OutlineInputBorder(
        borderSide:
            BorderSide(color: ColorsManager.primary, width: SizesManager.s1_5),
        borderRadius: const BorderRadius.all(
          Radius.circular(
            SizesManager.s8,
          ),
        ),
      ),
    ),
  );
}
