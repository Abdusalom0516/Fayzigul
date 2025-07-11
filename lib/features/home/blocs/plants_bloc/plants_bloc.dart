import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_store/features/home/blocs/plants_bloc/plants_events.dart';
import 'package:plant_store/features/home/blocs/plants_bloc/plants_states.dart';
import 'package:plant_store/features/home/models/product_model.dart';

class PlantsBloc extends Bloc<PlantsBlocEvents, PlantsBlocStates> {
  PlantsBloc() : super(PlantsBlocInitialState()) {
    on<OnGetProductsClicked>((event, emit) async {
      emit(PlantsBlocLoadingState());

      List<ProductModel> products = [];

      try {
        final data =
            await FirebaseFirestore.instance.collection("products").get();

        for (var elem in data.docs) {
          products.add(ProductModel.fromJson(elem.data()));
        }

        emit(PlantsBlocSuccessState(products: products));
        log("Got products ${products.length}");
      } catch (e) {
        emit(PlantsBlocFailureState(message: "Failed to get products."));
        log(e.toString());
      }
    });
  }
}
