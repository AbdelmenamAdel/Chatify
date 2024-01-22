import 'package:chatify/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

class CustomLoadingIndicator extends StatelessWidget {
  CustomLoadingIndicator({super.key, this.h = 24, this.w = 32});
  double? h;
  double? w;
  @override
  Widget build(BuildContext context) {
    return Center(
        child: SizedBox(
      height: h,
      width: w,
      child: LoadingIndicator(
        indicatorType: Indicator.lineScalePulseOut,
        colors: [AppColors.primary],
        strokeWidth: .5,
      ),
    ));
  }
}
