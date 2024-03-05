import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../color/color.dart';

class AppTheme{
  static ThemeData lightTheme=ThemeData(
    scaffoldBackgroundColor: AppColors.white,
    appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.white,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.light ,
          statusBarBrightness: Brightness.dark,
          statusBarColor: AppColors.white,
        )
    ),
    iconButtonTheme: IconButtonThemeData(
      style: IconButton.styleFrom(
        backgroundColor: AppColors.black
      )
    ),
    textTheme:TextTheme(
        displayLarge:TextStyle(
          fontSize: 57.sp,
          color: AppColors.black,
          fontFamily: "Inter",
          fontWeight: FontWeight.w400,
        ),
        displayMedium: TextStyle(
          fontSize: 45.sp,
          color: AppColors.black,
          fontFamily: "Inter",
          fontWeight: FontWeight.w400,
        ),
        displaySmall: TextStyle(
          fontSize: 36.sp,
          color: AppColors.black,
          fontFamily: "Inter",
          fontWeight: FontWeight.w400,
        ),
        headlineLarge: TextStyle(
          fontSize: 32.sp,
          color: AppColors.black,
          fontFamily: "Inter",
          fontWeight: FontWeight.w400,
        ),
        headlineMedium:  TextStyle(
          fontSize: 28.sp,
          color: AppColors.black,
          fontFamily: "Inter",
          fontWeight: FontWeight.w400,
        ),
        headlineSmall:  TextStyle(
          fontSize: 24.sp,
          color: AppColors.black,
          fontFamily: "Inter",
          fontWeight: FontWeight.w400,
        ),
        titleLarge: TextStyle(
          fontSize: 22.sp,
          color: AppColors.black,
          fontFamily: "Inter",
          fontWeight: FontWeight.w500,
        ),
        titleMedium:  TextStyle(
          fontSize: 16.sp,
          color: AppColors.black,
          fontFamily: "Inter",
          fontWeight: FontWeight.w500,
        ),
        titleSmall:  TextStyle(
          fontSize: 14.sp,
          color: AppColors.black,
          fontFamily: "Inter",
          fontWeight: FontWeight.w500,
        ),
        labelLarge: TextStyle(
          fontSize: 14.sp,
          color: AppColors.black,
          fontFamily: "Inter",
          fontWeight: FontWeight.w500,
        ),
        labelMedium:  TextStyle(
          fontSize: 12.sp,
          color: AppColors.black,
          fontFamily: "Inter",
          fontWeight: FontWeight.w500,
        ),
        labelSmall:  TextStyle(
          fontSize: 11.sp,
          color: AppColors.black,
          fontFamily: "Inter",
          fontWeight: FontWeight.w500,
        ),
        bodyLarge: TextStyle(
          fontSize: 16.sp,
          color: AppColors.black,
          fontFamily: "Inter",
          fontWeight: FontWeight.w500,
        ),
        bodyMedium:  TextStyle(
          fontSize: 14.sp,
          color: AppColors.black,
          fontFamily: "Inter",
          fontWeight: FontWeight.w500,
        ),
        bodySmall:  TextStyle(
          fontSize: 12.sp,
          color: AppColors.black,
          fontFamily: "Inter",
          fontWeight: FontWeight.w500,
        )
    ),
  );
  static ThemeData darkTheme=ThemeData(
    scaffoldBackgroundColor: AppColors.black,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.black,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
        statusBarColor: AppColors.white,
      )
    ),
    textTheme:TextTheme(
      displayLarge:TextStyle(
        fontSize: 57.sp,
        color: AppColors.white,
        fontFamily: "Inter",
        fontWeight: FontWeight.w400,
      ),
      displayMedium: TextStyle(
        fontSize: 45.sp,
        color: AppColors.white,
        fontFamily: "Inter",
        fontWeight: FontWeight.w400,
      ),
      displaySmall: TextStyle(
        fontSize: 36.sp,
        color: AppColors.white,
        fontFamily: "Inter",
        fontWeight: FontWeight.w400,
      ),
      headlineLarge: TextStyle(
        fontSize: 32.sp,
        color: AppColors.white,
        fontFamily: "Inter",
        fontWeight: FontWeight.w400,
      ),
      headlineMedium:  TextStyle(
        fontSize: 28.sp,
        color: AppColors.white,
        fontFamily: "Inter",
        fontWeight: FontWeight.w400,
      ),
      headlineSmall:  TextStyle(
        fontSize: 24.sp,
        color: AppColors.white,
        fontFamily: "Inter",
        fontWeight: FontWeight.w400,
      ),
        titleLarge: TextStyle(
          fontSize: 22.sp,
          color: AppColors.white,
          fontFamily: "Inter",
          fontWeight: FontWeight.w500,
        ),
        titleMedium:  TextStyle(
          fontSize: 16.sp,
          color: AppColors.white,
          fontFamily: "Inter",
          fontWeight: FontWeight.w500,
        ),
        titleSmall:  TextStyle(
          fontSize: 14.sp,
          color: AppColors.white,
          fontFamily: "Inter",
          fontWeight: FontWeight.w500,
        ),
        labelLarge: TextStyle(
          fontSize: 14.sp,
          color: AppColors.white,
          fontFamily: "Inter",
          fontWeight: FontWeight.w500,
        ),
        labelMedium:  TextStyle(
          fontSize: 12.sp,
          color: AppColors.white,
          fontFamily: "Inter",
          fontWeight: FontWeight.w500,
        ),
        labelSmall:  TextStyle(
          fontSize: 11.sp,
          color: AppColors.white,
          fontFamily: "Inter",
          fontWeight: FontWeight.w500,
        ),
        bodyLarge: TextStyle(
          fontSize: 16.sp,
          color: AppColors.white,
          fontFamily: "Inter",
          fontWeight: FontWeight.w500,
        ),
        bodyMedium:  TextStyle(
          fontSize: 14.sp,
          color: AppColors.white,
          fontFamily: "Inter",
          fontWeight: FontWeight.w500,
        ),
        bodySmall:  TextStyle(
          fontSize: 12.sp,
          color: AppColors.white,
          fontFamily: "Inter",
          fontWeight: FontWeight.w500,
        )
    ),
  );
}