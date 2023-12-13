import 'package:flutter/material.dart';

class SearchBarFilterWidget extends StatelessWidget {
  final String? title;
  final VoidCallback? onTap;
  const SearchBarFilterWidget({Key? key, required this.title, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: const Color(0xffF5F5F5)),
        height: 40,
        child: Padding(
          padding: const EdgeInsets.all(11.0),
          child: TextField(
            decoration: InputDecoration(
              fillColor: const Color(0xffF5F5F5),
              labelText: title,
              floatingLabelBehavior: FloatingLabelBehavior.never,
              prefixIcon: const Icon(Icons.search),
              suffixIcon: InkWell(
                onTap: onTap,
                child: GestureDetector(
                    child: Image.asset("assets/icons/all_icon/page_info.png")),
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
