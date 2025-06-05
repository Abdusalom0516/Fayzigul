import 'package:flutter/widgets.dart';
import 'package:plant_store/core/common/consts/const_font_names.dart';

abstract class AppTextStyles {
  static Lato late = Lato();

  TextStyle regular({
    required Color color,
    required double fontSize,
  });

  TextStyle medium({
    required Color color,
    required double fontSize,
  });

  TextStyle bold({
    required Color color,
    required double fontSize,
  });

  TextStyle semiBold({
    required Color color,
    required double fontSize,
  });
}

class Lato implements AppTextStyles {
  @override
  TextStyle bold({required Color color, required double fontSize}) {
    return TextStyle(
      fontSize: fontSize,
      color: color,
      fontWeight: FontWeight.w700,
      fontFamily: ConstFontNames.lato,
    );
  }

  @override
  TextStyle medium({required Color color, required double fontSize}) {
    return TextStyle(
      fontSize: fontSize,
      color: color,
      fontWeight: FontWeight.w500,
      fontFamily: ConstFontNames.lato,
    );
  }

  @override
  TextStyle regular({required Color color, required double fontSize}) {
    return TextStyle(
      fontSize: fontSize,
      color: color,
      fontWeight: FontWeight.w400,
      fontFamily: ConstFontNames.lato,
    );
  }

  @override
  TextStyle semiBold({required Color color, required double fontSize}) {
    return TextStyle(
      fontSize: fontSize,
      color: color,
      fontWeight: FontWeight.w600,
      fontFamily: ConstFontNames.lato,
    );
  }
}
