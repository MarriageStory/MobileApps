import 'package:flutter/widgets.dart';

class MyFlutterApp {
  MyFlutterApp._();

  static const _kFontFam = 'MyFlutterApp';
  static const String? _kFontPkg = null;

  static const IconData home = IconData(0xe800, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData payment = IconData(0xe802, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData task = IconData(0xe803, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData user = IconData(0xe804, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData menu = IconData(0xf008, fontFamily: _kFontFam, fontPackage: _kFontPkg);
}