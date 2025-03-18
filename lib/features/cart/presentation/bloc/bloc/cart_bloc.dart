import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_app_learning_project/core/data/cart_items.dart';
import 'package:flutter_bloc_app_learning_project/features/home/data/models/product_model.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitialState()) {
    on<CartInitialEvent>(cartInitialEvent);
  }

  FutureOr<void> cartInitialEvent(
    CartInitialEvent event,
    Emitter<CartState> emit,
  ) async {
    emit(CartLoadingState());
    await Future.delayed(Duration(seconds: 3));
    emit(CartLoadedSuccessState(products: cartItems));
  }
}
