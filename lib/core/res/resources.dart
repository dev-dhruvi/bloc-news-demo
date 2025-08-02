import 'package:bloc_news_app/core/constants/app_colors.dart';
import 'package:bloc_news_app/core/constants/app_dimension.dart';
import 'package:bloc_news_app/core/constants/app_drawable.dart';
import 'package:bloc_news_app/core/constants/app_style.dart';
import 'package:bloc_news_app/core/constants/strings/strings.dart';
import 'package:flutter/material.dart';

class Resources {
  final BuildContext _context;
  Resources(this._context);

  Strings? get strings {
    return Localizations.of<Strings>(_context, Strings);
  }

  AppColors get color {
    return AppColors();
  }

  AppDimension get dimension {
    return AppDimension();
  }

  AppStyle get style {
    return AppStyle();
  }

  AppDrawable get drawable {
    return AppDrawable();
  }

  static Resources of(BuildContext context) {
    return Resources(context);
  }
}
