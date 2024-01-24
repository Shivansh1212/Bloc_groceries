import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_sm_testing/data/cart_items.dart';
import 'package:bloc_sm_testing/features/home/models/home_product_data_model.dart';
import 'package:meta/meta.dart';

part 'bloc_cart_event.dart';
part 'bloc_cart_state.dart';

class BlocCartBloc extends Bloc<BlocCartEvent, BlocCartState> {
  BlocCartBloc() : super(BlocCartInitial()) {
    on<CartInitialEvent>(cartInitialEvent);

    on<CartRemoveFromCartEvent>(cartRemoveFromCartEvent);
  }

  FutureOr<void> cartInitialEvent(
      CartInitialEvent event, Emitter<BlocCartState> emit) {
    emit(CartSuccessState(cartItems: cartItems));
  }

  FutureOr<void> cartRemoveFromCartEvent(
      CartRemoveFromCartEvent event, Emitter<BlocCartState> emit) {
    cartItems.remove(event.productdataModel);

    emit(CartSuccessState(cartItems: cartItems));
  }
}
