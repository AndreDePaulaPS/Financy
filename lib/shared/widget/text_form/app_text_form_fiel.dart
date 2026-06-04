import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTextFormFiel extends StatelessWidget {
  final TextEditingController controller;

  final String label;
  final String? hintText;
  final String? helperText;
  final TextStyle? helperStyle;

  final TextInputType? keyboardType;
  final TextInputAction textInputAction;
  final TextCapitalization textCapitalization;

  final bool obscureText;
  final bool isPassword;
  final bool readOnly;
  final bool enabled;
  final bool autofocus;

  final int? maxLength;
  final int maxLines;
  final int? minLines;

  final Widget? prefixIcon;
  final Widget? suffixIcon;

  final List<TextInputFormatter>? inputFormatters;

  final String? Function(String?)? validator;

  final VoidCallback? showPassword;
  final VoidCallback? onTap;
  final void Function(String)? onChanged;
  final void Function(String)? onFieldSubmitted;

  const AppTextFormFiel({
    super.key,
    required this.controller,
    required this.label,
    this.hintText,
    this.helperText,
    this.helperStyle,
    this.keyboardType,
    this.textInputAction = TextInputAction.next,
    this.textCapitalization = TextCapitalization.none,
    this.obscureText = false,
    this.isPassword = false,
    this.readOnly = false,
    this.enabled = true,
    this.autofocus = false,
    this.maxLength,
    this.maxLines = 1,
    this.minLines,
    this.prefixIcon,
    this.suffixIcon,
    this.inputFormatters,
    this.validator,
    this.showPassword,
    this.onTap,
    this.onChanged,
    this.onFieldSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      enabled: enabled,
      readOnly: readOnly,
      autofocus: autofocus,

      keyboardType: keyboardType,
      textInputAction: textInputAction,
      textCapitalization: textCapitalization,

      obscureText: obscureText,
      maxLength: maxLength,
      maxLines: isPassword ? 1 : maxLines,
      minLines: minLines,

      inputFormatters: inputFormatters,

      validator: validator,
      onTap: onTap,
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,

      style: Theme.of(context).textTheme.bodyLarge,

      decoration: InputDecoration(
        labelText: label,
        hintText: hintText,
        helperText: helperText,
        helperStyle: helperStyle,
        prefixIcon: prefixIcon,
        helperMaxLines: 2,
        

        suffixIcon: isPassword
            ? IconButton(
                onPressed: showPassword,
                icon: Icon(
                  obscureText
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                ),
              )
            : suffixIcon,
      ),
    );
  }
}