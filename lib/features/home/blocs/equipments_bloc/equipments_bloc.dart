import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_store/features/home/blocs/equipments_bloc/equipments_bloc_events.dart';
import 'package:plant_store/features/home/blocs/equipments_bloc/equipments_bloc_state.dart';
import 'package:plant_store/features/home/models/product_model.dart';

class EquipmentsBloc extends Bloc<EquipmentsBlocEvents, EquipmentsBlocState> {
  EquipmentsBloc() : super(EquipmentsBlocInitialState()) {
    on<OnGetEquipmentsClicked>(
      (event, emit) async {
        emit(EquipmentsBlocLoadingState());

        List<ProductModel> listOfProducts = [];

        try {
          final data =
              await FirebaseFirestore.instance.collection("equipments").get();

          for (var elem in data.docs) {
            listOfProducts.add(ProductModel.fromJson(elem.data()));
          }

          emit(EquipmentsBlocSuccessState(listOfProducts: listOfProducts));
          log("Got products ${listOfProducts.length}");
        } catch (e) {
          emit(EquipmentsBlocFailureState(message: "Failed to get products."));
          log(e.toString());
        }
      },
    );
  }
}
