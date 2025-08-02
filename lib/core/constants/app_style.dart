import 'package:bloc_news_app/core/constants/app_colors.dart';
import 'package:bloc_news_app/core/constants/app_dimension.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter/material.dart';

class AppStyle {
  TextStyle headingTextStyle = TextStyle(
      fontSize: AppDimension().defaultText,
      fontWeight: FontWeight.bold,
      color: AppColors().colorPrimaryText);

  TextStyle subHeadingTextStyle = TextStyle(
      fontSize: AppDimension().mediumText,
      fontWeight: FontWeight.w600,
      color: AppColors().colorSecondaryText);

  TextStyle appbarTitleStyle = TextStyle(
      fontSize: AppDimension().defaultText,
      fontWeight: FontWeight.w600,
      color: AppColors().colorAppbarTitle);

  TextStyle linkTextStyle = TextStyle(
      fontSize: AppDimension().defaultText,
      fontWeight: FontWeight.w600,
      color: AppColors().colorLink);

  TextStyle whiteTextStyle = TextStyle(
      fontSize: AppDimension().defaultText,
      fontWeight: FontWeight.w600,
      color: Colors.white);

  TextStyle whiteTextSmallStyle = TextStyle(
      fontSize: AppDimension().smallText,
      fontWeight: FontWeight.w600,
      color: Colors.white);

  TextStyle drawerTextStyle = TextStyle(
      fontSize: AppDimension().mediumText,
      fontWeight: FontWeight.w600,
      color: AppColors().colorAppbarTitle);

  TextStyle drawerSubTextStyle = TextStyle(
      fontSize: AppDimension().mediumText,
      fontWeight: FontWeight.w400,
      color: AppColors().colorPrimary.shade900);

  IconThemeData appbarIconTheme =
      IconThemeData(color: AppColors().colorAppbarTitle);
}

double defaultPadding = 14.h;
double defaultRadius = 10.r;

double defaultTopPadding = ScreenUtil().statusBarHeight + defaultPadding;
double defaultBottomPadding = ScreenUtil().bottomBarHeight == 0.0
    ? defaultPadding
    : ScreenUtil().bottomBarHeight + defaultPadding;
