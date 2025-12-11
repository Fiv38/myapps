import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../utils/theme/global_colors.dart';
import '../utils/theme/global_fonts.dart';

// TODO: SESUAIKAN path model User kamu
import 'package:myapps/models/user.dart';

class CustomTextFieldUsername extends StatefulWidget {
  // ====== Props existing ======
  final bool normalizePhoneForWA;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? prefixText;
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

  // Title row control
  final bool showTitle;        // default true
  final Widget? titleTrailing; // widget kanan sejajar title (mis. tombol Find)

  // ====== NEW: Autocomplete config ======
  /// Nyalakan auto-suggest dari daftar customer yang sudah di-fetch.
  final bool enableAutocomplete;
  /// Sumber data customer (sudah difetch saat buka POS).
  final List<User>? customerSource;
  /// Maks jumlah opsi ditampilkan.
  final int maxOptions;
  /// Dipanggil ketika user memilih 1 item dari dropdown.
  final ValueChanged<User>? onUserSelected;

  const CustomTextFieldUsername({
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
    this.normalizePhoneForWA = false,

    this.showTitle = true,
    this.titleTrailing,

    // NEW
    this.enableAutocomplete = true,
    this.customerSource,
    this.maxOptions = 8,
    this.onUserSelected,
  });

  @override
  State<CustomTextFieldUsername> createState() => _CustomTextFieldUsernameState();
}

class _CustomTextFieldUsernameState extends State<CustomTextFieldUsername> {
  // Focus yang bisa kita kontrol
  final FocusNode _internalFocusNode = FocusNode();
  FocusNode get _focusNode => _internalFocusNode;

