import 'package:flutter/material.dart';
import 'package:flutter_task_malikahmad/ui/common/app_colors.dart';
import 'package:flutter_task_malikahmad/ui/common/app_dimension.dart';

class QuantityControl extends StatelessWidget {
  final int quantity;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const QuantityControl({
    super.key,
    required this.quantity,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.paddingS,
        vertical: AppDimensions.paddingXS,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.borderColor),
        borderRadius: BorderRadius.circular(AppDimensions.chipRadius),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: onDecrement,
            child: const Icon(Icons.remove,
                size: 16, color: AppColors.textSecondary),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: AppDimensions.paddingS),
            child: Text(
              'x$quantity',
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
            ),
          ),
          GestureDetector(
            onTap: onIncrement,
            child:
                const Icon(Icons.add, size: 16, color: AppColors.textSecondary),
          ),
        ],
      ),
    );
  }
}
