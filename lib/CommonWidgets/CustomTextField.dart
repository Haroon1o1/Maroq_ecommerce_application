import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatefulWidget {
  final String label;
  final String hintText;
  final TextInputType keyboardType;
  final TextInputAction inputType;
  final bool isPassword;
  final TextEditingController? controller;
  final Widget? suffix;
  final Widget? prefix;
  final ValueChanged<String>? onChanged;
  final EdgeInsets? margin;
  final Color? fillColor;
  final Color? borderColor;

  const CustomTextField({
    Key? key,
    this.label = '',
    required this.hintText,
    this.keyboardType = TextInputType.text,
    this.inputType = TextInputAction.next,
    this.isPassword = false,
    this.controller,
    this.suffix,
    this.prefix,
    this.onChanged,
    this.margin,
    this.fillColor,
    this.borderColor,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  final FocusNode _focusNode = FocusNode();
  bool _obscureText = true;
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() => _isFocused = _focusNode.hasFocus);
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final brown = const Color(0xFF715137);
    final fill = widget.fillColor ?? Colors.white;
    final borderColor = widget.borderColor ?? Colors.grey.shade300;

    return Container(
      margin: widget.margin,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.label.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(bottom: 6, left: 4),
              child: Text(
                widget.label,
                style: GoogleFonts.poppins(
                  fontSize: 13,
                  color: Colors.grey.shade800,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          TextField(
            controller: widget.controller,
            focusNode: _focusNode,
            keyboardType: widget.keyboardType,
            textInputAction: widget.inputType,
            obscureText: widget.isPassword ? _obscureText : false,
            onChanged: widget.onChanged,
            style: GoogleFonts.poppins(
              fontSize: 14,
              height: 1.3,
              color: Colors.black87,
            ),
            cursorColor: brown,
            decoration: InputDecoration(
              hintText: widget.hintText,
              hintStyle: GoogleFonts.poppins(
                color: Colors.grey.shade500,
                fontSize: 14,
              ),
              filled: true,
              fillColor: fill,
              isDense: true,
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
              prefixIcon: widget.prefix,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: borderColor, width: 1),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: brown, width: 1.3),
              ),
              suffixIcon: widget.suffix ??
                  (widget.isPassword
                      ? IconButton(
                          icon: Icon(
                            _obscureText
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                            size: 20,
                            color:
                                _isFocused ? brown : Colors.grey.shade600,
                          ),
                          onPressed: () =>
                              setState(() => _obscureText = !_obscureText),
                        )
                      : null),
            ),
          ),
        ],
      ),
    );
  }
}
