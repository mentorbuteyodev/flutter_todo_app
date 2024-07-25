import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todays_plan_2/theme/theme.dart';

// default TextStyle
TextStyle toDoTextStyle({
  double? height,
  double? letterSpacing,
  double? fontSize,
  FontWeight? fontWeight,
  TextDecoration? decoration,
  Color? color,
}) =>
    GoogleFonts.lato(
      fontSize: fontSize ?? 24,
      fontWeight: fontWeight ?? FontWeight.w400,
      height: height ?? 1.5,
      letterSpacing: letterSpacing ?? 0,
      decoration: decoration ?? TextDecoration.none,
      decorationColor: kPrimaryColor,
      color: color ?? kSecondaryColors,
    );

// default TextInput Style
TextStyle toDoInputStyle({double? height}) => toDoTextStyle(
      fontSize: 22,
      height: height ?? 1.5,
    );
