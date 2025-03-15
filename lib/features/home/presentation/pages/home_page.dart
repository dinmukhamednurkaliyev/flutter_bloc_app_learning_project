import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_app_learning_project/features/home/presentation/bloc/bloc/home_bloc.dart';

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
      listenWhen: (previous, current) {
        return true;
      },
      buildWhen: (previous, current) {
        return true;
      },
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Grocery App'),
            actions: [
              IconButton(
                onPressed: () {
                  bloc.add(HomeWishlistButtonNavigateClickedEvent());
                },
                icon: Icon(Icons.favorite),
              ),
              IconButton(
                onPressed: () {
                  bloc.add(HomeCartButtonNavigateClickedEvent());
                },
                icon: Icon(Icons.shopping_bag),
              ),
            ],
          ),
        );
      },
    );
  }
}
