part of 'home_bloc_bloc.dart';

@immutable
abstract class HomeBlocEvent {}

class HomeInitialEvent extends HomeBlocEvent {}

class HomeProductWishlistButtonClickedEvent extends HomeBlocEvent {
  final ProductdataModel clickedProduct;

  HomeProductWishlistButtonClickedEvent(this.clickedProduct);
}

class HomeProductCartButtonClickedEvent extends HomeBlocEvent {
  final ProductdataModel clickedProduct;

  HomeProductCartButtonClickedEvent(this.clickedProduct);
}

class HometWishlistButtonNavigateEvent extends HomeBlocEvent {}

class HometCartButtonNavigateEvent extends HomeBlocEvent {}
