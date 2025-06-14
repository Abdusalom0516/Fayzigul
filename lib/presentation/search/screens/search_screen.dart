import 'package:flutter/material.dart';
import 'package:plant_store/core/utils/app_state_wrapper.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppStateWrapper(
      builder: (colors, texts, images) => Scaffold(
        backgroundColor: colors.ffffffff,
        body: CustomScrollView(
          slivers: [],
        ),
      ),
    );
  }
}
