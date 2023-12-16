import 'package:capstone_project/constants/color_theme.dart';
import 'package:capstone_project/constants/text_theme.dart';
import 'package:capstone_project/models/order_med_model.dart';
import 'package:capstone_project/provider/cart_provider/cart_database_provider.dart';
import 'package:capstone_project/screens/buy_med_screen/buy_med_screen.dart';
import 'package:capstone_project/screens/finish_med_payment/finish_med_payment.dart';
import 'package:capstone_project/utils/utils.dart';
import 'package:capstone_project/widgets/button_widget.dart';
import 'package:capstone_project/widgets/button_widget_new.dart';
import 'package:capstone_project/widgets/keranjang_button_widget.dart';
import 'package:capstone_project/widgets/med_cart_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    final dataProv = Provider.of<CartDatabaseProvider>(context);
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
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Consumer<CartDatabaseProvider>(
                builder: (context, cartProvider, child) {
                  final cartItem = cartProvider.cartItems;
                  return ListView.builder(
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
                    Expanded(
                      child: Text(
                        'Total Pembayaran',
                      ),
                    ),
                    Text(
                      'Rp 100.000',
                    ),
                  ],
                ),
   Consumer<CartDatabaseProvider>(
  builder: (context, cart, _) {
    return ButtonNewWidget(
      title: 'Checkout',
      onPressed: () async {
        List<MedicineDetail> medicineDetails = await cart.getMedicineDetail();
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => BuyMedScreen(
              fullname: SharedPreferencesUtils.getNama(),
              price: cart.cartItems.first.price,
              id: cart.cartItems.first.id,
              detailData: medicineDetails,
            ),
          ),
        );
      },
    );
  },
)

              ],
            ),
          )
        ],
      ),
    );
  }
}
