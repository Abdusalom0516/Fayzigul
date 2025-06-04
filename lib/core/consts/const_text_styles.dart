import 'package:flutter/widgets.dart';
import 'package:plant_store/core/consts/const_colors.dart';

abstract class AppTextStyles {
  

  TextStyle regulal({
    required ConstColors color,
    required double fontSize,
  });

  TextStyle medium({
    required ConstColors color,
    required double fontSize,
  });

  TextStyle bold({
    required ConstColors color,
    required double fontSize,
  });

  TextStyle semiBold({
    required ConstColors color,
    required double fontSize,
  });

}


