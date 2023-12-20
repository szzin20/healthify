import 'package:capstone_project/constants/color_theme.dart';
import 'package:capstone_project/constants/text_theme.dart';
import 'package:capstone_project/models/cart_model.dart';
import 'package:capstone_project/models/checkout_list_model.dart';
import 'package:capstone_project/models/order_med_model.dart';
import 'package:capstone_project/provider/medicine_provider/check_payment_info_provider.dart';
import 'package:capstone_project/provider/medicine_provider/med_payment_provider.dart';
import 'package:capstone_project/screens/finish_med_payment/finish_med_payment_screen.dart';
import 'package:capstone_project/utils/utils.dart';
import 'package:capstone_project/widgets/voucher_text_field.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';


class BuyMedScreen extends StatefulWidget {
  final List<Result> fullname;
  final int price;
  final List<MedicineDetail> detailData;
  final int id;

  const BuyMedScreen({
    super.key,
    required this.fullname,
    required this.price,
    required this.id,
    required this.detailData,
  });

  @override
  State<BuyMedScreen> createState() => _ConsultationFeeState();
}

final List<String> paymentMethods = [
  'Manual Transfer BCA',
  'Manual Transfer BRI',
  'Manual Transfer BNI',
];

class _ConsultationFeeState extends State<BuyMedScreen> {
  TextEditingController namaController = TextEditingController();
  TextEditingController alamatController = TextEditingController();
  TextEditingController noTelpController = TextEditingController();
  int _selectedPaymentMethod = -1;

