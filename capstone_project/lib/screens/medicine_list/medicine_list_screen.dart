import 'package:flutter/material.dart';
import 'package:capstone_project/constants/color_theme.dart';
import 'package:capstone_project/constants/text_theme.dart';
import 'package:provider/provider.dart';
import 'package:capstone_project/models/medicine_model.dart';
import 'package:capstone_project/provider/medicine_provider.dart';
import 'package:capstone_project/widgets/elevated_card_medicine.dart';

class MedicineListScreen extends StatefulWidget {
  const MedicineListScreen({Key? key}) : super(key: key);

  @override
  State<MedicineListScreen> createState() => _MedicineListScreenState();
}

class _MedicineListScreenState extends State<MedicineListScreen> {
  @override
  void initState() {
    super.initState();
    // Fetch data when the screen is initialized
    Provider.of<MedicineProvider>(context, listen: false).fetchMedicines();
  }

  @override
  Widget build(BuildContext context) {
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
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            color: Colors.white,
            onPressed: () {
              // Add logic when the cart icon is clicked here
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
            Consumer<MedicineProvider>(
              builder: (context, provider, child) {
                if (provider.medicines.isEmpty) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return GridView.builder(
                    padding: const EdgeInsets.only(
                      left: 10,
                    ),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemCount: provider.medicines.length,
                    itemBuilder: (context, index) {
                      Medicine medicine = provider.medicines[index];
                      return Padding(
                        padding: const EdgeInsets.only(
                          left: 10,
                          right: 10,
                        ),
                        child: ElevatedCard(
                          image: medicine.image,
                          name: medicine.name,
                          price: medicine.price,
                          type: medicine.type,
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