  // Controller internal jika user tidak memberi controller
  late final TextEditingController _internalController =
  TextEditingController(text: widget.initialValue ?? '');
  TextEditingController get _controller =>
      widget.controller ?? _internalController;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      if (!_focusNode.hasFocus && widget.normalizePhoneForWA) {
        _applyWaNormalization();
      }
    });
  }

  // ===== Util: normalisasi WA =====
  String _normalizePhoneWA(String input) {
    if (input.isEmpty) return input;
    String s = input.replaceAll(RegExp(r'[^0-9+]'), '').replaceAll('+', '');
    if (s.startsWith('62')) {
      s = s.replaceFirst(RegExp(r'^620+'), '62');
    } else if (s.startsWith('0')) {
      s = '62${s.substring(1)}';
    } else if (s.startsWith('8')) {
      s = '62$s';
    }
    if (s.length > 15) s = s.substring(0, 15);
    return s;
  }

  void _applyWaNormalization() {
    final normalized = _normalizePhoneWA(_controller.text);
    if (normalized != _controller.text) {
      _controller.text = normalized;
      _controller.selection = TextSelection.fromPosition(
        TextPosition(offset: _controller.text.length),
      );
    }
  }
  // =====================================

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final titleRow = (widget.showTitle && widget.title != null)
        ? Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded( // ⬅️ pastikan judul mengambil ruang kiri
              child: RichText(
                text: TextSpan(
                  text: widget.title!,
                  style: const TextStyle(
                    fontFamily: GlobalFonts.fontFamilyJakarta,
                    fontWeight: FontWeight.w700,
                    color: GlobalColors.mainTextBlack,
                    fontSize: 14,
                  ),
                  children: [
                    if (widget.isRequired)
                      const TextSpan(
                        text: ' *',
                        style: TextStyle(color: Colors.red),
                      ),
                  ],
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        SizedBox(height: size.height * 0.01),
      ],
    )
        : const SizedBox.shrink();

    final decoration = InputDecoration(
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
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      constraints: BoxConstraints(minHeight: widget.height ?? 48),
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
    );

    // Jika autocomplete dimatikan atau source tidak ada, tampilkan TextFormField biasa
    final noAutocomplete = !widget.enableAutocomplete || widget.customerSource == null;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        titleRow,
        if (noAutocomplete)
          _buildPlainTextField(decoration)
        else
          _buildAutocompleteField(decoration),
      ],
    );
  }

  Widget _buildPlainTextField(InputDecoration decoration) {
    return TextFormField(
      focusNode: _focusNode,
      controller: _controller,
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
        if (widget.normalizePhoneForWA) _applyWaNormalization();
        _focusNode.unfocus();
        widget.onEditingComplete?.call();
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
      decoration: decoration,
    );
  }

  Widget _buildAutocompleteField(InputDecoration decoration) {
    final source = widget.customerSource ?? const <User>[];

    return RawAutocomplete<User>(
      textEditingController: _controller,
      focusNode: _focusNode,
      optionsBuilder: (TextEditingValue tev) {
        final q = tev.text.trim().toLowerCase();
        if (q.isEmpty) {
          // Jangan tampilkan saat kosong agar tidak “berisik”
          return const Iterable<User>.empty();
        }
        // Filter by name atau phone
        final results = source.where((u) {
          final name = (u.userName).toLowerCase();
          final phone = (u.userPhone ?? '').toLowerCase();
          return name.contains(q) || phone.contains(q);
        }).take(widget.maxOptions);
        return results;
      },
      displayStringForOption: (u) => u.userName,
      onSelected: (picked) {
        // set teks field
        _controller.text = picked.userName;
        _controller.selection = TextSelection.fromPosition(
          TextPosition(offset: _controller.text.length),
        );
        widget.onUserSelected?.call(picked);
      },
      fieldViewBuilder: (context, controller, focusNode, onFieldSubmitted) {
        // Catatan: kita sudah pasang _controller & _focusNode di RawAutocomplete,
        // jadi param `controller`/`focusNode` di sini sama instance-nya.
        return TextFormField(
          focusNode: focusNode,
          controller: controller,
          readOnly: widget.readOnly,
          onTap: widget.onTap,
          obscureText: widget.obsecureText ?? false,
          keyboardType: widget.keyboardType,
          textCapitalization:
          widget.isUpperCase ? TextCapitalization.characters : TextCapitalization.none,
          textInputAction: widget.textInputAction,
          inputFormatters: widget.inputFormatters,
          onEditingComplete: () {
            if (widget.normalizePhoneForWA) _applyWaNormalization();
            focusNode.unfocus();
            widget.onEditingComplete?.call();
          },
          onChanged: (v) {
            widget.onChanged?.call(v);
            // tidak perlu setState—RawAutocomplete handle options
          },
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
          decoration: decoration,
        );
      },
      optionsViewBuilder: (context, onSelected, options) {
        return Align(
          alignment: Alignment.topLeft,
          child: Material(
            elevation: 6,
            borderRadius: BorderRadius.circular(10),
            clipBehavior: Clip.antiAlias, // biar radius kepotong rapi
            child: SizedBox(
              width: 320, // ⬅️ samain dengan field
              height: 200,
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxHeight: 300),
                child: ListView.separated(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  itemCount: options.length,
                  separatorBuilder: (_, __) => const Divider(height: 0),
                  itemBuilder: (context, index) {
                    final u = options.elementAt(index);
                    final address = (u.userAddress ?? '').trim();
                    final phone = (u.userPhone ?? '').trim();

                    return ListTile(
                      dense: true,
                      leading: const CircleAvatar(
                        backgroundColor: GlobalColors.mainTextBlack,
                        foregroundColor: GlobalColors.white,
                        radius: 16,
                        child: Icon(Icons.person, size: 18),
                      ),
                      title: Text(
                        u.userName,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (address.isNotEmpty)
                            Text(address, maxLines: 1, overflow: TextOverflow.ellipsis),
                          if (phone.isNotEmpty)
                            Text(phone, maxLines: 1, overflow: TextOverflow.ellipsis),
                        ],
                      ),
                      onTap: () => onSelected(u),
                    );
                  },
                ),
              ),
            ),
          ),
        );
      },

    );
  }

  @override
  void dispose() {
    _internalFocusNode.dispose();
    if (widget.controller == null) {
      _internalController.dispose();
    }
    super.dispose();
  }
}
