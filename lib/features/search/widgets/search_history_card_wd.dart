import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plant_store/core/common/consts/const_text_styles.dart';
import 'package:plant_store/core/utils/app_state_wrapper.dart';

class SearchHistoryCard extends StatelessWidget {
  const SearchHistoryCard({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return AppStateWrapper(
      builder: (colors, texts, images) => TextButton(
        onPressed: () {
          log("Search History Option Clicked.");
        },
        style: ButtonStyle(
          padding: WidgetStatePropertyAll(EdgeInsets.zero),
          overlayColor: WidgetStatePropertyAll(colors.transparent),
        ),
        child: SizedBox(
          height: 37.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                spacing: 11.w,
                children: [
                  Icon(
                    Icons.access_time_rounded,
                    color: colors.ffababab,
                    size: 24.r,
                  ),
                  Text(
                    title,
                    style: AppTextStyles.lato.medium(
                      color: colors.ff221fif,
                      fontSize: 17.sp,
                    ),
                  )
                ],
              ),
              Transform.translate(
                offset: Offset(9.w, 0),
                child: IconButton(
                  onPressed: () {
                    log("Close Button Clicked.");
                  },
                  style: ButtonStyle(
                    padding: WidgetStatePropertyAll(EdgeInsets.zero),
                    // overlayColor: WidgetStatePropertyAll(colors.transparent),
                  ),
                  icon: Icon(
                    Icons.close_rounded,
                    color: colors.ffababab,
                    size: 24.r,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
