import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_app_learning_project/features/cart/presentation/bloc/bloc/cart_bloc.dart';
import 'package:flutter_bloc_app_learning_project/features/cart/presentation/widgets/cart_tile_widget.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final CartBloc bloc = CartBloc();
  @override
  void initState() {
    bloc.add(CartInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.teal, title: Text('Cart')),
      body: BlocConsumer<CartBloc, CartState>(
        bloc: bloc,
        listener: (context, state) {},
        listenWhen: (previous, current) => current is CartActionState,
        buildWhen: (previous, current) => current is! CartActionState,
        builder: (context, state) {
          switch (state.runtimeType) {
            case const (CartLoadingState):
              return Scaffold(body: Center(child: CircularProgressIndicator()));
            case const (CartLoadedSuccessState):
              final successState = state as CartLoadedSuccessState;
              return ListView.builder(
                itemCount: successState.products.length,
                itemBuilder: (context, index) {
                  return CartTileWidget(
                    bloc: bloc,
                    product: successState.products[index],
                  );
                },
              );
            default:
              return Container();
          }
        },
      ),
    );
  }
}
