import 'package:flutter/material.dart';

extension ContextExtensions on BuildContext {
  // 1. الوصول لأبعاد الشاشة بسهولة
  double get width => MediaQuery.sizeOf(this).width;
  double get height => MediaQuery.sizeOf(this).height;

  // 2. اختصار للوصول للـ Theme (ليريحك من السطر الطويل الذي سألت عنه)
  TextTheme get textTheme => Theme.of(this).textTheme;
  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  // 3. دوال مساعدة للنسب المئوية (لتقليل الـ Magic Numbers)
  double widthPct(double percent) => width * percent;
  double heightPct(double percent) => height * percent;

  // 4. معرفة اتجاه الشاشة (Orientation)
  bool get isLandscape =>
      MediaQuery.orientationOf(this) == Orientation.landscape;
}
