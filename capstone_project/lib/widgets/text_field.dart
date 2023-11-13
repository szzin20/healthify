<<<<<<< HEAD
import 'package:capstone_project/constants/color_theme.dart';
=======
>>>>>>> feat/login
import 'package:capstone_project/constants/text_theme.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String? title;
  final String? hintText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool obscureText;
<<<<<<< HEAD
  final Function(String)? onChanged;
=======
>>>>>>> feat/login

  const CustomTextField({
    Key? key,
    required this.title,
    required this.hintText,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
<<<<<<< HEAD
    this.onChanged,
=======
>>>>>>> feat/login
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = false;
  bool _isClicked = false; // Variable to track if the field has been clicked
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    widget.controller?.dispose();
    super.dispose();
  }

  @override
  // ...

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            widget.title ?? '',
            style: ThemeTextStyle()
                .titleSmall
<<<<<<< HEAD
                .copyWith(color: ThemeColor().textChangeProfil),
          ),
        ),
        TextField(
          onChanged: widget.onChanged,
=======
                .copyWith(color: const Color(0xff202020)),
          ),
        ),
        TextField(
>>>>>>> feat/login
          controller: widget.controller,
          keyboardType: widget.keyboardType,
          obscureText: _obscureText,
          focusNode: _focusNode,
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: ThemeTextStyle()
                .bodyMedium
<<<<<<< HEAD
                .copyWith(color: ThemeColor().placeHolder),
=======
                .copyWith(color: const Color(0xff9C9C9C)),
>>>>>>> feat/login
            focusedBorder:
                _isClicked && (widget.controller?.text.isEmpty ?? true)
                    ? OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: const BorderSide(color: Color(0xff505ACB)),
                      )
                    : OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: const BorderSide(color: Color(0xff505ACB)),
                      ),
            enabledBorder: _isClicked && widget.controller!.text.isEmpty
                ? OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: const BorderSide(color: Color(0xff505ACB)),
                  )
                : OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: const BorderSide(color: Colors.transparent),
                  ),
            filled: true,
            fillColor:
<<<<<<< HEAD
                _focusNode.hasFocus ? Colors.white : ThemeColor().textField,
=======
                _focusNode.hasFocus ? Colors.white : const Color(0xffECECEC),
>>>>>>> feat/login
            suffixIcon: widget.obscureText
                ? IconButton(
                    icon: Icon(
                      _obscureText ? Icons.visibility_off : Icons.visibility,
<<<<<<< HEAD
                      color: ThemeColor().placeHolder,
=======
                      color: const Color(0xff9C9C9C),
>>>>>>> feat/login
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                  )
                : null,
          ),
          onTap: () {
            setState(() {
              _focusNode.requestFocus();
              _isClicked =
                  true; // Set to true when the field is clicked for the first time
            });
          },
          onEditingComplete: () {
            setState(() {
              _focusNode.unfocus();
            });
          },
          onSubmitted: (value) {
            setState(() {
              _focusNode.unfocus();
            });
          },
        ),
      ],
    );
  }
}
