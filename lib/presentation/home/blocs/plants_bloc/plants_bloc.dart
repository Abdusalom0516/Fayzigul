import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_store/presentation/home/blocs/plants_bloc/plants_events.dart';
import 'package:plant_store/presentation/home/blocs/plants_bloc/plants_states.dart';
import 'package:plant_store/presentation/home/models/product_model.dart';

class HomeScreenBloc extends Bloc<HomeScreenEvents, HomeScreenStates> {
  HomeScreenBloc() : super(HomeScreenInitialState()) {
    on<OnGetProductsClicked>((event, emit) async {
      emit(HomeScreenLoadingState());

      List<ProductModel> products = [];

      try {
        final data =
            await FirebaseFirestore.instance.collection("products").get();

        for (var elem in data.docs) {
          products.add(ProductModel.fromJson(elem.data()));
        }

        emit(HomeScreenSuccessState(products: products));
        log("Got products ${products.length}");
      } catch (e) {
        emit(HomeScreenFailureState(message: "Failed to get products."));
        log(e.toString());
      }
    });
  }
}
