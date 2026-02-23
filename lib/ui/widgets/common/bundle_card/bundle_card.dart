import 'package:flutter/material.dart';
import 'package:flutter_task_malikahmad/models/bundle_model.dart';
import 'package:flutter_task_malikahmad/ui/common/app_colors.dart';
import 'package:flutter_task_malikahmad/ui/common/app_dimension.dart';
import 'package:flutter_task_malikahmad/ui/common/app_text_styles.dart';

class BundleCard extends StatelessWidget {
  final BundleModel bundle;
  final bool isSelected;
  final VoidCallback onTap;

  const BundleCard({
    super.key,
    required this.bundle,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(AppDimensions.paddingM),
        decoration: BoxDecoration(
          color: AppColors.background,
          borderRadius: BorderRadius.circular(AppDimensions.cardRadius),
          border: Border.all(
            color:
                isSelected ? AppColors.selectedBorder : AppColors.borderColor,
            width: isSelected
                ? AppDimensions.selectedBorderWidth
                : AppDimensions.borderWidth,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(bundle.dataAmount, style: AppTextStyles.bundleData),
            const SizedBox(height: 6),
            const Divider(color: AppColors.divider, height: 1),
            const SizedBox(height: 6),
            const Text('Valid for:', style: AppTextStyles.label),
            Text(bundle.validityFormatted, style: AppTextStyles.validityValue),
            const Spacer(),
            Text(bundle.priceFormatted, style: AppTextStyles.price),
          ],
        ),
      ),
    );
  }
}
