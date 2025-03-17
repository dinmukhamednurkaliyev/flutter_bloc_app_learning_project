import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_app_learning_project/features/cart/presentation/pages/cart_page.dart';
import 'package:flutter_bloc_app_learning_project/features/home/presentation/bloc/bloc/home_bloc.dart';
import 'package:flutter_bloc_app_learning_project/features/home/presentation/widgets/product_tile_widget.dart';
import 'package:flutter_bloc_app_learning_project/features/wishlist/presentation/pages/wishlist_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    bloc.add(HomeInitialEvent());
    super.initState();
  }

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
        } else if (state is HomeProductItemWishlistActionState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Added to Wishlist'),
              duration: Duration(seconds: 1),
            ),
          );
        } else if (state is HomeProductItemCartActionState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Added to Cart'),
              duration: Duration(seconds: 1),
            ),
          );
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case const (HomeLoadingState):
            return Scaffold(body: Center(child: CircularProgressIndicator()));
          case const (HomeLoadedSuccessState):
            final successState = state as HomeLoadedSuccessState;
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
              body: ListView.builder(
                itemCount: successState.products.length,
                itemBuilder: (context, index) {
                  return ProductTileWidget(
                    bloc: bloc,
                    product: successState.products[index],
                  );
                },
              ),
            );
          case const (HomeErrorState):
            return Scaffold(body: Center(child: Text('Error')));
          default:
            return SizedBox();
        }
      },
    );
  }
}
