import 'package:cesi_shop/app.dart';
import 'package:cesi_shop/model/cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (BuildContext context) => Cart(),
      child: MyApp(),
    ),
  );
}
