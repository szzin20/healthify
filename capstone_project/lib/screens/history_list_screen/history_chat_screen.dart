import 'package:capstone_project/constants/color_theme.dart';
import 'package:capstone_project/constants/text_theme.dart';
import 'package:flutter/material.dart';

class HistoryChatScreen extends StatelessWidget {
  const HistoryChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Riwayat Chat',
          style: ThemeTextStyle().titleMedium.copyWith(
                fontSize: 20,
                color: const Color(0xffFBFBFB),
              ),
        ),
        centerTitle: true,
        backgroundColor: ThemeColor().primaryFrame,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Data Doctor
            Text(
              "Konsultasi Kesehatan Dengan :",
              style: ThemeTextStyle().labelSmall,
            ),
            Text(
              "Dr. Putu Shinta W T Sp.D.V.E",
              style: ThemeTextStyle().labelSmall,
            ),
            Text(
              "Sp. Kulit & Kelamin",
              style: ThemeTextStyle().labelSmall,
            ),
            // Table Riwayat Chat
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 515,
              width: double.infinity,
              decoration: BoxDecoration(color: ThemeColor().searchBar),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: DataTable(
                  headingTextStyle: ThemeTextStyle().labelSmall,
                  columnSpacing: 15.0,
                  dataRowMaxHeight: double.infinity,
                  checkboxHorizontalMargin: 20,
                  dataTextStyle: ThemeTextStyle()
                      .labelSmall
                      .copyWith(color: const Color(0xff4E4E4E)),
                  columns: const [
                    DataColumn(
                      label: Text('Tanggal'),
                    ),
                    DataColumn(label: Text('Jam')),
                    DataColumn(label: Text('Pengirim')),
                    DataColumn(label: Text('Pesan')),
                  ],
                  rows: const [
                    DataRow(cells: [
                      DataCell(Text('12/09/23')),
                      DataCell(Text('07.00')),
                      DataCell(Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Text('Ilham'),
                      )),
                      DataCell(
                        Text(
                          'Hai Dok, saya ingin konsultasi terkait kondisi kulit saya, muncul bintik merah, terasa gatal dan juga panas, kira-kira saya terkena gejala apa ya dok?',
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('12/09/23')),
                      DataCell(Text('07.00')),
                      DataCell(Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Text('Dr. Putu Shinta Widari Tirka Sp.D.V.E'),
                      )),
                      DataCell(Text(
                          'Halo, Saya akan mencoba membantu Anda. Gejala ini bisa menjadi tanda infeksi virus atau bakteri. Apakah Anda memiliki riwayat alergi terhadap obat-obatan tertentu?')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('12/09/23')),
                      DataCell(Text('07.01')),
                      DataCell(Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Text('Ilham'),
                      )),
                      DataCell(Text(
                          'Saya tidak memiliki riwayat alergi. Apa yang harus saya lakukan selanjutnya?')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('12/09/23')),
                      DataCell(Text('07.02')),
                      DataCell(Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Text('Dr. Putu Shinta Widari Tirka Sp.D.V.E'),
                      )),
                      DataCell(Text(
                          'Baik, untuk meringankan rasa gatal penanganan pertama nya kamu dapat memberikan kompresan air dingin pada kulit, kemudian kemudian berikan jel lidah buaya.')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('12/09/23')),
                      DataCell(Text('07.02')),
                      DataCell(Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Text('Dr. Putu Shinta Widari Tirka Sp.D.V.E'),
                      )),
                      DataCell(Text(
                          'Untuk mengurangi rasa panas pada kulit kamu dapat memakai obat yang saya rekomendasikan.')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('12/09/23')),
                      DataCell(Text('07.04')),
                      DataCell(Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Text('Dr. Putu Shinta Widari Tirka Sp.D.V.E'),
                      )),
                      DataCell(Text(
                          'https://www.helthify.com/PUREBB/shooting-moisturizer-cream/product')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('12/09/23')),
                      DataCell(Text('07.04')),
                      DataCell(Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Text('Ilham'),
                      )),
                      DataCell(Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Text(
                            'Baik dok akan saya coba lakukan rekomendasi dari dokter'),
                      )),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('12/09/23')),
                      DataCell(Text('07.04')),
                      DataCell(Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Text('Dr. Putu Shinta Widari Tirka Sp.D.V.E'),
                      )),
                      DataCell(Text('Apakah ada keluhan lanjutan lagi?')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('12/09/23')),
                      DataCell(Text('07.04')),
                      DataCell(Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Text('Ilham'),
                      )),
                      DataCell(
                          Text('Sejauh ini belum ada dok, terimakasih dok')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('12/09/23')),
                      DataCell(Text('07.04')),
                      DataCell(Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Text('Dr. Putu Shinta Widari Tirka Sp.D.V.E'),
                      )),
                      DataCell(Text(
                          'Baik, konsultasi ini akan di akhiri, terimakasih sudah menghubungi konsultsasi dokter helthify, semoga lekas sembuh')),
                    ]),
                    // Add more rows as needed
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            // button pesan ulang and download
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // halaman single doctor
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    fixedSize: const Size.fromWidth(175.0),
                  ).copyWith(
                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                        return ThemeColor().primaryButtonActive;
                      },
                    ),
                  ),
                  child: Text(
                    'Pesan Ulang',
                    style: ThemeTextStyle().labelLarge.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // halaman single doctor
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    fixedSize: const Size.fromWidth(175.0),
                  ).copyWith(
                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                        return ThemeColor().primaryButtonActive;
                      },
                    ),
                  ),
                  child: Row(
                    children: [
                      Text(
                        "Download Chat",
                        style: ThemeTextStyle().labelLarge.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Icon(
                        Icons.file_download_outlined,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
