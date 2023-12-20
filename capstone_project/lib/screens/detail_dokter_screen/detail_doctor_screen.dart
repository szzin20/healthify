import 'package:capstone_project/constants/color_theme.dart';
import 'package:capstone_project/constants/text_theme.dart';
import 'package:capstone_project/provider/doctor_provider/doctor_by_id_provider.dart';
import 'package:capstone_project/screens/pay_doctor/consultation_fee.dart';
import 'package:capstone_project/widgets/detail_dokter_button_widget.dart';
import 'package:capstone_project/widgets/detail_doctor_info_widget.dart';
import 'package:capstone_project/widgets/detail_dokter_header_widget.dart';
import 'package:capstone_project/widgets/detail_dokter_title_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class DetailDoctorScreen extends StatefulWidget {
  const DetailDoctorScreen({super.key});

  @override
  State<DetailDoctorScreen> createState() => _DetailDoctorScreenState();
}

class _DetailDoctorScreenState extends State<DetailDoctorScreen> {
  int doctorId = 0;
  bool _dataFetched = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (!_dataFetched) {
      doctorId = ModalRoute.of(context)?.settings.arguments as int;
      Provider.of<DoctorByIdProvider>(context, listen: false)
          .fetchDoctorData(doctorId);
      _dataFetched = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    final doctorProvider = Provider.of<DoctorByIdProvider>(context);
    final doctor = doctorProvider.doctor;
    if (doctor == null) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    } else {
      String formattedPrice =
          NumberFormat.currency(locale: 'id_IDR', symbol: 'Rp ')
              .format(double.parse(doctor.price.toString()));
      return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              DetailDokterHeaderWidget(
                image: doctor.profilePicture ?? '',
                status: doctor.status ?? false,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 24.0,
                  right: 24.0,
                  top: 10.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    DetailDoctorTitleWidget(
                      nama: doctor.fullname ?? '',
                      specialist: doctor.specialist ?? '',
                      experience: doctor.experience ?? '',
                      price: formattedPrice,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    DetailDoctorInfoWidget(
                      str: doctor.noStr.toString(),
                      pendidikan: doctor.alumnus ?? '',
                      praktek: doctor.locationPractice ?? '',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Cerita Pasien',
                      style: ThemeTextStyle().labelMedium,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 150,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 24.0, right: 24),
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: 3,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Container(
                          width: 310,
                          padding: const EdgeInsets.only(
                            top: 10.0,
                            bottom: 10,
                            right: 10,
                            left: 8,
                          ),
                          child: Container(
                            color: ThemeColor().textChat,
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const CircleAvatar(
                                      backgroundColor: Colors.blue,
                                      maxRadius: 30,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Ferdy Sambo',
                                          style: ThemeTextStyle().labelMedium,
                                        ),
                                        const Row(
                                          children: [
                                            Icon(
                                              Icons.star,
                                              size: 10,
                                            ),
                                            Icon(
                                              Icons.star,
                                              size: 10,
                                            ),
                                            Icon(
                                              Icons.star,
                                              size: 10,
                                            ),
                                            Icon(
                                              Icons.star,
                                              size: 10,
                                            ),
                                            Icon(
                                              Icons.star,
                                              size: 10,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      width: 48,
                                    ),
                                    Text(
                                      '07 Oktober 2023',
                                      style: ThemeTextStyle().bodySmall,
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Kemarin ada anggota saya kena tembak sama oknum. Tapi bekas pelurunya ga ilang2 tuh. Akhirnya konsultasi trus dikasih saran produk penghilang luka',
                                  style: ThemeTextStyle().bodySmall,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 24.0,
                  right: 24.0,
                  bottom: 32.0,
                ),
                child: ButtonWidget(
                  title: 'Chat Sekarang',
                  onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ConsultationFeeScreen(
                                fullname: doctor.fullname ?? '',
                                price: doctor.price ?? 0,
                                doctorId: doctorId,
                              ),
                            ),
                          );
                        },
                ),
              ),
            ],
          ),
        ),
      );
    }
  }
}
