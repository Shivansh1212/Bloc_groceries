// ignore_for_file: avoid_print

import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:bloc_sm_testing/data/cart_items.dart';
import 'package:bloc_sm_testing/data/grocery_data.dart';
import 'package:bloc_sm_testing/data/wishlist_items.dart';
import 'package:bloc_sm_testing/features/home/models/home_product_data_model.dart';
import 'package:meta/meta.dart';

part 'home_bloc_event.dart';
part 'home_bloc_state.dart';

class HomeBlocBloc extends Bloc<HomeBlocEvent, HomeBlocState> {
  HomeBlocBloc() : super(HomeBlocInitial()) {
    on<HomeInitialEvent>(homeInitalEvent);

    on<HomeProductWishlistButtonClickedEvent>(
        homeProductWishlistButtonClickedEvent);

    on<HomeProductCartButtonClickedEvent>(homeProductCartButtonClickedEvent);

    on<HometCartButtonNavigateEvent>(hometCartButtonNavigateEvent);

    on<HometWishlistButtonNavigateEvent>(hometWishlistButtonNavigateEvent);
  }

  FutureOr<void> homeInitalEvent(
      HomeInitialEvent event, Emitter<HomeBlocState> emit) async {
    emit(HomeLoadingState());
    await Future.delayed(const Duration(seconds: 3));
    emit(HomeLoadedSuccessState(
        products: GroceryData()
            .groceryProducts
            .map((e) => ProductdataModel(
                id: e['id'],
                name: e['name'],
                description: e['description'],
                price: e['price'],
                imageUrl: e['imageUrl']))
            .toList()));
  }

  FutureOr<void> homeProductWishlistButtonClickedEvent(
      HomeProductWishlistButtonClickedEvent event,
      Emitter<HomeBlocState> emit) {
    print('wishlist product clicked');
    wishlistItems.add(event.clickedProduct);
    emit(HomeProductItemWishlistedActionState());
  }

  FutureOr<void> homeProductCartButtonClickedEvent(
      HomeProductCartButtonClickedEvent event, Emitter<HomeBlocState> emit) {
    print('cart product clicked');
    cartItems.add(event.clickedProduct);
    emit(HomeProductItemCartedActionState());
  }

  FutureOr<void> hometWishlistButtonNavigateEvent(
      HometWishlistButtonNavigateEvent event, Emitter<HomeBlocState> emit) {
    print('wishlist navigate clicked');
    emit(HomeNavigateToWishlistPageActionState());
  }

  FutureOr<void> hometCartButtonNavigateEvent(
      HometCartButtonNavigateEvent event, Emitter<HomeBlocState> emit) {
    print('cart navigate clicked');
    emit(HomeNavigateToCartPageActionState());
  }
}