  @override
  Widget build(BuildContext context) {
    final dataProvider = Provider.of<CheckPaymentInfoProvider>(context);
    final paymentProvider = Provider.of<MedPaymentProvider>(context);
    int totalAmount = widget.price;

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          'Pembayaran',
          style: ThemeTextStyle().titleMedium.copyWith(
                fontWeight: FontWeight.bold,
                color: ThemeColor().white,
              ),
        ),
        backgroundColor: ThemeColor().primaryFrame,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.zero,
              child: Column(
                children: [
                  Container(
                    height: 120,
                    width: double.infinity,
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Metode Pengiriman',
                          style: ThemeTextStyle().titleMedium,
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        InkWell(
                          onTap: () {
                            dataProvider.fetchDelivery(!dataProvider.delivery);
                          },
                          child: Consumer<CheckPaymentInfoProvider>(
                              builder: (context, checkPayment, _) {
                            return (checkPayment.delivery)
                                ? Container(
                                    height: 51,
                                    padding: const EdgeInsets.all(18),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        color: ThemeColor().activeDelivery),
                                    child: Row(
                                      children: [
                                        FaIcon(
                                          FontAwesomeIcons.circleDot,
                                          color: ThemeColor().iconActive,
                                        ),
                                        const SizedBox(
                                          width: 18,
                                        ),
                                        const FaIcon(FontAwesomeIcons.truck),
                                        const SizedBox(
                                          width: 18,
                                        ),
                                        Text(
                                          'Delivery Order',
                                          style: ThemeTextStyle().labelMedium,
                                        )
                                      ],
                                    ),
                                  )
                                : Container(
                                    height: 51,
                                    padding: const EdgeInsets.all(18),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        color: ThemeColor().textFieldChatBot),
                                    child: Row(
                                      children: [
                                        const FaIcon(
                                            FontAwesomeIcons.circleDot),
                                        const SizedBox(
                                          width: 18,
                                        ),
                                        const FaIcon(FontAwesomeIcons.truck),
                                        const SizedBox(
                                          width: 18,
                                        ),
                                        Text(
                                          'Delivery Order',
                                          style: ThemeTextStyle().labelMedium,
                                        )
                                      ],
                                    ),
                                  );
                          }),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    color: ThemeColor().textField,
                    thickness: 4,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 20.0,
                          right: 20.0,
                          top: 16.0,
                          bottom: 16.0,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Alamat Pengiriman',
                              style: ThemeTextStyle().titleMedium,
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            Text(
                              'Nama',
                              style: ThemeTextStyle().labelLarge,
                            ),
                            VoucherTextField(
                              hintText: 'Nama Lengkap',
                              controller: namaController,
                              onChanged: (p0) {
                                dataProvider.fetchName(p0);
                              },
                            ),
                            const SizedBox(
                              height: 8.0,
                            ),
                            Text(
                              'Alamat',
                              style: ThemeTextStyle().labelLarge,
                            ),
                            VoucherTextField(
                              hintText: 'Alamat Lengkap',
                              controller: alamatController,
                              onChanged: (p0) {
                                dataProvider.fetchAddress(p0);
                              },
                            ),
                            const SizedBox(
                              height: 8.0,
                            ),
                            Text(
                              'Nomor Handphone',
                              style: ThemeTextStyle().labelLarge,
                            ),
                            VoucherTextField(
                              hintText: 'No Handphone',
                              controller: noTelpController,
                              onChanged: (p0) {
                                dataProvider.fetchPhoneNo(p0);
                              },
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        color: ThemeColor().textField,
                        thickness: 4,
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 20.0,
                          right: 20.0,
                          bottom: 16.0,
                          top: 16.0,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Rincian Pembayaran',
                              style: ThemeTextStyle()
                                  .titleMedium
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 12),
                            ListView.builder(
                              shrinkWrap: true,
                              itemCount: widget.detailData.length,
                              itemBuilder: (context, index) {
                                final total = (widget.detailData[index]
                                            .totalPriceMedicine ??
                                        0) *
                                    int.parse(widget.detailData[index].quantity
                                        .toString());
                                return _buildPaymentDetails(
                                  widget.fullname[index].name.toString(),
                                  "Total: ${widget.detailData[index].quantity}",
                                  'Rp $total',
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        color: ThemeColor().textField,
                        thickness: 4,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 20.0,
                          right: 20.0,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 20),
                            Text(
                              'Metode Pembayaran',
                              style: ThemeTextStyle().titleMedium.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            const SizedBox(height: 14),
                            _buildPaymentMethodContainer(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Divider(
            color: ThemeColor().textField,
            thickness: 4,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 20.0,
              right: 20.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildPaymentDetails3('Untuk Dibayar', 'Rp $totalAmount'),
                Consumer<MedPaymentProvider>(
                  builder: (context, payProvider,_) {
                    return Align(
                      alignment: Alignment.centerRight,
                      child: Consumer<CheckPaymentInfoProvider>(
                        builder: (context, paymentInfo, _) {
                          final isDataIncomplete = paymentInfo.address.isEmpty ||
                              paymentInfo.name.isEmpty ||
                              paymentInfo.phone.isEmpty ||
                              _selectedPaymentMethod == -1;
                    
                          return ElevatedButton(
                            onPressed: isDataIncomplete
                                ? null
                                : () async {
                                    final checkoutData = CheckoutItemRequest(
                                      name: paymentInfo.name,
                                      address: paymentInfo.address,
                                      hp: paymentInfo.phone,
                                      paymentMethod: paymentMethods[_selectedPaymentMethod].toLowerCase().trim(),
                                      medicineDetails: widget.detailData,
                                    );
                                    await paymentProvider.sendOrderMed(
                                      checkoutData,
                                      SharedPreferencesUtils.getToken(),
                                    );
                                    if (payProvider.login?.meta?.success ??
                                        false) {
                                      // ignore: use_build_context_synchronously
                                      navigateToPaymentDetail(payProvider.login?.results?.id ?? 0, context);
                                    }
                                  },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: isDataIncomplete
                                  ? ThemeColor().textFieldChatBot
                                  : ThemeColor().primaryFrame,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                              ),
                            ),
                            child: Text(
                              'Pesan Sekarang',
                              style: ThemeTextStyle().titleMedium.copyWith(
                                    color: ThemeColor().white,
                                  ),
                            ),
                          );
                        },
                      ),
                    );
                  }
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void navigateToPaymentDetail(int id, BuildContext context) {
    int totalAmount = widget.price;
    int selectedPaymentMethod = _selectedPaymentMethod;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FinishPaymentScreen(
          id: id,
          totalAmount: totalAmount,
          selectedPaymentMethod: selectedPaymentMethod,
        ),
      ),
    );
  }

  Widget _buildPaymentDetails(String line1, String line2, String amount) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(line1, style: ThemeTextStyle().titleSmall),
            Text(line2, style: ThemeTextStyle().labelSmall),
          ],
        ),
        Text(amount, style: ThemeTextStyle().titleSmall),
      ],
    );
  }

  Widget _buildPaymentDetails3(String line1, String amount) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(line1, style: ThemeTextStyle().labelSmall),
            Text(
              amount,
              style: ThemeTextStyle().titleMedium2.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildPaymentMethodContainer() {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(20),
      ),
      child: _buildPaymentMethodList(),
    );
  }

  Widget _buildPaymentMethodList() {
    List<String> bankLogos = [
      'assets/images/bca.png',
      'assets/images/bri.png',
      'assets/images/bni.png',
    ];

    return ListView.separated(
      shrinkWrap: true,
      separatorBuilder: (context, index) => const Divider(color: Colors.grey),
      itemCount: paymentMethods.length,
      itemBuilder: (context, index) {
        return RadioListTile(
          title: Row(children: [
            Container(),
            Image.asset(
              bankLogos[index],
              width: 40,
              height: 40,
            ),
            const SizedBox(width: 6),
            Text(paymentMethods[index], style: ThemeTextStyle().labelLarge),
          ]),
          value: index,
          groupValue: _selectedPaymentMethod,
          onChanged: (int? value) {
            setState(() {
              _selectedPaymentMethod = value!;
            });
          },
          activeColor: ThemeColor().primaryFrame,
        );
      },
    );
  }
}
