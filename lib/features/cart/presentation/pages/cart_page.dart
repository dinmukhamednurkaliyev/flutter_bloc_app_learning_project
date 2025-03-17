import 'package:flutter/material.dart';
import 'package:flutter_bloc_app_learning_project/features/cart/presentation/bloc/bloc/cart_bloc.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final CartBloc bloc = CartBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
