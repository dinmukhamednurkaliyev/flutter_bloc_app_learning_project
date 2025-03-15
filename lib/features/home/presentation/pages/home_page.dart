import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_app_learning_project/features/cart/presentation/pages/cart_page.dart';
import 'package:flutter_bloc_app_learning_project/features/home/presentation/bloc/bloc/home_bloc.dart';
import 'package:flutter_bloc_app_learning_project/features/wishlist/presentation/pages/wishlist_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeBloc bloc = HomeBloc();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: bloc,
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is! HomeActionState,
      listener: (context, state) {
        if (state is HomeNavigateToCartPageActionState) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CartPage()),
          );
        } else if (state is HomeNavigateToWishlistPageActionState) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => WishlistPage()),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.teal,
            title: Text('Grocery App'),
            actions: [
              IconButton(
                onPressed: () {
                  bloc.add(HomeWishlistButtonNavigateClickedEvent());
                },
                icon: Icon(Icons.favorite_outline),
              ),
              IconButton(
                onPressed: () {
                  bloc.add(HomeCartButtonNavigateClickedEvent());
                },
                icon: Icon(Icons.shopping_bag_outlined),
              ),
            ],
          ),
        );
      },
    );
  }
}
