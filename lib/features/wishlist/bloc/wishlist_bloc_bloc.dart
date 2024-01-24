import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_sm_testing/data/wishlist_items.dart';
import 'package:bloc_sm_testing/features/home/models/home_product_data_model.dart';
import 'package:meta/meta.dart';

part 'wishlist_bloc_event.dart';
part 'wishlist_bloc_state.dart';

class WishlistBlocBloc extends Bloc<WishlistBlocEvent, WishlistBlocState> {
  WishlistBlocBloc() : super(WishlistBlocInitial()) {
    on<WishListInitialEvent>(wishListInitialEvent);

    on<WishListRemoveFromWishlistEvent>(wishListRemoveFromWishlistEvent);
  }

  FutureOr<void> wishListInitialEvent(
      WishListInitialEvent event, Emitter<WishlistBlocState> emit) {
    emit(WishlistSuccessState(wishlistItems: wishlistItems));
  }

  FutureOr<void> wishListRemoveFromWishlistEvent(
      WishListRemoveFromWishlistEvent event, Emitter<WishlistBlocState> emit) {
    wishlistItems.remove(event.productdataModel);

    emit(WishlistSuccessState(wishlistItems: wishlistItems));
  }
}
