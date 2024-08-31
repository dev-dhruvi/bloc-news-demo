import 'package:bloc_news_app/core/constants/strings/strings.dart';
import 'package:flutter/material.dart';

class Resources {
  final BuildContext _context;
  Resources(this._context);

  Strings? get strings {
    return Localizations.of<Strings>(_context, Strings);
  }

  static Resources of(BuildContext context) {
    return Resources(context);
  }
}
