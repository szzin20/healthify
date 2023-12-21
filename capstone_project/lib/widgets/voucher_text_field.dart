import 'package:capstone_project/constants/color_theme.dart';
import 'package:capstone_project/constants/text_theme.dart';
import 'package:flutter/material.dart';

class VoucherTextField extends StatefulWidget {
  final String? hintText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool obscureText;
  final Function(String)? onChanged;

  const VoucherTextField({
    super.key,
    required this.hintText,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.onChanged,
  });

  @override
  State<VoucherTextField> createState() => _VoucherTextFieldState();
}

class _VoucherTextFieldState extends State<VoucherTextField> {
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
        TextField(
          onChanged: widget.onChanged,
          controller: widget.controller,
          keyboardType: widget.keyboardType,
          obscureText: _obscureText,
          focusNode: _focusNode,
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: ThemeTextStyle()
                .bodyMedium
                .copyWith(color: ThemeColor().placeHolder),
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
                _focusNode.hasFocus ? Colors.white : ThemeColor().textField,
            suffixIcon: widget.obscureText
                ? IconButton(
                    icon: Icon(
                      _obscureText ? Icons.visibility_off : Icons.visibility,
                      color: ThemeColor().placeHolder,
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
