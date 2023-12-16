import 'package:capstone_project/constants/color_theme.dart';
import 'package:capstone_project/constants/text_theme.dart';
import 'package:capstone_project/provider/register_provider/register_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomTextField extends StatefulWidget {
  final String? title;
  final String? hintText;
  final Function(String)? onChanged;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final String? errorText;
  final bool obscureText;

  const CustomTextField({
    super.key,
    required this.title,
    required this.hintText,
    this.onChanged,
    this.controller,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.errorText,
    this.obscureText = false,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = false;
  bool _isClicked = false;
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _obscureText = widget.obscureText;
  }

  @override
  void dispose() {
    _focusNode.dispose();
    widget.controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
     final textfieldProvider = Provider.of<RegisterProvider>(context);
    return Column(
      children: [

        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            widget.title ?? '',
            style: ThemeTextStyle().titleSmall.copyWith(
                  color: ThemeColor().textChangeProfil,
                ),
          ),
        ),
        TextField(
          onChanged: (value){
            widget.onChanged?.call(value);
            textfieldProvider.checkIfAllFieldsFilled();
          },
          controller: widget.controller,
          keyboardType: widget.keyboardType,
          obscureText: _obscureText,
          focusNode: _focusNode,
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: ThemeTextStyle().bodyMedium.copyWith(
                  color: ThemeColor().placeHolder,
                ),
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
              _isClicked = true;
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
        if (widget.errorText != null)
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              widget.errorText!,
              style: ThemeTextStyle().bodyMedium.copyWith(
                    color: Colors.red,
                  ),
            ),
          ),
      ],
    );
  }
}
