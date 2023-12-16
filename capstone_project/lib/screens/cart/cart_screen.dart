import 'package:capstone_project/constants/color_theme.dart';
import 'package:capstone_project/constants/text_theme.dart';
import 'package:capstone_project/provider/cart_provider/cart_database_provider.dart';
import 'package:capstone_project/widgets/med_cart_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeColor().primaryFrame,
        foregroundColor: ThemeColor().white,
        title: Text(
          'Keranjang Obat',
          style: ThemeTextStyle().titleMedium,
        ),
        centerTitle: true,
      ),
      body: Consumer<CartDatabaseProvider>(
        builder: (context, cartProvider, child) {
          final cartItem = cartProvider.cartItems;
          return ListView.builder(
            padding: const EdgeInsets.fromLTRB(16, 22, 16, 16),
            itemCount: cartItem.length,
            itemBuilder: (context, index) {
              final cartProduct = cartItem[index];
              final quantity = cartProvider.countMedQuantity(cartProduct.id);
              final price = cartProduct.price * quantity;

              return MedCartTile(
                title: cartProduct.name,
                category: cartProduct.category,
                price: price.toDouble(),
                quantity: quantity.toString(),
                image: cartProduct.image,
                onPressedAdd: () {
                  cartProvider.addQuantity(cartProduct.id);
                },
                onPressedRemove: () {
                  cartProvider.removeQuantity(cartProduct.id);
                },
                onClose: () {
                  cartProvider.removeAllQuantity(cartProduct.id);
                  cartProvider.removeFromCart(cartProduct.id);
                },
              );
            },
          );
        },
      ),
    );
  }
}
