import 'package:book_list_app/core/utils/colors.dart';
import 'package:book_list_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormField extends StatelessWidget {
  final String? placeholder;
  final TextEditingController? controller;
  final TextInputType? inputType;
  final bool? enabled;
  final int? maxLength;
  final bool? autoFocus;
  final void Function()? onTap;
  final String? validateMessage;
  final Widget? suffixIcon;
  final double? width;
  final double? height;
  final AutovalidateMode? validateOnChange;
  final String? Function(String?)? validator;
  final int? maxLines;
  final void Function(String)? onSubmitted;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;

  const CustomTextFormField({
    super.key,
    this.controller,
    this.autoFocus,
    this.placeholder,
    this.inputType,
    this.enabled,
    this.maxLength,
    this.onTap,
    this.validateMessage,
    this.suffixIcon,
    this.width,
    this.height,
    this.validator,
    this.validateOnChange,
    this.maxLines, this.onSubmitted, this.textInputAction, this.focusNode,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? MediaQuery.of(context).size.width,
      height: height,
      child: TextFormField(
        focusNode: focusNode,
        textInputAction: textInputAction,
        onFieldSubmitted: onSubmitted,
        maxLines: maxLines??1,
        autovalidateMode: validateOnChange,
        onTap: onTap,
        controller: controller,
        enabled: enabled ?? true,
        maxLength: maxLength,
        maxLengthEnforcement: MaxLengthEnforcement.enforced,
        keyboardType: inputType,
        autofocus: autoFocus ?? false,
        validator: validator ??
                (data) {
              if (data!.isEmpty) {
                return validateMessage;
              }
              return null;
            },
        decoration: InputDecoration(
          errorMaxLines: 2,
          suffixIcon: suffixIcon,
          hintText: placeholder,
          hintStyle: Styles.textStyle14.copyWith(
            color: kHintColor,
          ),
          focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(4)),
              borderSide: BorderSide(
                  color: kPrimaryColor,
                  width: 1,
                  style: BorderStyle.solid)),
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(4)),
              borderSide: BorderSide(
                  width: 1,
                  color: kBorderColor,
                  style: BorderStyle.solid)),
          enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(4)),
              borderSide: BorderSide(
                  width: 1,
                  color: kBorderColor,
                  style: BorderStyle.solid)),
          disabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(4)),
              borderSide: BorderSide(
                  width: 1,
                  color: Colors.transparent,
                  style: BorderStyle.solid)),
          errorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(4)),
              borderSide: BorderSide(
                width: 1,
                color: kErrorColor,
                style: BorderStyle.solid,
              )),
          fillColor: kWhiteColor,
          contentPadding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
        ),
      ),
    );
  }
}