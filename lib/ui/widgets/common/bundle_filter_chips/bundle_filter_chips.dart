import 'package:flutter/material.dart';
import 'package:flutter_task_malikahmad/ui/common/app_colors.dart';
import 'package:flutter_task_malikahmad/ui/common/app_dimension.dart';
import 'package:flutter_task_malikahmad/ui/common/app_text_styles.dart';
import 'package:flutter_task_malikahmad/ui/views/bundles/bundles_viewmodel.dart';

class BundleFilterChips extends StatelessWidget {
  final FilterType selected;
  final ValueChanged<FilterType> onChanged;

  const BundleFilterChips({
    super.key,
    required this.selected,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _Chip(
          label: 'All',
          isSelected: selected == FilterType.all,
          onTap: () => onChanged(FilterType.all),
        ),
        const SizedBox(width: AppDimensions.paddingS),
        _Chip(
          label: 'Standard',
          isSelected: selected == FilterType.standard,
          onTap: () => onChanged(FilterType.standard),
        ),
        const SizedBox(width: AppDimensions.paddingS),
        _Chip(
          label: 'Unlimited',
          isSelected: selected == FilterType.unlimited,
          onTap: () => onChanged(FilterType.unlimited),
        ),
      ],
    );
  }
}

class _Chip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _Chip({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(
          horizontal: AppDimensions.paddingL,
          vertical: AppDimensions.paddingS,
        ),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : AppColors.background,
          borderRadius: BorderRadius.circular(AppDimensions.chipRadius),
          border: Border.all(
            color: isSelected ? AppColors.primary : AppColors.borderColor,
          ),
        ),
        child: Text(
          label,
          style: AppTextStyles.chipLabel.copyWith(
            color: isSelected ? Colors.white : AppColors.textSecondary,
          ),
        ),
      ),
    );
  }
}
