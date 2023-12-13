import 'package:capstone_project/constants/color_theme.dart';
import 'package:capstone_project/constants/text_theme.dart';
import 'package:flutter/material.dart';

class PrivacyPolicyScreen extends StatefulWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  State<PrivacyPolicyScreen> createState() => _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState extends State<PrivacyPolicyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Privacy Policy',
          style: ThemeTextStyle().titleMedium.copyWith(
                color: ThemeColor().white,
              ),
        ),
        centerTitle: true,
        backgroundColor: ThemeColor().primaryFrame,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                ),
                child: Text(
                  'Kebijakan Privasi Kesehatan',
                  style: ThemeTextStyle()
                      .titleMedium2
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 30),
              Text(
                'Terakhir Diperbarui: 18/10/2023',
                style: ThemeTextStyle().bodyMedium.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 40),
              Text(
                'Alterra Healthcare',
                style: ThemeTextStyle().bodyMedium.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 4,
                ),
                child: Text(
                  'Jl. Keputih Tegal timur No.108',
                  style: ThemeTextStyle().bodyMedium.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 4,
                ),
                child: Text(
                  'Jawa Timur, 60112',
                  style: ThemeTextStyle().bodyMedium.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 4,
                ),
                child: Text(
                  '031-67652829',
                  style: ThemeTextStyle().bodyMedium.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 4,
                ),
                child: Text(
                  'alterra.health@care.org',
                  style: ThemeTextStyle().bodyMedium.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              const SizedBox(height: 60),
              Text(
                '1. Pendahuluan',
                style: ThemeTextStyle().bodyMedium.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.only(
                  right: 8,
                ),
                child: Text(
                  'Di Alterra Healthcare, kami berkomitmen untuk melindungi privasi dan keamanan informasi kesehatan pribadi pasien kami. Kebijakan Privasi ini menjelaskan bagaimana kami mengumpulkan, menggunakan, mengungkapkan, dan melindungi informasi yang kami kumpulkan. Kami mematuhi semua undang-undang dan regulasi yang relevan, termasuk tetapi tidak terbatas pada Health Insurance Portability and Accountability Act (HIPAA).',
                  style: ThemeTextStyle().bodyMedium.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              const SizedBox(height: 30),
              Text(
                '2. Informasi yang Kami Kumpulkan',
                style: ThemeTextStyle().bodyMedium.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.only(
                  right: 8,
                ),
                child: Text(
                  'Kami dapat mengumpulkan jenis informasi berikut:',
                  style: ThemeTextStyle().bodyMedium.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  right: 8,
                ),
                child: Text(
                  ' - Informasi Kesehatan Pribadi (PHI): Ini termasuk catatan medis, hasil tes, rencana perawatan, dan informasi lain yang berkaitan dengan kesehatan.',
                  style: ThemeTextStyle().bodyMedium.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  right: 8,
                ),
                child: Text(
                  '- Informasi Identifikasi Pribadi (PII): Ini mencakup nama, alamat, nomor telepon, alamat email, dan informasi lain yang diperlukan untuk identifikasi pasien dan komunikasi.',
                  style: ThemeTextStyle().bodyMedium.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              const SizedBox(height: 30),
              Text(
                '3. Penggunaan Informasi',
                style: ThemeTextStyle().bodyMedium.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.only(
                  right: 8,
                ),
                child: Text(
                  'Kami menggunakan informasi yang dikumpulkan untuk tujuan berikut:',
                  style: ThemeTextStyle().bodyMedium.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  right: 8,
                ),
                child: Text(
                  '- Memberikan layanan kesehatan, termasuk diagnosis, perawatan, dan perawatan lanjutan.',
                  style: ThemeTextStyle().bodyMedium.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  right: 8,
                ),
                child: Text(
                  '- Tujuan penagihan dan asuransi.',
                  style: ThemeTextStyle().bodyMedium.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  right: 8,
                ),
                child: Text(
                  '- Berkomunikasi dengan pasien mengenai kesehatan mereka, janji temu, dan masalah terkait kesehatan lainnya.',
                  style: ThemeTextStyle().bodyMedium.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  right: 8,
                ),
                child: Text(
                  '- Melakukan penelitian atau aktivitas perbaikan kualitas, jika berlaku dan diizinkan.',
                  style: ThemeTextStyle().bodyMedium.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              const SizedBox(height: 30),
              Text(
                '4. Pengungkapan Informasi',
                style: ThemeTextStyle().bodyMedium.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.only(
                  right: 8,
                ),
                child: Text(
                  'Kami dapat mengungkapkan informasi sesuai dengan yang diwajibkan atau diizinkan oleh hukum, termasuk tetapi tidak terbatas pada:',
                  style: ThemeTextStyle().bodyMedium.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  right: 8,
                ),
                child: Text(
                  '- Kepada tenaga medis yang terlibat secara langsung dalam perawatan pasien.',
                  style: ThemeTextStyle().bodyMedium.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  right: 8,
                ),
                child: Text(
                  '- Kepada anggota keluarga yang diizinkan atau wakil hukum.',
                  style: ThemeTextStyle().bodyMedium.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  right: 8,
                ),
                child: Text(
                  '- Untuk tujuan penagihan dan asuransi.',
                  style: ThemeTextStyle().bodyMedium.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  right: 8,
                ),
                child: Text(
                  '- Untuk mematuhi permintaan pemerintah dan penegakan hukum.',
                  style: ThemeTextStyle().bodyMedium.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              const SizedBox(height: 30),
              Text(
                '5. Hak Anda',
                style: ThemeTextStyle().bodyMedium.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.only(
                  right: 8,
                ),
                child: Text(
                  'Pasien memiliki hak untuk:',
                  style: ThemeTextStyle().bodyMedium.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  right: 8,
                ),
                child: Text(
                  '- Mengakses dan meminta salinan catatan medis mereka.',
                  style: ThemeTextStyle().bodyMedium.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  right: 8,
                ),
                child: Text(
                  '- Meminta koreksi pada catatan medis mereka.',
                  style: ThemeTextStyle().bodyMedium.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  right: 8,
                ),
                child: Text(
                  '- Menerima daftar pengungkapan.',
                  style: ThemeTextStyle().bodyMedium.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  right: 8,
                ),
                child: Text(
                  '- Meminta pembatasan penggunaan atau pengungkapan PHI mereka.',
                  style: ThemeTextStyle().bodyMedium.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  right: 8,
                ),
                child: Text(
                  '- Mengajukan keluhan jika mereka percaya hak privasi mereka telah dilanggar.',
                  style: ThemeTextStyle().bodyMedium.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              const SizedBox(height: 30),
              Text(
                '6. Keamanan Data',
                style: ThemeTextStyle().bodyMedium.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.only(
                  right: 8,
                ),
                child: Text(
                  'Kami menjaga tindakan pencegahan yang sesuai untuk melindungi informasi pasien. Langkah-langkah ini mencakup tindakan fisik, teknis, dan administratif.',
                  style: ThemeTextStyle().bodyMedium.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              const SizedBox(height: 30),
              Text(
                '7. Perubahan pada Kebijakan Privasi Ini',
                style: ThemeTextStyle().bodyMedium.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.only(
                  right: 8,
                ),
                child: Text(
                  'Kami dapat memperbarui Kebijakan Privasi ini dari waktu ke waktu. Perubahan akan diposting di situs web kami, dan kebijakan yang diperbarui akan berlaku untuk informasi yang dikumpulkan setelah tanggal revisi.',
                  style: ThemeTextStyle().bodyMedium.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              const SizedBox(height: 30),
              Text(
                '8. Informasi Kontak',
                style: ThemeTextStyle().bodyMedium.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.only(
                  right: 8,
                ),
                child: Text(
                  'Untuk pertanyaan, kekhawatiran, atau permintaan yang terkait dengan Kebijakan Privasi ini, harap hubungi:',
                  style: ThemeTextStyle().bodyMedium.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  right: 8,
                  top: 14,
                ),
                child: Text(
                  '[Nama Pemberi Layanan Kesehatan Anda] [Nama Kontak] [Jabatan Kontak] [Alamat] [Kota, Provinsi, Kode Pos] [Nomor Telepon] [Alamat Email] ',
                  style: ThemeTextStyle().bodyMedium.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  right: 8,
                  top: 14,
                ),
                child: Text(
                  'Silakan menyesuaikan template ini sesuai dengan kebutuhan spesifik pemberi layanan kesehatan Anda, dan berkonsultasi dengan penasehat hukum untuk memastikan kepatuhan penuh terhadap hukum dan regulasi setempat. Selain itu, Anda mungkin perlu menambahkan rincian khusus untuk organisasi Anda, seperti prosedur untuk mendapatkan persetujuan pasien, kebijakan retensi data, dan informasi kontak spesifik untuk petugas privasi atau petugas kepatuhan organisasi Anda.',
                  style: ThemeTextStyle().bodyMedium.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}