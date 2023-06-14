import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ows_events_mobile/resources/text_styles.dart';

import '../resources/colors.dart';

class RoundedTextField extends StatefulWidget {
  final String hintText;
  final TextInputType keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final int maxLines;
  final int minLines;
  final IconData? suffixIcon;
  final VoidCallback? onPressedIcon;
  final TextEditingController controller;
  const RoundedTextField({
    super.key,
    this.hintText = '',
    this.keyboardType = TextInputType.none,
    this.inputFormatters,
    this.maxLines = 1,
    this.minLines = 1,
    this.suffixIcon,
    this.onPressedIcon,
    required this.controller
  });

  @override
  State<RoundedTextField> createState() => _RoundedTextFieldState();
}

class _RoundedTextFieldState extends State<RoundedTextField> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _controller.addListener(_handleTextChange);
  }

  @override
  void dispose() {
    _controller.dispose();
    _controller.removeListener(_handleTextChange);
    super.dispose();
  }

  void _handleTextChange() {
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: AppTextStyles.inputTextStyle,
      controller: _controller,
      keyboardType: widget.keyboardType,
      maxLines: widget.maxLines,
      minLines: widget.minLines,
      inputFormatters: widget.inputFormatters ?? [],
      decoration: InputDecoration(
          hintText: widget.hintText,
          contentPadding: const EdgeInsets.fromLTRB(12, 8, 0, 8),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(24.0),
              borderSide: const BorderSide(
                color: AppColors.accent,
                width: 1.0,
              )
          ),
          suffixIcon:
          _controller.text.isNotEmpty ?
          IconButton(
            onPressed: (){
              setState(() {
                _controller.clear();
              });
            },
            icon: const Icon(Icons.cancel),
          ) :
          widget.suffixIcon != null &&
              widget.onPressedIcon != null ?
          IconButton(
              onPressed: widget.onPressedIcon,
              icon: Icon(widget.suffixIcon)
          ) :
          widget.suffixIcon != null ?
          Icon(widget.suffixIcon) :
          null,
          suffixIconColor: Colors.grey
      ),
    );
  }
}