import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../utils/theme/global_colors.dart';
import '../utils/theme/global_fonts.dart';

class CustomTextField extends StatefulWidget {
  final bool normalizePhoneForWA; // NEW
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? prefixText; // Optional prefix text (e.g. 'Rp ')
  final String? hintText;
  final String? helperText;
  final String? title;
  final String? errorText;
  final int? minLine;
  final int? maxLine;
  final int? maxLength;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final List<TextInputFormatter>? inputFormatters;
  final bool? obsecureText;
  final void Function()? onEditingComplete;
  final double? height;
  final BorderRadius? borderRadius;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final void Function()? onTap;
  final String? initialValue;
  final bool isRequired;
  final bool readOnly;
  final bool isUpperCase;

  const CustomTextField({
    super.key,
    this.prefixIcon,
    this.suffixIcon,
    this.prefixText,
    this.hintText,
    this.title,
    this.helperText,
    this.errorText,
    this.controller,
    this.minLine,
    this.maxLine = 1,
    this.keyboardType,
    this.textInputAction,
    this.inputFormatters,
    this.obsecureText = false,
    this.onEditingComplete,
    this.height,
    this.borderRadius,
    this.onSaved,
    this.validator,
    this.onChanged,
    this.onTap,
    this.initialValue,
    this.maxLength,
    this.isRequired = false,
    this.readOnly = false,
    this.isUpperCase = false,
    this.normalizePhoneForWA = false, // NEW (default off)
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  final FocusNode _focusNode = FocusNode();

  // ===== NEW: Normalisasi WA =====
  @override
  void initState() {
    super.initState();
    // Normalize ketika field kehilangan fokus (blur)
    _focusNode.addListener(() {
      if (!_focusNode.hasFocus && widget.normalizePhoneForWA) {
        _applyWaNormalization();
      }
    });
  }

  // Util: normalisasi ke format WA Indonesia "62xxxxxxxxxx"
  String _normalizePhoneWA(String input) {
    if (input.isEmpty) return input;

    // Hapus semua selain digit/plus, lalu buang '+'
    String s = input.replaceAll(RegExp(r'[^0-9+]'), '').replaceAll('+', '');

    // Kasus:
    // 62xxxxxxxx      -> stay
    // 0812xxxxxxx     -> 62812xxxxxxx
    // 812xxxxxxx      -> 62812xxxxxxx
    // 6208xxxxxx      -> 628xxxxxx (buang '0' setelah 62)
    if (s.startsWith('62')) {
      s = s.replaceFirst(RegExp(r'^620+'), '62');
    } else if (s.startsWith('0')) {
      s = '62${s.substring(1)}';
    } else if (s.startsWith('8')) {
      s = '62$s';
    }

    // (Opsional) batasi hingga 15 digit
    if (s.length > 15) {
      s = s.substring(0, 15);
    }
    return s;
  }

  void _applyWaNormalization() {
    final c = widget.controller;
    if (c == null) return;
    final normalized = _normalizePhoneWA(c.text);
    if (normalized != c.text) {
      c.text = normalized;
      c.selection = TextSelection.fromPosition(
        TextPosition(offset: c.text.length),
      );
    }
  }
  // ===== END NEW =====

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.title != null)
          Row(
            children: [
              Text(
                widget.title!,
                style: const TextStyle(
                  fontFamily: GlobalFonts.fontFamilyJakarta,
                  fontWeight: FontWeight.w700,
                  color: GlobalColors.mainTextBlack,
                ),
              ),
              if (widget.isRequired)
                const Text(
                  "*",
                  style: TextStyle(
                    fontFamily: GlobalFonts.fontFamilyJakarta,
                    fontWeight: FontWeight.w700,
                    color: Colors.red,
                  ),
                ),
            ],
          ),
        if (widget.title != null) SizedBox(height: size.height * 0.01),
        TextFormField(
          focusNode: _focusNode,
          controller: widget.controller,
          initialValue: widget.controller == null ? widget.initialValue : null,
          readOnly: widget.readOnly,
          onTap: widget.onTap,
          obscureText: widget.obsecureText ?? false,
          keyboardType: widget.keyboardType,
          textCapitalization:
          widget.isUpperCase ? TextCapitalization.characters : TextCapitalization.none,
          textInputAction: widget.textInputAction,
          inputFormatters: widget.inputFormatters,
          onEditingComplete: () {
            // ===== NEW: normalize saat user tekan "Done" =====
            if (widget.normalizePhoneForWA) _applyWaNormalization();
            // ===== END NEW =====
            _focusNode.unfocus();
            if (widget.onEditingComplete != null) {
              widget.onEditingComplete!();
            }
          },
          onChanged: widget.onChanged,
          onSaved: widget.onSaved,
          validator: widget.validator,
          maxLines: widget.maxLine,
          minLines: widget.minLine,
          maxLength: widget.maxLength,
          enableSuggestions: false,
          autocorrect: false,
          style: const TextStyle(
            fontFamily: GlobalFonts.fontFamilyJakarta,
            color: GlobalColors.mainTextBlack,
            fontWeight: FontWeight.w400,
            fontSize: 14,
          ),
          decoration: InputDecoration(
            filled: true,
            fillColor: GlobalColors.white.withOpacity(0.15),
            hintText: widget.hintText,
            helperText: widget.helperText,
            errorText: widget.errorText == "" ? null : widget.errorText,
            hintStyle: TextStyle(
              color: GlobalColors.grey,
              fontFamily: GlobalFonts.fontFamilyJakarta,
            ),
            errorStyle: TextStyle(
              color: Theme.of(context).colorScheme.error,
            ),
            helperMaxLines: 2,
            contentPadding: const EdgeInsets.symmetric(horizontal: 12),
            constraints: BoxConstraints(maxHeight: widget.height ?? double.infinity),
            prefixText: widget.prefixText,
            prefixIcon: widget.prefixIcon != null
                ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: widget.prefixIcon,
            )
                : null,
            suffixIcon: widget.suffixIcon,
            suffixIconConstraints: const BoxConstraints(minHeight: 12, minWidth: 12),
            border: OutlineInputBorder(
              borderRadius: widget.borderRadius ?? BorderRadius.circular(14),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: widget.borderRadius ?? BorderRadius.circular(14),
              borderSide: const BorderSide(
                color: GlobalColors.mainTextBlack,
                width: 1.5,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: widget.borderRadius ?? BorderRadius.circular(14),
              borderSide: const BorderSide(
                color: Colors.grey,
                width: 1,
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }
}
