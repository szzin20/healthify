import 'package:capstone_project/constants/color_theme.dart';
import 'package:capstone_project/models/cart_model.dart';
import 'package:capstone_project/provider/cart_provider/cart_database_provider.dart';
import 'package:capstone_project/provider/medicine_provider/medicine_by_id_provider.dart';
import 'package:capstone_project/widgets/button_widget.dart';
import 'package:capstone_project/widgets/detail_product_description.dart';
import 'package:capstone_project/widgets/detail_product_header_widget.dart';
import 'package:capstone_project/widgets/keranjang_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
    final cartProvider = Provider.of<CartDatabaseProvider>(context);
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
            icon: Badge(
              label: Text(cartProvider.cartItems.length.toString()),
              child: SvgPicture.asset(
                'assets/icons/all_icon/shopping_cart_icon.svg',
              ),
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/cart');
            },
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
                          print(dataMed.medicines?.results?.id ?? 0);
                          final Result medicine = Result(
                            id: dataMed.medicines?.results?.id ?? 0,
                            code: dataMed.medicines?.results?.code ?? '',
                            name: dataMed.medicines?.results?.name ?? '',
                            merk: dataMed.medicines?.results?.merk ?? '',
                            category:
                                dataMed.medicines?.results?.category ?? '',
                            type: dataMed.medicines?.results?.type ?? '',
                            price: dataMed.medicines?.results?.price ?? 0,
                            stock: dataMed.medicines?.results?.stock ?? 0,
                            details: dataMed.medicines?.results?.details ?? '',
                            image: dataMed.medicines?.results?.image ?? '',
                            quantity: 1,
                          );
                          cartProvider.addToCart(medicine);
                          Navigator.of(context).pushNamed('/cartMed');
                        }),
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
