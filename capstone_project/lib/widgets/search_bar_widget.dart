import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  final String? title;
  final TextEditingController? controller;
  final Function(String)? onSubmitted;
  final Function(String)? onChanged;

  const SearchBarWidget({
    super.key,
    required this.title,
    this.controller,
    this.onSubmitted,
    this.onChanged,
  });

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
            onChanged: onChanged,
            onSubmitted: onSubmitted != null ? (value) => onSubmitted!(value) : null,
            decoration: InputDecoration(
              fillColor: const Color(0xffF5F5F5),
              labelText: title,
              floatingLabelBehavior: FloatingLabelBehavior.never,
              prefixIcon: const Icon(Icons.search),
              suffixIcon: InkWell(
                onTap: () {
                  // Add functionality when the mic icon is tapped
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
