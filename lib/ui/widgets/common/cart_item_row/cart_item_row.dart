import 'package:flutter/material.dart';
import 'package:flutter_task_malikahmad/models/cart_item.dart';
import 'package:flutter_task_malikahmad/ui/common/app_colors.dart';
import 'package:flutter_task_malikahmad/ui/common/app_dimension.dart';
import 'package:flutter_task_malikahmad/ui/common/app_text_styles.dart';
import '../quantity_control/quantity_control.dart';

class CartItemRow extends StatelessWidget {
  final CartItem item;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;
  final VoidCallback onRemove;

  const CartItemRow({
    super.key,
    required this.item,
    required this.onIncrement,
    required this.onDecrement,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.paddingL,
        vertical: AppDimensions.paddingS,
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item.totalPriceFormatted, style: AppTextStyles.cartPrice),
                Text(item.subtitle, style: AppTextStyles.cartSub),
              ],
            ),
          ),
          QuantityControl(
            quantity: item.quantity,
            onIncrement: onIncrement,
            onDecrement: onDecrement,
          ),
          const SizedBox(width: AppDimensions.paddingS),
          GestureDetector(
            onTap: onRemove,
            child: const Icon(
              Icons.close,
              size: 18,
              color: AppColors.removeRed,
            ),
          ),
        ],
      ),
    );
  }
}
