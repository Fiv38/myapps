import 'package:flutter/material.dart';

class CustomSearchField extends StatefulWidget {
  final TextEditingController? controller;
  final String? hintText;
  final IconData? leftIcon;
  final IconData? rightIcon;
  final bool? obscureText;
  final TextInputType? keyboardType;
  final void Function(String)? onChanged;
  final Color? outlineColor;

  const CustomSearchField({
    super.key,
    this.controller,
    this.hintText,
    this.leftIcon,
    this.rightIcon,
    this.obscureText,
    this.keyboardType,
    this.onChanged,
    this.outlineColor,
  });

  @override
  _CustomSearchFieldState createState() => _CustomSearchFieldState();
}

class _CustomSearchFieldState extends State<CustomSearchField> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      keyboardType: widget.keyboardType,
      obscureText: widget.obscureText ?? false,
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        hintText: widget.hintText,
        prefixIcon: widget.leftIcon != null
            ? Icon(widget.leftIcon, color: Colors.black)
            : null,
        suffixIcon: widget.rightIcon != null
            ? IconButton(
          icon: Icon(widget.rightIcon),
          onPressed: () {
            _controller.clear();
            if (widget.onChanged != null) {
              widget.onChanged!('');
            }
          },
        )
            : null,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: widget.outlineColor ?? Colors.grey),
          borderRadius: BorderRadius.circular(8.0), // Adjust border radius here
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: widget.outlineColor ?? Theme.of(context).primaryColor),
          borderRadius: BorderRadius.circular(8.0), // Adjust border radius here
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0), // Adjust padding here
      ),
    );
  }
}
