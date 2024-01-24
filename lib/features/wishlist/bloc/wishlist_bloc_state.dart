part of 'wishlist_bloc_bloc.dart';

@immutable
abstract class WishlistBlocState {}

abstract class WishlistBlocActionState extends WishlistBlocState {}

class WishlistBlocInitial extends WishlistBlocState {}

class WishlistSuccessState extends WishlistBlocState {
  final List<ProductdataModel> wishlistItems;

  WishlistSuccessState({required this.wishlistItems});
}

class WishlistRemovedState extends WishlistBlocState{}