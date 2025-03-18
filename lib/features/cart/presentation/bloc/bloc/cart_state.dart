part of 'cart_bloc.dart';

@immutable
abstract class CartState {}

abstract class CartActionState extends CartState {}

class CartInitialState extends CartState {}

class CartLoadingState extends CartState {}

class CartLoadedSuccessState extends CartState {
  final List<ProductModel> products;

  CartLoadedSuccessState({required this.products});
}

class CartRemoveProductItemActionState extends CartActionState {}
