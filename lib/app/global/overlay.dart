import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UiOverlayCustom {
  static returnUiColorOnDemand(
      {required Brightness sBB,
      required Brightness sBIB,
      required Color sBC,
      required Color sNBC}) {
    var ui = SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarBrightness: sBB,
        statusBarIconBrightness: sBIB,
        statusBarColor: sBC,
        systemNavigationBarColor: sNBC));
    return ui;
  }
}
