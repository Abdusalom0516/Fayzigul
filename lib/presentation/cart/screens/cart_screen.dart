import 'package:flutter/material.dart';
import 'package:plant_store/core/utils/app_state_wrapper.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppStateWrapper(
      builder: (colors, texts, images) => Scaffold(
        body: CustomScrollView(),
      ),
    );
  }
}
