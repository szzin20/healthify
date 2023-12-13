import 'package:capstone_project/constants/color_theme.dart';
import 'package:capstone_project/constants/text_theme.dart';
import 'package:flutter/material.dart';

class DoctorCardWidget extends StatelessWidget {
  final String doctorName;
  final String specialty;
  final String imageUrl;
  final String price;
  final bool isOnline;
  final Function()? onTap;

  const DoctorCardWidget({
    super.key,
    required this.doctorName,
    required this.specialty,
    required this.imageUrl,
    required this.price,
    required this.isOnline,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 148,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(2, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                Center(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 9, vertical: 8),
                    child: Container(
                      height: 90,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        image: DecorationImage(
                          image: NetworkImage(imageUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                if (isOnline)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15.0, right: 18),
                    child: Container(
                      width: 52,
                      height: 16,
                      decoration: BoxDecoration(
                        color: ThemeColor().status,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: const Text(
                        'Online',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(doctorName, style: ThemeTextStyle().labelMedium),
            ),
            const SizedBox(
              height: 4,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                specialty,
                style: ThemeTextStyle()
                    .bodySmall
                    .copyWith(color: ThemeColor().filter),
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: [
                  const Icon(
                    Icons.star,
                    color: Color(0xffFCD200),
                    size: 10,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    "4,4",
                    style: ThemeTextStyle()
                        .labelSmall
                        .copyWith(color: ThemeColor().filter),
                  ),
                  const SizedBox(width: 70),
                  Text('62 ulasan',
                      textDirection: TextDirection.ltr,
                      style: ThemeTextStyle()
                          .labelSmall
                          .copyWith(color: ThemeColor().filter)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: Text('Rp $price',
                  style: ThemeTextStyle()
                      .labelSmall
                      .copyWith(fontWeight: FontWeight.w700)),
            ),
          ],
        ),
      ),
    );
  }
}
