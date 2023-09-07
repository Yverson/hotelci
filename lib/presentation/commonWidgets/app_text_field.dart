import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../core/app_export.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? prefixIcon;
  final String? keyValue;
  final String? hintText;
  final String? initialValue;
  final String? suffixIcon;
  final String? Function(String?)? validate;
  final Function(String)? onChange;
  final Function(String)? onFieldSubmitted;
  final bool obsecureText;
  final bool border;
  final bool shadow;
  final TextInputType keyboardType;
  final int maxLines;
  final Color? color;
  final List<TextInputFormatter>? inputFormatters;
  final RxString? errorMessage;
  final bool readonly;
  final Function()? ontap;
  final double? radius;

  const AppTextField({
    Key? key,
    this.keyValue = "1",
    this.hintText,
    this.initialValue,
    this.validate,
    this.onChange,
    this.obsecureText = false,
    this.keyboardType = TextInputType.text,
    this.maxLines = 1,
    this.suffixIcon,
    this.onFieldSubmitted,
    this.color,
    this.border = false,
    this.shadow = false,
    this.prefixIcon,
    this.inputFormatters,
    this.controller,
    this.errorMessage,
    this.readonly = false,
    this.ontap,
    this.radius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            border: border == true
                ? Border.all(color: AppColors.borderColor)
                : null,
            color: color ?? Colors.white,
            borderRadius: BorderRadius.circular(radius ?? 10),
            boxShadow: shadow == true
                ? [
                    BoxShadow(
                      color: Colors.black.withOpacity(.1),
                      blurRadius: 10.0,
                      spreadRadius: 2.0,
                    ),
                  ]
                : [],
          ),
          child: TextFormField(
            onTap: ontap,
            readOnly: readonly,
            controller: controller,
            onChanged: onChange,
            textAlignVertical: TextAlignVertical.center,
            inputFormatters: inputFormatters,
            cursorColor: AppColors.primaryColor,
            obscureText: obsecureText,
            maxLines: maxLines,
            style: const TextStyle(fontSize: 15, color: Colors.black),
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(15),
              prefixIcon: prefixIcon != null
                  ? Padding(
                      padding: const EdgeInsets.all(14),
                      child: Image.asset(
                        prefixIcon!,
                        height: 15,
                        width: 15,
                        // color: AppColors.authIconColor,
                      ),
                    )
                  : null,
              suffixIcon: suffixIcon != null
                  ? Padding(
                      padding: const EdgeInsets.all(14),
                      child: Image.asset(
                        suffixIcon!,
                        height: 15,
                        width: 15,
                        // color: AppColors.authIconColor,
                      ),
                    )
                  : null,
              hintText: hintText,
              hintStyle: const TextStyle(
                fontSize: 15.0,
                color: Colors.grey,
              ),
              border: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.teal)),
              focusedErrorBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
            ),
          ),
        ),
        if (errorMessage != null && errorMessage!.isNotEmpty)
          Obx(
            () => Align(
              alignment: Alignment.centerLeft,
              child: Container(
                height: 25,
                color: Colors.transparent,
                child: Text(
                  errorMessage!.value,
                  style: const TextStyle(color: Colors.red, fontSize: 11),
                ),
              ),
            ),
          )
      ],
    );
  }
}
