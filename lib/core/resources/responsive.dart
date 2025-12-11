import 'package:flutter/material.dart';

extension ResponsiveExtensions on BuildContext {
  bool get _isTablet =>
      MediaQuery
          .of(this)
          .size
          .shortestSide >= 600;

  double widthPct(double pct) {
    final screenWidth = MediaQuery
        .of(this)
        .size
        .width;
    return _isTablet ? (screenWidth * (pct / 120)) : (screenWidth *
        (pct / 100));
  }

  double heightPct(double pct) {
    final screenHeight = MediaQuery
        .of(this)
        .size
        .height;
    return _isTablet ? (screenHeight * (pct / 120)) : (screenHeight *
        (pct / 100));
  }

  double marginDimen() {
    final width = MediaQuery
        .of(this)
        .size
        .width;
    return _isTablet ? width * 0.03 : width * 0.04;
  }

  double _calculateFontSize(double percentage) =>
      MediaQuery
          .of(this)
          .size
          .width * percentage;


  double textSmall_14() =>
      _calculateFontSize(
        _isTablet ? 0.023 : 0.027,);

  double textNormal_16() =>
      _calculateFontSize(_isTablet ? 0.028 : 0.032);

  double textMedium_18() =>
      _calculateFontSize(_isTablet ? 0.033 : 0.037);

  double textLargeTitle_20() =>
      _calculateFontSize(_isTablet ? 0.034 : 0.040);
}