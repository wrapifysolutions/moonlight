import 'package:flutter/material.dart';

import 'package:moonlight/utils/constants/images.dart';
import 'package:moonlight/utils/device/responsive_sizes.dart';

class ProcessingGlobe extends StatelessWidget {
  const ProcessingGlobe({super.key});

  @override
  Widget build(BuildContext context) {
    final size = AppSizes.width(82);

    return Image.asset(
      AppImages.shinyGlobe,
      width: size,
      height: size,
      fit: BoxFit.contain,
    );
  }
}
