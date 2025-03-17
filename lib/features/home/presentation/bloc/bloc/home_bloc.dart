import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_app_learning_project/core/data/cart_items.dart';
import 'package:flutter_bloc_app_learning_project/core/data/grocery_data.dart';
import 'package:flutter_bloc_app_learning_project/core/data/wishlist_items.dart';
import 'package:flutter_bloc_app_learning_project/features/home/data/models/product_model.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitialState()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<HomeWishlistButtonNavigateClickedEvent>(
      homeWishlistButtonNavigateClickedEvent,
    );
    on<HomeCartButtonNavigateClickedEvent>(homeCartButtonNavigateClickedEvent);
    on<HomeProductWishlistButtonClickedEvent>(
      homeProductWishlistButtonClickedEvent,
    );
    on<HomeProductCartButtonClickedEvent>(homeProductCartButtonClickedEvent);
  }

  FutureOr<void> homeInitialEvent(
    HomeInitialEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(HomeLoadingState());
    await Future.delayed(Duration(seconds: 3));
    emit(
      HomeLoadedSuccessState(
        products:
            GroceryData.groceryProducts
                .map(
                  (element) => ProductModel(
                    id: element['id'],
                    name: element['name'],
                    description: element['description'],
                    price: element['price'],
                    imageUrl: element['imageUrl'],
                  ),
                )
                .toList(),
      ),
    );
  }

  FutureOr<void> homeWishlistButtonNavigateClickedEvent(
    HomeWishlistButtonNavigateClickedEvent event,
    Emitter<HomeState> emit,
  ) {
    emit(HomeNavigateToWishlistPageActionState());
  }

  FutureOr<void> homeCartButtonNavigateClickedEvent(
    HomeCartButtonNavigateClickedEvent event,
    Emitter<HomeState> emit,
  ) {
    emit(HomeNavigateToCartPageActionState());
  }

  FutureOr<void> homeProductWishlistButtonClickedEvent(
    HomeProductWishlistButtonClickedEvent event,
    Emitter<HomeState> emit,
  ) {
    wishlistItems.add(event.clickedProduct);
    emit(HomeProductItemWishlistActionState());
  }

  FutureOr<void> homeProductCartButtonClickedEvent(
    HomeProductCartButtonClickedEvent event,
    Emitter<HomeState> emit,
  ) {
    cartItems.add(event.clickedProduct);
    emit(HomeProductItemCartActionState());
  }
}
