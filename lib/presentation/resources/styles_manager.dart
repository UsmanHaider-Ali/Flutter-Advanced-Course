import 'package:flutter/material.dart';
import 'package:flutter_advanced_course/presentation/resources/fonts_manager.dart';

TextStyle _getTextStyle(
  double fontSize,
  String fontFamily,
  FontWeight fontWeight,
  Color color,
) {
  return TextStyle(
    fontSize: fontSize,
    fontFamily: fontFamily,
    color: color,
    fontWeight: fontWeight,
  );
}

// regular style
TextStyle getRegularStyle({
  double fontSize = FontsSizeManager.s12,
  required Color color,
}) {
  return _getTextStyle(
    fontSize,
    FontsFamilyManager.fontFamily,
    FontsWeightManager.regular,
    color,
  );
}

// light text style
TextStyle getLightStyle({
  double fontSize = FontsSizeManager.s12,
  required Color color,
}) {
  return _getTextStyle(
    fontSize,
    FontsFamilyManager.fontFamily,
    FontsWeightManager.light,
    color,
  );
}

// bold text style
TextStyle getBoldStyle({
  double fontSize = FontsSizeManager.s12,
  required Color color,
}) {
  return _getTextStyle(
    fontSize,
    FontsFamilyManager.fontFamily,
    FontsWeightManager.bold,
    color,
  );
}

// semi bold text style
TextStyle getSemiBoldStyle({
  double fontSize = FontsSizeManager.s12,
  required Color color,
}) {
  return _getTextStyle(
    fontSize,
    FontsFamilyManager.fontFamily,
    FontsWeightManager.semiBold,
    color,
  );
}

// medium text style
TextStyle getMediumStyle({
  double fontSize = FontsSizeManager.s12,
  required Color color,
}) {
  return _getTextStyle(
    fontSize,
    FontsFamilyManager.fontFamily,
    FontsWeightManager.medium,
    color,
  );
}
