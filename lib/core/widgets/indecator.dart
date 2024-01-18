import 'package:chatify/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

class CustomLoadingIndicator extends StatelessWidget {
  const CustomLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: SizedBox(
      height: 24,
      width: 32,
      child: LoadingIndicator(
        indicatorType: Indicator.lineScalePulseOut,
        colors: [AppColors.primary],
        strokeWidth: .5,
      ),
    ));
  }
}
