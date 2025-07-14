import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:plant_store/core/common/widgets/custom_loading_wd.dart';
import 'package:plant_store/core/utils/app_state_wrapper.dart';

class AppNetworkImage extends StatelessWidget {
  final double? height;
  final double? width;
  final double? radius;
  final Widget? child;
  final String imageUrl;

  const AppNetworkImage({
    super.key,
    this.height,
    this.width,
    this.radius,
    this.child,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return AppStateWrapper(
      builder: (colors, texts, images) => CachedNetworkImage(
        height: height,
        width: height,
        imageUrl: imageUrl,
        imageBuilder: (context, image) {
          return Image(image: image, fit: BoxFit.contain);
        },
        placeholder: (context, url) => CustomLoading(),
        errorWidget: (a, b, c) => Container(
          decoration: BoxDecoration(
            color: colors.ff7D7B7B,
            borderRadius: BorderRadius.circular(radius ?? 0.0),
            image: const DecorationImage(
              image: AssetImage("assets/images/logo.png"),
              fit: BoxFit.cover,
            ),
            border: Border.all(color: colors.ff7D7B7B),
          ),
          child: child,
        ),
      ),
    );
  }
}
