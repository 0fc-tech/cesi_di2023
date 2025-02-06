import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/cart.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Panier'),
      ),
      body:
          (context.watch<Cart>().qty > 0)
              ? ListProductsCart()
              : Stack(children: [LineTotalPrice(), InfoEmptyCart()]),
    );
  }
}

class ListProductsCart extends StatelessWidget {
  const ListProductsCart({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class InfoEmptyCart extends StatelessWidget {
  const InfoEmptyCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(context.watch<Cart>().qty.toString()),
          Text("Votre panier est acutellement vide"),
          Icon(Icons.image),
        ],
      ),
    );
  }
}

class LineTotalPrice extends StatelessWidget {
  const LineTotalPrice({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Votre panier total est de "),
          Text("${context.watch<Cart>().totalPrice}€"),
        ],
      ),
    );
  }
}
