import 'package:capstone_project/constants/color_theme.dart';
import 'package:capstone_project/models/medicine_model.dart';
import 'package:capstone_project/provider/medicine_provider/cart_provider/cart_provider.dart';
import 'package:capstone_project/provider/medicine_provider/medicine_by_id_provider.dart';
import 'package:capstone_project/widgets/button_widget.dart';
import 'package:capstone_project/widgets/detail_product_description.dart';
import 'package:capstone_project/widgets/detail_product_header_widget.dart';
import 'package:capstone_project/widgets/keranjang_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailProductScreen extends StatefulWidget {
  const DetailProductScreen({super.key});

  @override
  State<DetailProductScreen> createState() => _DetailProductScreenState();
}

class _DetailProductScreenState extends State<DetailProductScreen> {
  int medicineId = 0;
  bool _dataFetched = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (!_dataFetched) {
      medicineId = ModalRoute.of(context)?.settings.arguments as int;
      Provider.of<MedicineByIdProvider>(context, listen: false)
          .fetchMedicines(medicineId);
      _dataFetched = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final medicineProvider = Provider.of<MedicineByIdProvider>(context);
    final dataMed = medicineProvider;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeColor().primaryFrame,
        title: Text(
          'Keranjang',
          style: TextStyle(
            color: ThemeColor().textChat,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/cart');
            },
            icon: Icon(
              Icons.shopping_cart_checkout,
              color: ThemeColor().textChat,
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 18,
                  left: 16,
                  right: 16,
                  bottom: 18,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DetailProductHeaderWidget(
                      name: dataMed.medicines?.results?.name ?? '',
                      price: dataMed.medicines?.results?.price.toString() ?? '',
                      type: dataMed.medicines?.results?.type ?? '',
                      image: dataMed.medicines?.results?.image ?? '',
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    DetailProductDescWidget(
                      desc: dataMed.medicines?.results?.details ?? '',
                      price: dataMed.medicines?.results?.price.toString() ?? '',
                      kode: dataMed.medicines?.results?.code ?? '',
                      type: dataMed.medicines?.results?.type ?? '',
                      category: dataMed.medicines?.results?.category ?? '',
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 18,
              left: 16,
              right: 16,
              bottom: 18,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: OutlineButtonWidget(
                      title: 'Tambah',
                      onPressed: () {
                      cartProvider.cartList.add(dataMed.medicines!.results as Result);
                            cartProvider.addMedToCart();
                      }
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: ButtonWidget(
                      title: 'Beli Sekarang',
                      onPressed: () {},
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
