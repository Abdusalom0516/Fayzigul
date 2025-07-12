import 'package:flutter/material.dart';

class CustomSliverSizedBoxShrink extends StatelessWidget {
  const CustomSliverSizedBoxShrink({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox.shrink(),
    );
  }
}
