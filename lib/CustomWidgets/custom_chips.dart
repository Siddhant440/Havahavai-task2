import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task/utilities/custom_colors.dart';
import 'package:task/utilities/custom_texts.dart';

class CustomChip extends StatelessWidget {
  final String? text;
  final IconData? iconData;
  final String? imagePath;

  const CustomChip({
    super.key,
    this.text,
    this.iconData,
    this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
        decoration: BoxDecoration(
          color: CustomColors.border,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (iconData != null)
              Icon(iconData, color: CustomColors.color1, size: 20),
            if (imagePath != null)
              SvgPicture.asset(imagePath!, height: 20, width: 20),
            if ((iconData != null || imagePath != null) && text != null)
              const SizedBox(width: 10),
            if (text != null) Text(text!, style: CustomTextStyles.s14w500),
          ],
        ),
      ),
    );
  }
}
