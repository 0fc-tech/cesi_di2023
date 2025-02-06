import 'package:cesi_shop/page/cart_page.dart';
import 'package:cesi_shop/page/detail_page.dart';
import 'package:cesi_shop/page/list_products_page.dart';
import 'package:go_router/go_router.dart';

import 'model/product.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (_, __) => ListProductsPage(),
      routes: [
        GoRoute(
          path: 'detail',
          builder:
              (_, state) => DetailPage(
                product: state.extra as Product,
                isPriceInEuro: state.uri.queryParameters["euro"] == "true",
              ),
        ),
        GoRoute(path: 'cart', builder: (_, __) => CartPage()),
      ],
    ),
  ],
);
