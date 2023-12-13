import 'package:capstone_project/constants/color_theme.dart';
import 'package:capstone_project/constants/text_theme.dart';
import 'package:capstone_project/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class FeedBackDoctor extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const FeedBackDoctor({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: [
          // Overlay background
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.6),
            ),
          ),
          // AlertDialog content
          AlertDialog(
            title: Padding(
              padding: const EdgeInsets.only(
                top: 20,
              ),
              child: Text(
                'Dr. Putu Shinta',
                style: ThemeTextStyle().labelLarge2,
                textAlign: TextAlign.center,
              ),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
            actions: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Berikan penilaian konsultasi',
                    style: ThemeTextStyle().labelSmall,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'yang telah dilakukan pada',
                    style: ThemeTextStyle().labelSmall,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Senin, 12 Jan',
                    style: ThemeTextStyle().labelSmall,
                  ),
                  const SizedBox(height: 20),
                  const RatingWidget(),
                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(18),
                    ),
                    height: 120,
                    width: 180,
                    child: TextField(
                      decoration: InputDecoration.collapsed(
                        hintText: 'Tambahkan komentar',
                        hintStyle: ThemeTextStyle().bodySmall,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 20,
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                            // Aksi ketika tombol "tidak sekarang" ditekan
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: ThemeColor().tidakSekarangButton,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Text('Tidak Sekarang',
                              style: ThemeTextStyle().bodySmall2.copyWith(
                                    color: Colors.white,
                                  )),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 4,
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                            _showConfirmationDialog(context);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: ThemeColor().kirimButton,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Text('Kirim',
                              style: ThemeTextStyle()
                                  .bodySmall2
                                  .copyWith(color: Colors.white)),
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
          // CircleAvatar
          const Positioned(
            top: 200,
            child: CircleAvatar(
              radius: 70,
              backgroundColor: Colors.transparent,
              backgroundImage: AssetImage(
                'assets/images/pfp_doctor.png',
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: SizedBox(
            width: 210,
            height: 372,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/icons/all_icon/check_success.png",
                  height: 50,
                  width: 50,
                ),
                const SizedBox(height: 16),
                const Text(
                  'Penilaian Berhasil di Kirim!',
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16),
                Text(
                  'Terima kasih telah memberikan penilaian. Ini akan membantu kami terus memperbaiki untuk kepuasan Anda.',
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16),
                ButtonWidget(
                  title: "Lihat Riwayat",
                  onPressed: (){
                    
                    // ke halaman ConsultationHistoryScreen
                  },
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class RatingWidget extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  const RatingWidget({Key? key});

  @override
  // ignore: library_private_types_in_public_api
  _RatingWidgetState createState() => _RatingWidgetState();
}

class _RatingWidgetState extends State<RatingWidget> {
  double _rating = 5;

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      initialRating: _rating,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: false,
      itemCount: 5,
      itemSize: 26,
      itemBuilder: (context, _) => const Icon(
        Icons.star,
        color: Color(0XFFFCD200),
      ),
      onRatingUpdate: (rating) {
        setState(() {
          _rating = rating;
        });
      },
    );
  }
}
