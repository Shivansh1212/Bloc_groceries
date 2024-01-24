part of 'bloc_cart_bloc.dart';

@immutable
abstract class BlocCartState {}

abstract class BlocCartActionState extends BlocCartState {}

class BlocCartInitial extends BlocCartState {}

class CartSuccessState extends BlocCartState {
  final List<ProductdataModel> cartItems;

  CartSuccessState({required this.cartItems});
}

class CartRemovedState extends BlocCartState {}