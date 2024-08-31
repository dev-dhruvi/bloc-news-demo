import 'package:bloc_news_app/core/res/resources.dart';
import 'package:flutter/cupertino.dart';

extension AppContext on BuildContext {
  Resources get resources => Resources.of(this);
}
