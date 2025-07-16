import 'package:flutter/material.dart';
import 'package:plant_store/core/common/consts/const_colors.dart';

Future<dynamic> loadingState(BuildContext context, ConstColors colors) {
  return showDialog(
    barrierDismissible: false,
    barrierColor: colors.ff221fif.withValues(alpha: 0.2),
    context: context,
    builder: (context) => Center(
      child: CircularProgressIndicator(
        color: colors.ff007537,
      ),
    ),
  );
}
