import 'package:flutter/material.dart';
import 'package:weather_task2/Presentation/data_resources/color.dart';
import 'package:weather_task2/Presentation/data_resources/fonts.dart';
import 'package:weather_task2/Presentation/data_resources/style.dart';
import 'package:weather_task2/Presentation/data_resources/values.dart';
ThemeData getApplicationTheme() {
  return ThemeData(
    brightness: Brightness.light,
    primaryColor: ColorManager.primary,
    primaryColorLight: ColorManager.lightPrimary,
    primaryColorDark: ColorManager.darkPrimary,

    splashColor: ColorManager.lightPrimary,
    cardTheme: CardTheme(
        color: ColorManager.white,
        shadowColor: Colors.grey,
        elevation: AppSize.s4),
    buttonTheme: ButtonThemeData(
        shape: const StadiumBorder(),
        buttonColor: ColorManager.primary,
        splashColor: ColorManager.lightPrimary),

    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            textStyle: getRegularStyle(
                color: ColorManager.white, fontSize: FontSize.s17),
            primary: ColorManager.primary,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSize.s12)))),

    textTheme: TextTheme(
        displayLarge:
        getSemiBoldStyle(color: ColorManager.white, fontSize: FontSize.s16),
        headlineLarge:
        getSemiBoldStyle(color: ColorManager.white, fontSize: FontSize.s16),
        headlineMedium:
        getRegularStyle(color: ColorManager.grey, fontSize: FontSize.s14),
        titleMedium:
        getMediumStyle(color: ColorManager.primary, fontSize: FontSize.s16),
        bodyLarge: getRegularStyle(color: ColorManager.grey),
        bodySmall: getRegularStyle(color: ColorManager.grey)),
    inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.all(AppPadding.p8),
        hintStyle:
        getRegularStyle(color: ColorManager.grey, fontSize: FontSize.s14),
        labelStyle:
        getMediumStyle(color: ColorManager.grey, fontSize: FontSize.s14),
        errorStyle: getRegularStyle(color: ColorManager.error),
        enabledBorder: OutlineInputBorder(
            borderSide:
            BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
            borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),
        focusedBorder: OutlineInputBorder(
            borderSide:
            BorderSide(color: ColorManager.grey, width: AppSize.s1_5),
            borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),
        errorBorder: OutlineInputBorder(
            borderSide:
            BorderSide(color: ColorManager.error, width: AppSize.s1_5),
            borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),
        focusedErrorBorder: OutlineInputBorder(
            borderSide:
            BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
            borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)))),
  );
}