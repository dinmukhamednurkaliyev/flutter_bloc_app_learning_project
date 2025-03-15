import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitialState()) {
    on<HomeWishlistButtonNavigateClickedEvent>(
      homeWishlistButtonNavigateClickedEvent,
    );
    on<HomeCartButtonNavigateClickedEvent>(homeCartButtonNavigateClickedEvent);
    on<HomeProductWishlistButtonClickedEvent>(
      homeProductWishlistButtonClickedEvent,
    );
    on<HomeProductCartButtonClickedEvent>(homeProductCartButtonClickedEvent);
  }

  FutureOr<void> homeWishlistButtonNavigateClickedEvent(
    HomeWishlistButtonNavigateClickedEvent event,
    Emitter<HomeState> emit,
  ) {}

  FutureOr<void> homeCartButtonNavigateClickedEvent(
    HomeCartButtonNavigateClickedEvent event,
    Emitter<HomeState> emit,
  ) {}

  FutureOr<void> homeProductWishlistButtonClickedEvent(
    HomeProductWishlistButtonClickedEvent event,
    Emitter<HomeState> emit,
  ) {}

  FutureOr<void> homeProductCartButtonClickedEvent(
    HomeProductCartButtonClickedEvent event,
    Emitter<HomeState> emit,
  ) {}
}
