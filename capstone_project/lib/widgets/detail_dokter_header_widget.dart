import 'package:capstone_project/constants/color_theme.dart';
import 'package:capstone_project/constants/text_theme.dart';
import 'package:flutter/material.dart';

class DetailDokterHeaderWidget extends StatelessWidget {
  final String image;
  final bool status;
  const DetailDokterHeaderWidget(
      {super.key, required this.image, required this.status});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 210,
          width: double.infinity,
          child: Image(
            image: NetworkImage(
              image,
            ),
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return const Center(
                child: Text('No Image'),
              );
            },
          ),
        ),
        Positioned(
          top: 30,
          left: 24,
          child: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        const Positioned(
          top: 40,
          right: 24,
          child: Icon(
            Icons.share,
          ),
        ),
        Positioned(
            bottom: 24,
            right: 24,
            child: (status)
                ? Container(
                    padding: const EdgeInsets.only(
                      left: 10,
                      right: 10,
                    ),
                    decoration: BoxDecoration(
                      color: ThemeColor().kirimButton,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      'Online',
                      style: ThemeTextStyle().labelExtraSmallWhite,
                    ),
                  )
                : Container(
                    padding: const EdgeInsets.only(
                      left: 10,
                      right: 10,
                    ),
                    decoration: BoxDecoration(
                      color: ThemeColor().ellipse157,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      'Offline',
                      style: ThemeTextStyle().labelExtraSmallWhite,
                    ),
                  )),
      ],
    );
  }
}
