import 'package:bloc_sm_testing/features/wishlist/bloc/wishlist_bloc_bloc.dart';
import 'package:bloc_sm_testing/features/wishlist/ui/wishlist_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WishList extends StatefulWidget {
  const WishList({super.key});

  @override
  State<WishList> createState() => _WishListState();
}

class _WishListState extends State<WishList> {
  final WishlistBlocBloc wishlistBloc = WishlistBlocBloc();

  @override
  void initState() {
    wishlistBloc.add(WishListInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wishlist'),
      ),
      body: BlocConsumer<WishlistBlocBloc, WishlistBlocState>(
        listenWhen: (previous, current) => current is WishlistBlocActionState,
        buildWhen: (previous, current) => current is! WishlistBlocActionState,
        bloc: wishlistBloc,
        listener: (context, state) {},
        builder: (context, state) {
          switch (state.runtimeType) {
            case WishlistSuccessState:
              final successState = state as WishlistSuccessState;
              return Scaffold(
                body: ListView.builder(
                  itemCount: successState.wishlistItems.length,
                  itemBuilder: (context, index) {
                  return WishlistTile(
                    productdataModel: successState.wishlistItems[index],
                    wishlistBloc: wishlistBloc,
                  );
                }),
              );
            default:
          }
          return Container();
        },
      ),
    );
  }
}
