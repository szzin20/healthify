import 'package:capstone_project/constants/color_theme.dart';
import 'package:capstone_project/constants/text_theme.dart';
import 'package:capstone_project/provider/history_pay_provider/history_pay_provider.dart';
import 'package:capstone_project/screens/riwayat_transaksi/riwayat_transaksi_screen.dart';
import 'package:capstone_project/widgets/bottom_navigation_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HistoryMedScreen extends StatefulWidget {
  const HistoryMedScreen({super.key});

  @override
  State<HistoryMedScreen> createState() => _HistoryMedScreenState();
}

class _HistoryMedScreenState extends State<HistoryMedScreen> {
  bool _dataFetched = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (!_dataFetched) {
      Provider.of<FetchPayDataProvider>(context, listen: false)
          .fetchDocPayData();
      Provider.of<FetchPayDataProvider>(context, listen: false)
          .fetchMedPayData();
      _dataFetched = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    final dataHistory = Provider.of<FetchPayDataProvider>(context);
    return Consumer<FetchPayDataProvider>(
      builder: (context, payHistory, _) {
        if (payHistory.loading) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              title: Text(
                'Riwayat Transaksi',
                style: ThemeTextStyle().titleMedium.copyWith(
                      fontSize: 20,
                      color: const Color(0xffFBFBFB),
                    ),
              ),
              centerTitle: true,
              backgroundColor: ThemeColor().primaryFrame,
            ),
            body: const Center(
              child: CircularProgressIndicator(),
            ),
            bottomNavigationBar:
                const BottomNavigationBarWidget(currentIndex: 2),
          );
        } else if (payHistory.payOption == 1) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              title: Text(
                'Riwayat Transaksi',
                style: ThemeTextStyle().titleMedium.copyWith(
                      fontSize: 20,
                      color: const Color(0xffFBFBFB),
                    ),
              ),
              centerTitle: true,
              backgroundColor: ThemeColor().primaryFrame,
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        onTap: () {
                          dataHistory.changeMenu(2);
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text(
                            'Pembayaran Konsultasi',
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          dataHistory.changeMenu(1);
                        },
                        child: Container(
                          padding: const EdgeInsets.all(10.0),
                          decoration: const BoxDecoration(
                            border: BorderDirectional(
                              bottom: BorderSide(),
                            ),
                          ),
                          child: const Text(
                            'Pembayaran Obat',
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 38, vertical: 16),
                    child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: payHistory.payMedData?.results?.length ?? 0,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  payHistory
                                      .payMedData!.results![index].createdAt
                                      .toString(),
                                ),
                                Container(
                                  height: 60,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: const Color(0xffFBFBFB),
                                      boxShadow: [
                                        BoxShadow(
                                          color: const Color(0xff000000)
                                              .withOpacity(0.1),
                                          spreadRadius: 2,
                                          blurRadius: 24,
                                          offset: const Offset(0, 1),
                                        )
                                      ]),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 10),
                                          child: Text(
                                            (payHistory
                                                    .payMedData
                                                    ?.results?[index]
                                                    .medicineTransaction
                                                    ?.name)
                                                .toString(),
                                            style: ThemeTextStyle().titleSmall,
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {},
                                          child: Image.asset(
                                            "assets/icons/all_icon/chevron-right.png",
                                            width: 26,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                  ),
                ],
              ),
            ),
            bottomNavigationBar:
                const BottomNavigationBarWidget(currentIndex: 2),
          );
        } else if (payHistory.payOption == 2) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              title: Text(
                'Riwayat Transaksi',
                style: ThemeTextStyle().titleMedium.copyWith(
                      fontSize: 20,
                      color: const Color(0xffFBFBFB),
                    ),
              ),
              centerTitle: true,
              backgroundColor: ThemeColor().primaryFrame,
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        onTap: () {
                          dataHistory.changeMenu(2);
                        },
                        child: Container(
                          padding: const EdgeInsets.all(10.0),
                          decoration: const BoxDecoration(
                            border: BorderDirectional(
                              bottom: BorderSide(),
                            ),
                          ),
                          child: const Text(
                            'Pembayaran Konsultasi',
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          dataHistory.changeMenu(1);
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text(
                            'Pembayaran Obat',
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 38, vertical: 16),
                    child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: payHistory.payDocData?.results?.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('12 Oktober 2023'),
                                Container(
                                  height: 60,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: const Color(0xffFBFBFB),
                                      boxShadow: [
                                        BoxShadow(
                                          color: const Color(0xff000000)
                                              .withOpacity(0.1),
                                          spreadRadius: 2,
                                          blurRadius: 24,
                                          offset: const Offset(0, 1),
                                        )
                                      ]),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 10),
                                          child: SizedBox(
                                            width: 220,
                                            child: Text(
                                              'Pembayaran konsultasi bersama ${payHistory.payDocData?.results?[index].fullname}',
                                              style:
                                                  ThemeTextStyle().titleSmall,
                                            ),
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.of(context).push(
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    RiwayatTransaksiScreen(
                                                  idRiwayatTransaksi: payHistory
                                                          .payDocData
                                                          ?.results?[index]
                                                          .id ??
                                                      0,
                                                ),
                                              ),
                                            );
                                          },
                                          child: Image.asset(
                                            "assets/icons/all_icon/chevron-right.png",
                                            width: 26,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                  ),
                ],
              ),
            ),
            bottomNavigationBar:
                const BottomNavigationBarWidget(currentIndex: 2),
          );
        } else if (payHistory.payDocData?.meta?.success ??
            false == false ||
                (payHistory.payMedData?.meta?.success ?? false) == false) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              title: Text(
                'Riwayat Transaksi',
                style: ThemeTextStyle().titleMedium.copyWith(
                      fontSize: 20,
                      color: const Color(0xffFBFBFB),
                    ),
              ),
              centerTitle: true,
              backgroundColor: ThemeColor().primaryFrame,
            ),
            body: const Center(
              child: Text('Data Transaksi Tidak Ada'),
            ),
            bottomNavigationBar:
                const BottomNavigationBarWidget(currentIndex: 2),
          );
        } else {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              title: Text(
                'Riwayat Transaksi',
                style: ThemeTextStyle().titleMedium.copyWith(
                      fontSize: 20,
                      color: const Color(0xffFBFBFB),
                    ),
              ),
              centerTitle: true,
              backgroundColor: ThemeColor().primaryFrame,
            ),
            body: const Center(
              child: Text('Data Transaksi Tidak Ada'),
            ),
            bottomNavigationBar:
                const BottomNavigationBarWidget(currentIndex: 2),
          );
        }
      },
    );
  }
}
