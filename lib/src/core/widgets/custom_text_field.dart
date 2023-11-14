import 'package:flutter/material.dart';
import 'package:target/src/core/global/app_colors.dart';

class CustomTextFormField extends StatelessWidget {
  final String? text;
  final IconData? prefixIcon;
  final bool? isPrefixIcon;
  final bool? obscureText;
  final bool? isLabel;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final Function(String)? onChanged;
  final String? hintText;
  final TextEditingController? controller;
  final int? maxLength;
  final int? minLines;
  final int? maxLines;
  final FocusNode? focusNode;
  final bool? autofocus;
  final Function()? onTap;
  final Function()? onEditingComplete;
  final Function(PointerDownEvent)? onTapOutside;
  final bool? readOnly;

  const CustomTextFormField({
    super.key,
    this.prefixIcon,
    this.text,
    this.obscureText = false,
    this.isLabel = false,
    this.validator,
    this.suffixIcon,
    this.onChanged,
    this.hintText,
    this.isPrefixIcon = false,
    this.controller,
    this.maxLength,
    this.minLines,
    this.maxLines = 1,
    this.focusNode,
    this.onTap,
    this.autofocus = false,
    this.onEditingComplete,
    this.onTapOutside,
    this.readOnly = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        isLabel!
            ? Text(
                text!,
                style: const TextStyle(
                  color: Colors.white,
                ),
              )
            : const SizedBox(),
        const SizedBox(height: 5),
        TextFormField(
          obscureText: obscureText!,
          cursorColor: secondaryColor,
          validator: validator,
          onChanged: onChanged,
          controller: controller,
          maxLength: maxLength,
          minLines: minLines,
          maxLines: maxLines,
          focusNode: focusNode,
          autofocus: autofocus!,
          showCursor: true,
          readOnly: readOnly!,
          onTap: onTap,
          onEditingComplete: onEditingComplete,
          onTapOutside: onTapOutside,
          textInputAction: TextInputAction.done,
          style: const TextStyle(color: primaryColor),
          decoration: InputDecoration(
            suffixIcon: suffixIcon,
            hintText: hintText,
            counterStyle: const TextStyle(color: primaryColor),
            hintStyle: const TextStyle(color: Colors.grey),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: secondaryColor),
            ),
            errorStyle: const TextStyle(
              color: Colors.redAccent,
              fontSize: 12,
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.redAccent),
            ),
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.all(16),
            prefixIcon: isPrefixIcon!
                ? Icon(
                    prefixIcon,
                    color: primaryColor,
                  )
                : null,
          ),
        ),
      ],
    );
  }
}
