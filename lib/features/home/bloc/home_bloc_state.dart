part of 'home_bloc_bloc.dart';

@immutable
abstract class HomeBlocState {}

abstract class HomeActionState extends HomeBlocState {}

class HomeBlocInitial extends HomeBlocState {}

class HomeLoadingState extends HomeBlocState {}

class HomeLoadedSuccessState extends HomeBlocState {
  final List<ProductdataModel> products;
  HomeLoadedSuccessState({required this.products});
}

class HomeErrorState extends HomeBlocState {}

class HomeNavigateToWishlistPageActionState extends HomeActionState {}

class HomeNavigateToCartPageActionState extends HomeActionState {}

class HomeProductItemWishlistedActionState extends HomeActionState{}

class HomeProductItemCartedActionState extends HomeActionState{}
