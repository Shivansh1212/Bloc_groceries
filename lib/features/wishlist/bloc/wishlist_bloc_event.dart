part of 'wishlist_bloc_bloc.dart';

@immutable
abstract class WishlistBlocEvent {}

class WishListInitialEvent extends WishlistBlocEvent {}

class WishListRemoveFromWishlistEvent extends WishlistBlocEvent {
  final ProductdataModel productdataModel;

  WishListRemoveFromWishlistEvent({required this.productdataModel});
}
