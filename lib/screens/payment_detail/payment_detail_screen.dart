import 'package:flutter/material.dart';
import 'package:capstone_project/constants/color_theme.dart';
import 'package:capstone_project/constants/text_theme.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dotted_border/dotted_border.dart';

class PaymentDetailScreen extends StatefulWidget {
  final int totalAmount;
  final int selectedPaymentMethod;

  const PaymentDetailScreen({
    super.key,
    required this.totalAmount,
    required this.selectedPaymentMethod,
  });

  @override
  State<PaymentDetailScreen> createState() => _PaymentDetailScreenState();
}

class _PaymentDetailScreenState extends State<PaymentDetailScreen> {
  late XFile? _pickedImage;
  bool _showUploadUI = true;
  bool _fileUploaded = false;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      _pickedImage = pickedImage;
      _showUploadUI = false;
      _fileUploaded = true;
    });
  }

  void _resetUI() {
    setState(() {
      _pickedImage = null;
      _showUploadUI = true;
      _fileUploaded = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Selesaikan Pembayaran',
          style: ThemeTextStyle().titleMedium.copyWith(
                fontWeight: FontWeight.bold,
                color: const Color(0XFFFBFBFB),
              ),
        ),
        backgroundColor: ThemeColor().primaryFrame,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Untuk Dibayar',
                    style: ThemeTextStyle().titleSmall,
                  ),
                  Text('Rp ${widget.totalAmount}',
                      style: ThemeTextStyle().titleSmall.copyWith(
                            fontWeight: FontWeight.bold,
                          )),
                ],
              ),
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Nomor Rekening',
                    style: ThemeTextStyle().titleSmall,
                  ),
                  Image.asset(
                    getBankLogo(widget.selectedPaymentMethod),
                    width: 40,
                    height: 40,
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('1234567890', style: ThemeTextStyle().titleSmall),
                  InkWell(
                    onTap: () {
                      _copyToClipboard(context, '1234567890');
                    },
                    child: Text(
                      'Copy',
                      style: ThemeTextStyle().titleSmall.copyWith(
                            color: ThemeColor().primaryFrame,
                          ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 60),
              Text(
                'Upload Bukti Pembayaran',
                style: ThemeTextStyle()
                    .titleMedium
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 40),
              SizedBox(
                height: 175,
                child: DottedBorder(
                  borderType: BorderType.RRect,
                  radius: const Radius.circular(8),
                  color: Colors.grey,
                  strokeWidth: 1.5,
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(8),
                    child: _showUploadUI
                        ? Column(
                            children: [
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  Image.asset(
                                    'assets/images/uploading.png',
                                    height: 60,
                                    width: 68,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      top: 80,
                                    ),
                                    child: Text(
                                      'Upload Disini',
                                      style:
                                          ThemeTextStyle().titleSmall.copyWith(
                                                fontWeight: FontWeight.bold,
                                              ),
                                    ),
                                  ),
                                ],
                              ),
                              InkWell(
                                onTap: () {
                                  _pickImage();
                                },
                                child: Container(
                                  margin: const EdgeInsets.only(
                                    top: 8,
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 12,
                                    horizontal: 24,
                                  ),
                                  decoration: BoxDecoration(
                                    color: const Color(0XFFE3E3E3),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Text(
                                    'Pilih Foto',
                                    style: ThemeTextStyle().titleMedium,
                                  ),
                                ),
                              ),
                            ],
                          )
                        : Center(
                            child: SizedBox(
                              height: 80,
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                    6,
                                  ),
                                ),
                                color: const Color(0XFFE3E3E3),
                                child: Row(
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.all(12),
                                      child: SizedBox(
                                        height: 24,
                                        child: Icon(
                                          Icons.insert_drive_file_outlined,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              top: 2,
                                            ),
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    ' ${_pickedImage?.name ?? ""}',
                                                    style: ThemeTextStyle()
                                                        .bodySmall,
                                                  ),
                                                ),
                                                IconButton(
                                                  icon: const Icon(
                                                    Icons.delete,
                                                    color: Colors.red,
                                                  ),
                                                  onPressed: _resetUI,
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              top: 4,
                                            ),
                                            child: SizedBox(
                                              width: 350,
                                              height: 10,
                                              child: LinearProgressIndicator(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                value: 1,
                                                color: ThemeColor().progressBar,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                  ),
                ),
              ),
              const SizedBox(height: 180),
              Center(
                child: ElevatedButton(
                  onPressed: _fileUploaded
                      ? () {
                          // Add code to handle the upload here
                        }
                      : null, // Disable button if no file uploaded
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ThemeColor().primaryFrame,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 150,
                    ),
                  ),
                  child: Text(
                    'Upload Sekarang',
                    style: ThemeTextStyle().titleMedium.copyWith(
                          color: ThemeColor().white,
                        ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String getBankLogo(int index) {
    List<String> bankLogos = [
      'assets/images/bca.png',
      'assets/images/bri.png',
      'assets/images/bni.png',
    ];

    return bankLogos[index];
  }

  void _copyToClipboard(BuildContext context, String text) {
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.grey,
        content: Container(
          height: 18,
          alignment: Alignment.center,
          child: const Text(
            'Nomor rekening disalin ke Clipboard',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14),
          ),
        ),
      ),
    );
  }
}
