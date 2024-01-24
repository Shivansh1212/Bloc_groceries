part of 'bloc_cart_bloc.dart';

@immutable
abstract class BlocCartEvent {}

class CartInitialEvent extends BlocCartEvent {}

class CartRemoveFromCartEvent extends BlocCartEvent {
  final ProductdataModel productdataModel;

  CartRemoveFromCartEvent({required this.productdataModel});
}
