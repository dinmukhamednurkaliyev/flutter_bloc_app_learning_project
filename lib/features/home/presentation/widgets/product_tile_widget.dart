import 'package:flutter/material.dart';
import 'package:flutter_bloc_app_learning_project/features/home/data/models/product_model.dart';
import 'package:flutter_bloc_app_learning_project/features/home/presentation/bloc/bloc/home_bloc.dart';

class ProductTileWidget extends StatelessWidget {
  final ProductModel product;
  final HomeBloc bloc;
  const ProductTileWidget({
    super.key,
    required this.product,
    required this.bloc,
  });

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
                    onPressed: () {
                      bloc.add(
                        HomeProductWishlistButtonClickedEvent(
                          clickedProduct: product,
                        ),
                      );
                    },
                    icon: Icon(Icons.favorite_outline),
                  ),
                  IconButton(
                    onPressed: () {
                      bloc.add(
                        HomeProductCartButtonClickedEvent(
                          clickedProduct: product,
                        ),
                      );
                    },
                    icon: Icon(Icons.shopping_bag_outlined),
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
