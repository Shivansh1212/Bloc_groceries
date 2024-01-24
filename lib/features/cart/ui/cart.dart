import 'package:bloc_sm_testing/features/cart/bloc/bloc_cart_bloc.dart';
import 'package:bloc_sm_testing/features/cart/ui/cart_tile.dart';
// import 'package:bloc_sm_testing/features/home/ui/product_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  final BlocCartBloc cartBloc = BlocCartBloc();

  @override
  void initState() {
    cartBloc.add(CartInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: BlocConsumer<BlocCartBloc, BlocCartState>(
        listenWhen: (previous, current) => current is BlocCartActionState,
        buildWhen: (previous, current) => current is! BlocCartActionState,
        bloc: cartBloc,
        listener: (context, state) {},
        builder: (context, state) {
          switch (state.runtimeType) {
            case CartSuccessState:
              final successState = state as CartSuccessState;
              return Scaffold(
                body: ListView.builder(
                    itemCount: successState.cartItems.length,
                    itemBuilder: (context, index) {
                      return CartTile(
                          productdataModel: successState.cartItems[index],
                          cartBloc: cartBloc);
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