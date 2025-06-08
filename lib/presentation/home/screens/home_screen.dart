import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:plant_store/core/utils/app_state_wrapper.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppStateWrapper(
        builder: (colors, texts, images) => Center(
          child: TextButton(
              onPressed: () {
                final auth = FirebaseAuth.instance;

                auth.signOut();
              },
              child: Text("Log out")),
        ),
      ),
    );
  }
}
