import 'package:capstone_project/provider/cart_provider/cart_database_provider.dart';
import 'package:flutter/material.dart';
import 'package:capstone_project/constants/color_theme.dart';
import 'package:capstone_project/constants/text_theme.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:capstone_project/models/medicine_model.dart';
import 'package:capstone_project/provider/medicine_provider/medicine_provider.dart';
import 'package:capstone_project/widgets/elevated_card_medicine.dart';

class MedicineListScreen extends StatefulWidget {
  const MedicineListScreen({super.key});

  @override
  State<MedicineListScreen> createState() => _MedicineListScreenState();
}

class _MedicineListScreenState extends State<MedicineListScreen> {
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      Provider.of<AllMedicineProvider>(context, listen: false).fetchMedicine();
    });
    Future.delayed(Duration.zero, () {
      Provider.of<CartDatabaseProvider>(context, listen: false).getCartItems();
    });
  }

  void _performSearch() {
    String keyword = searchController.text;
    // Panggil fungsi pencarian menggunakan kata kunci 'keyword'
    Provider.of<AllMedicineProvider>(context, listen: false)
        .searchMedicine(keyword);
  }

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartDatabaseProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Daftar Obat',
          style: ThemeTextStyle().titleMedium.copyWith(
                color: ThemeColor().white,
              ),
        ),
        centerTitle: true,
        backgroundColor: ThemeColor().primaryFrame,
        foregroundColor: ThemeColor().white,
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: ThemeColor().primaryFrame,
              padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
              child: TextField(
                controller: searchController,
                decoration: InputDecoration(
                  hintText: 'Cari Obat',
                  fillColor: Colors.white,
                  filled: true,
                  prefixIcon: const Padding(
                    padding: EdgeInsets.only(
                      left: 30,
                      right: 10,
                    ),
                    child: Icon(Icons.search, color: Color(0XFF4E4E4E)),
                  ),
                  suffixIcon: const Padding(
                    padding: EdgeInsets.only(
                      right: 30,
                    ),
                    child: Icon(Icons.filter_list, color: Color(0XFF4E4E4E)),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(100),
                    borderSide: BorderSide.none,
                  ),
                ),
                onSubmitted: (value) {
                  _performSearch();
                },
              ),
            ),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
              ),
              child: Text(
                'Rekomendasi',
                style: ThemeTextStyle().titleMedium.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            const SizedBox(height: 16),
            Consumer<AllMedicineProvider>(
              builder: (context, provider, child) {
                List<Result> displayedMedicine = searchController.text.isEmpty
                    ? provider.medicine
                    : provider.searchMedicine(searchController.text);

                if (displayedMedicine.isEmpty) {
                  return const Center(
                    child: Text('Tidak ada hasil pencarian'),
                  );
                } else {
                  return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemCount: displayedMedicine.length,
                    itemBuilder: (context, index) {
                      Result medicine = displayedMedicine[index];

                      return Padding(
                        padding: const EdgeInsets.only(
                          left: 10,
                          right: 10,
                        ),
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).pushNamed('/detailMed',
                                arguments: medicine.id);
                          },
                          child: ElevatedCard(
                            image: medicine.image,
                            name: medicine.name,
                            price: medicine.price.toDouble(),
                            type: medicine.type,
                          ),
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
