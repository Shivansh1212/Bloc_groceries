import 'package:bloc_sm_testing/features/cart/bloc/bloc_cart_bloc.dart';
// import 'package:bloc_sm_testing/features/home/bloc/home_bloc_bloc.dart';
import 'package:bloc_sm_testing/features/home/models/home_product_data_model.dart';
import 'package:flutter/material.dart';

class CartTile extends StatelessWidget {
  final ProductdataModel productdataModel;
  final BlocCartBloc cartBloc;
  const CartTile(
      {super.key, required this.productdataModel, required this.cartBloc});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            width: double.maxFinite,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.contain,
                image: NetworkImage(
                  productdataModel.imageUrl,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            productdataModel.name,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text(productdataModel.description),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "\$ ${productdataModel.price}",
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.green),
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      // homeBloc.add(HomeProductWishlistButtonClickedEvent(productdataModel));
                    },
                    icon: const Icon(Icons.favorite_border),
                  ),
                  IconButton(
                    onPressed: () {
                      cartBloc.add(CartRemoveFromCartEvent(productdataModel: productdataModel));
                    },
                    icon: const Icon(Icons.shopping_bag),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
