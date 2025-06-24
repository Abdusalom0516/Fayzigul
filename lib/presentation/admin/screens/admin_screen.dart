import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plant_store/core/common/widgets/custom_text_button_wd.dart';
import 'package:plant_store/core/utils/app_state_wrapper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:plant_store/presentation/admin/data.dart';

class AdminScreen extends StatelessWidget {
  const AdminScreen({super.key});

  Future<void> uploadProductToFirestore() async {
    try {
      for (var product in data) {
        // await FirebaseFirestore.instance.collection('products').add(product);
        final docRef = await FirebaseFirestore.instance
            .collection('/products')
            .add(product);
        await docRef.update({"id": docRef.id});
        log("Success");
      }
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppStateWrapper(
      builder: (colors, texts, images) => Scaffold(
        body: CustomScrollView(
          physics: NeverScrollableScrollPhysics(),
          slivers: [
            SliverPadding(
              padding: EdgeInsetsGeometry.symmetric(horizontal: 25.r),
              sliver: SliverFillRemaining(
                child: Center(
                  child: CustomTextButton(
                    buttonText: "Add",
                    textColor: colors.ffffffff,
                    backgroundColor: colors.ff007537,
                    func: () async {
                      await uploadProductToFirestore();
                    },
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
