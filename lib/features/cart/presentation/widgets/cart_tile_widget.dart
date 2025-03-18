import 'package:flutter/material.dart';
import 'package:flutter_bloc_app_learning_project/features/cart/presentation/bloc/bloc/cart_bloc.dart';
import 'package:flutter_bloc_app_learning_project/features/home/data/models/product_model.dart';

class CartTileWidget extends StatelessWidget {
  final ProductModel product;
  final CartBloc bloc;
  const CartTileWidget({super.key, required this.product, required this.bloc});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            width: double.maxFinite,
            decoration: BoxDecoration(
              image: DecorationImage(image: NetworkImage(product.imageUrl)),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            product.name,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(product.description),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('\$${product.price.toString()}'),
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.favorite_outline),
                  ),
                  IconButton(
                    onPressed: () {
                      bloc.add(CartRemoveItemEvent(clickedProduct: product));
                    },
                    icon: Icon(Icons.shopping_bag),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
