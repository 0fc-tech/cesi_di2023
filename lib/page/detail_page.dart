import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../model/cart.dart';
import '../model/product.dart';

class DetailPage extends StatelessWidget {
  Product product;
  bool isPriceInEuro;
  DetailPage({super.key, required this.product, this.isPriceInEuro = true});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product.title)),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 180,
            child: Image.network(product.image),
          ),
          LineTitlePrice(product: product, isPriceInEuro: isPriceInEuro),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(product.description),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: OutlinedButton(
                onPressed: () {
                  context.push("/cart");
                },
                child: const Text('Aller au panier'),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: FilledButton(
                onPressed: () {
                  context.read<Cart>().add(product);
                },
                child: const Text('Ajouter au panier'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class LineTitlePrice extends StatelessWidget {
  bool isPriceInEuro;
  LineTitlePrice({super.key, required this.product, this.isPriceInEuro = true});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Text(
              product.title,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
          Text(isPriceInEuro ? product.priceEuro() : "\$${product.price}"),
        ],
      ),
    );
  }
}
