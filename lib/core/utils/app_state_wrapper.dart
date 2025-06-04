import 'package:flutter/material.dart';
import 'package:plant_store/core/consts/const_colors.dart';
import 'package:plant_store/core/consts/const_img_paths.dart';
import 'package:plant_store/core/consts/const_texts.dart';

class AppStateWrapper extends StatelessWidget {
  const AppStateWrapper({super.key, required this.builder});
  final Widget Function(
      {required ConstColors colors,
      required ConstTexts texts,
      required ConstImgPaths images}) builder;

  @override
  Widget build(BuildContext context) {
    ConstColors colors = ConstColors();
    ConstTexts texts = ConstTexts();
    ConstImgPaths images = ConstImgPaths();

    return builder(colors: colors, texts: texts, images: images);
  }
}
