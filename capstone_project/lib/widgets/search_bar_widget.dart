import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  final String? title;
  final TextEditingController? controller;
  final Function(String)? onSubmitted;

  const SearchBarWidget(
      {Key? key,
      required this.title,
      this.controller,
      this.onSubmitted})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color(0xffF5F5F5),
        ),
        height: 40,
        child: Padding(
          padding: const EdgeInsets.all(11.0),
          child: TextField(
            controller: controller,
            onChanged: (value) {
              // Handle perubahan teks jika diperlukan
            },
            onSubmitted:
                onSubmitted != null ? (value) => onSubmitted!(value) : null,
            decoration: InputDecoration(
              fillColor: const Color(0xffF5F5F5),
              labelText: title,
              floatingLabelBehavior: FloatingLabelBehavior.never,
              prefixIcon: const Icon(Icons.search),
              suffixIcon: InkWell(
                onTap: () {
                  // SAAT MICROFONNYA DITEKAN..
                },
                child: const Icon(Icons.mic_none_rounded),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
