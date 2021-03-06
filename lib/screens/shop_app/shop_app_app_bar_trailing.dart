import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/shop_app/products_list.dart';

class ShopAppAppBarTrailing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: Icon(context.watch<ProductsList>().favoriteFilter ? Icons.favorite : Icons.favorite_outline),
        color: context.watch<ProductsList>().favoriteFilter ? Colors.red : Colors.white,
        iconSize: 30,
        onPressed: () => context.read<ProductsList>().toggleFavoriteFilter()
    );
  }
}
