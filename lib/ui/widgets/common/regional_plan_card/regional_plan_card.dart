import 'package:flutter/material.dart';
import 'package:flutter_task_malikahmad/models/regional_plan.dart';
import 'package:flutter_task_malikahmad/ui/common/app_colors.dart';
import 'package:flutter_task_malikahmad/ui/common/app_dimension.dart';
import 'package:flutter_task_malikahmad/ui/common/app_text_styles.dart';

class RegionalPlanCard extends StatelessWidget {
  final RegionalPlan plan;

  const RegionalPlanCard({super.key, required this.plan});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppDimensions.paddingM),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(AppDimensions.cardRadius),
        border: Border.all(color: AppColors.borderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(plan.name, style: AppTextStyles.regionalName),
          const SizedBox(height: AppDimensions.paddingS),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Data:', style: AppTextStyles.label),
                    Text(plan.dataAmount, style: AppTextStyles.validityValue),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Valid for:', style: AppTextStyles.label),
                    Text(plan.validityFormatted,
                        style: AppTextStyles.validityValue),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: AppDimensions.paddingS),
          const Divider(color: AppColors.divider, height: 1),
          const SizedBox(height: AppDimensions.paddingS),
          Row(
            children: [
              const Icon(Icons.language,
                  size: 12, color: AppColors.textSecondary),
              const SizedBox(width: 4),
              Expanded(
                child: Text(
                  '${plan.supportedCountries} Supported Countries',
                  style: AppTextStyles.label,
                ),
              ),
              const Icon(Icons.chevron_right,
                  size: 14, color: AppColors.textSecondary),
            ],
          ),
          const SizedBox(height: AppDimensions.paddingS),
          Text(plan.priceFormatted, style: AppTextStyles.price),
        ],
      ),
    );
  }
}
