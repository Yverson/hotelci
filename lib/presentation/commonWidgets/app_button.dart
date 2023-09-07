import 'package:flutter/material.dart';
import 'package:hotel_ci/core/app_export.dart';

class AppButton extends StatelessWidget {
  final Function()? onPressed;
  final String? text;
  final String? image;
  final double? height;
  final double? width;
  final Color? color;
  final Color? textColor;
  final Color? iconColor;
  final bool? border;

  const AppButton({
    Key? key,
    this.onPressed,
    this.text,
    this.height,
    this.width,
    this.color,
    this.image,
    this.border = false,
    this.textColor,
    this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary: Colors.transparent,
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      child: Ink(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: color ?? AppColors.appColor,
          border: border == true ? Border.all(color: AppColors.appColor) : null,
        ),
        child: SizedBox(
          height: 50,
          width: width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text!,
                style: TextStyle(
                  fontSize: 16,
                  color: textColor ?? Colors.white,
                  fontWeight: FontWeight.normal,
                ),
              ),
              const SizedBox(width: 10),
              image != null
                  ? Image.asset(
                      image!,
                      height: 10,
                      color: iconColor ?? Colors.white,
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
