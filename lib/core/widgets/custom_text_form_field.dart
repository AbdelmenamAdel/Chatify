import 'package:chatify/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({
    super.key,
    this.controller,
    this.keyboardType,
    this.obscureText = false,
    this.onSaved,
    this.onChange,
    this.suffixOnPressed1,
    this.suffixOnPressed2,
    this.onSubmit,
    this.onTap,
    this.validator,
    this.prefix,
    this.type,
    this.suffix1,
    this.suffix2,
    this.labelText,
    this.hintText,
    this.height = 65,
    this.width = double.infinity,
    this.readOnly = false,
    this.prefixOnPressed,
    this.radius = 5,
  });
  String? labelText;
  double radius;
  String? hintText;
  bool readOnly;
  double? width;
  double? height;
  IconData? prefix;
  IconData? suffix1;
  IconData? suffix2;
  TextInputType? type;
  bool obscureText = false;
  TextInputType? keyboardType;
  Function(String?)? onSaved;
  Function(String?)? onChange;
  Function(String?)? onSubmit;
  VoidCallback? onTap;
  VoidCallback? suffixOnPressed1;
  VoidCallback? suffixOnPressed2;
  VoidCallback? prefixOnPressed;
  String? Function(String?)? validator;
  TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: height,
          width: width,
          child: TextFormField(
            readOnly: readOnly,
            onTap: onTap,
            onSaved: onSaved,
            validator: validator,
            controller: controller,
            keyboardType: keyboardType,
            cursorColor: AppColors.primary,
            decoration: InputDecoration(
              prefixIcon: prefix == null
                  ? null
                  : IconButton(
                      onPressed: prefixOnPressed,
                      icon: Icon(prefix),
                      color: AppColors.primary,
                    ),
              suffixIcon: suffix2 == null
                  ? IconButton(
                      iconSize: 24.sp,
                      onPressed: suffixOnPressed1,
                      icon: Icon(
                        suffix1,
                        color: AppColors.primary,
                      ),
                    )
                  : Row(
                      mainAxisSize: MainAxisSize.min, // added line
                      children: [
                        IconButton(
                          iconSize: 24.sp,
                          onPressed: suffixOnPressed1,
                          icon: Icon(
                            suffix1,
                            color: AppColors.primary,
                          ),
                        ),
                        IconButton(
                          iconSize: 24.sp,
                          onPressed: suffixOnPressed2,
                          icon: Icon(
                            suffix2,
                            color: AppColors.primary,
                          ),
                        ),
                      ],
                    ),
              hintText: hintText,
              labelText: labelText,
              labelStyle: TextStyle(color: AppColors.primary),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.primary, width: 2),
                  borderRadius: BorderRadius.all(Radius.circular(radius))),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.primary, width: 2),
                  borderRadius: BorderRadius.all(Radius.circular(radius))),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.primary, width: 2),
                  borderRadius: BorderRadius.all(Radius.circular(radius))),
              disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.primary, width: 2),
                  borderRadius: BorderRadius.all(Radius.circular(radius))),
            ),
            obscureText: obscureText,
            onChanged: onChange,
            onFieldSubmitted: onSubmit,
          ),
        ),
      ],
    );
  }
}
