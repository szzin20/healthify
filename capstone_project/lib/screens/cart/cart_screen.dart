import 'package:capstone_project/constants/color_theme.dart';
import 'package:capstone_project/constants/text_theme.dart';
import 'package:capstone_project/models/order_med_model.dart';
import 'package:capstone_project/provider/cart_provider/cart_database_provider.dart';
import 'package:capstone_project/screens/buy_med_screen/buy_med_screen.dart';
import 'package:capstone_project/widgets/button_widget_new.dart';
import 'package:capstone_project/widgets/med_cart_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  bool _dataFetched = false;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (!_dataFetched) {
      Provider.of<CartDatabaseProvider>(context, listen: false).getCartItems();
      _dataFetched = true;
    }
  }

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
      body: Consumer<CartDatabaseProvider>(builder: (context, cartProvider, _) {
        final cartItem = cartProvider.cartItems;
        final total = cartProvider.totalPrice;
        return Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.fromLTRB(16, 22, 16, 16),
                  itemCount: cartItem.length,
                  itemBuilder: (context, index) {
                    final cartProduct = cartItem[index];
                    final quantity =
                        cartProvider.countMedQuantity(cartProduct.id);
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
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Expanded(
                        child: Text(
                          'Total Pembayaran',
                        ),
                      ),
                      Text(
                        total.toString(),
                      ),
                    ],
                  ),
                  ButtonNewWidget(
                    title: 'Checkout',
                    onPressed: () {
                      _handleCheckout(context, cartProvider);
                    },
                  )
                ],
              ),
            )
          ],
        );
      }),
    );
  }
}

Future<void> _handleCheckout(
    BuildContext context, CartDatabaseProvider cart) async {
  try {
    List<MedicineDetail> medicineDetails = await cart.getMedicineDetail();

    // ignore: use_build_context_synchronously
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => BuyMedScreen(
          fullname: cart.cartItems,
          price: cart.totalPrice,
          id: cart.cartItems.first.id,
          detailData: medicineDetails,
        ),
      ),
    );
  } catch (error) {
    // Handle errors if needed
    rethrow;
  }
}

void goToBuyScreen(BuildContext context, CartDatabaseProvider cart, List<MedicineDetail> medicineDetails){
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => BuyMedScreen(
          fullname: cart.cartItems,
          price: cart.totalPrice,
          id: cart.cartItems.first.id,
          detailData: medicineDetails,
        ),
      ),
    );
}