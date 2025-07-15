import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plant_store/core/utils/app_state_wrapper.dart';

class CircleArrowIconButton extends StatelessWidget {
  const CircleArrowIconButton({
    super.key,
    required this.func,
    required this.icon,
  });
  final VoidCallback func;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return AppStateWrapper(
      builder: (colors, texts, images) => TextButton(
        style: ButtonStyle(
          padding: WidgetStatePropertyAll(EdgeInsets.zero),
        ),
        onPressed: func,
        child: Card(
          elevation: 3.5.r,
          shape: CircleBorder(),
          child: Container(
            height: 45.w,
            width: 45.w,
            decoration: BoxDecoration(
              color: colors.ffffffff,
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: colors.ff221fif,
              size: 24.r,
            ),
          ),
        ),
      ),
    );
  }
}
