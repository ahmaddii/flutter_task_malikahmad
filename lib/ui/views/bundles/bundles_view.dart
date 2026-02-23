import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'package:flutter_task_malikahmad/ui/common/app_colors.dart';
import 'package:flutter_task_malikahmad/ui/common/app_dimension.dart';
import 'package:flutter_task_malikahmad/ui/common/app_text_styles.dart';
import 'package:flutter_task_malikahmad/ui/widgets/common/bundle_card/bundle_card.dart';
import 'package:flutter_task_malikahmad/ui/widgets/common/bundle_filter_chips/bundle_filter_chips.dart';
import 'package:flutter_task_malikahmad/ui/widgets/common/cart_item_row/cart_item_row.dart';
import 'package:flutter_task_malikahmad/ui/widgets/common/regional_plan_card/regional_plan_card.dart';
import 'bundles_viewmodel.dart';

class BundlesView extends StackedView<BundlesViewModel> {
  const BundlesView({super.key});

  @override
  Widget builder(
      BuildContext context, BundlesViewModel viewModel, Widget? child) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          _AppBar(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _SearchBar(),
                  _CountryTag(),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(
                      AppDimensions.paddingL,
                      AppDimensions.paddingS,
                      AppDimensions.paddingL,
                      AppDimensions.paddingS,
                    ),
                    child: BundleFilterChips(
                      selected: viewModel.selectedFilter,
                      onChanged: viewModel.setFilter,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(
                      AppDimensions.paddingL,
                      AppDimensions.paddingXS,
                      AppDimensions.paddingL,
                      AppDimensions.paddingM,
                    ),
                    child: Text(
                      '${viewModel.filteredBundles.length} Bundles Available for Turkey',
                      style: AppTextStyles.sectionHeading,
                    ),
                  ),
                  _BundlesGrid(viewModel: viewModel),
                  const SizedBox(height: AppDimensions.paddingL),
                  _RegionalSection(viewModel: viewModel),
                  _SupportSection(),
                  const SizedBox(height: 120),
                ],
              ),
            ),
          ),
          if (viewModel.hasCartItems) _CartSection(viewModel: viewModel),
        ],
      ),
    );
  }

  @override
  BundlesViewModel viewModelBuilder(BuildContext context) => BundlesViewModel();
}

// ─── Private Sub-Widgets ────────────────────────────────────────────

class _AppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF26C6DA), Color(0xFF00ACC1)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimensions.paddingL,
            vertical: AppDimensions.paddingM,
          ),
          child: Row(
            children: [
              GestureDetector(
                onTap: () => Navigator.maybePop(context),
                child: const Icon(Icons.chevron_left,
                    color: Colors.white, size: 28),
              ),
              const Expanded(
                child: Center(
                  child: Text('Turkey', style: AppTextStyles.appBarTitle),
                ),
              ),
              const Icon(Icons.shopping_bag_outlined,
                  color: Colors.white, size: 24),
            ],
          ),
        ),
      ),
    );
  }
}

class _SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppDimensions.paddingL),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(AppDimensions.chipRadius),
          border: Border.all(color: AppColors.borderColor),
        ),
        child: const TextField(
          decoration: InputDecoration(
            hintText: 'Where do you need internet?',
            hintStyle: TextStyle(color: AppColors.textSecondary, fontSize: 13),
            prefixIcon:
                Icon(Icons.search, color: AppColors.textSecondary, size: 20),
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(vertical: 13),
          ),
        ),
      ),
    );
  }
}

class _CountryTag extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: AppDimensions.paddingL,
        bottom: AppDimensions.paddingS,
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppDimensions.paddingM,
          vertical: AppDimensions.paddingXS + 2,
        ),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.borderColor),
          borderRadius: BorderRadius.circular(AppDimensions.chipRadius),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Text('🇹🇷', style: TextStyle(fontSize: 15)),
            SizedBox(width: 6),
            Text('Turkey',
                style: TextStyle(fontSize: 13, color: AppColors.textPrimary)),
            SizedBox(width: 6),
            Icon(Icons.close, size: 13, color: AppColors.textSecondary),
          ],
        ),
      ),
    );
  }
}

class _BundlesGrid extends StatelessWidget {
  final BundlesViewModel viewModel;

  const _BundlesGrid({required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppDimensions.paddingL),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: AppDimensions.bundleGridSpacing,
          mainAxisSpacing: AppDimensions.bundleGridSpacing,
          childAspectRatio: AppDimensions.bundleGridRatio,
        ),
        itemCount: viewModel.filteredBundles.length,
        itemBuilder: (context, index) {
          final bundle = viewModel.filteredBundles[index];
          return BundleCard(
            bundle: bundle,
            isSelected: viewModel.isInCart(bundle.id),
            onTap: () => viewModel.addToCart(bundle),
          );
        },
      ),
    );
  }
}

class _RegionalSection extends StatelessWidget {
  final BundlesViewModel viewModel;

  const _RegionalSection({required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppDimensions.paddingL),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Regional & Global Plans Supporting Turkey',
            style: AppTextStyles.sectionHeading,
          ),
          const SizedBox(height: AppDimensions.paddingM),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: AppDimensions.regionalGridSpacing,
              mainAxisSpacing: AppDimensions.regionalGridSpacing,
              childAspectRatio: AppDimensions.regionalGridRatio,
            ),
            itemCount: viewModel.regionalPlans.length,
            itemBuilder: (context, index) {
              return RegionalPlanCard(plan: viewModel.regionalPlans[index]);
            },
          ),
        ],
      ),
    );
  }
}

class _SupportSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppDimensions.paddingL),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Need support?', style: AppTextStyles.supportTitle),
          const SizedBox(height: 4),
          Row(
            children: [
              const Text('If you need help, contact us on ',
                  style: AppTextStyles.supportText),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: AppColors.whatsapp.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.chat, size: 12, color: AppColors.whatsapp),
                    SizedBox(width: 4),
                    Text(
                      'Whatsapp',
                      style: TextStyle(
                        fontSize: 12,
                        color: AppColors.whatsapp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _CartSection extends StatelessWidget {
  final BundlesViewModel viewModel;

  const _CartSection({required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.background,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 12,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ...viewModel.cartItems.map(
            (item) => CartItemRow(
              item: item,
              onIncrement: () => viewModel.increment(item.bundle.id),
              onDecrement: () => viewModel.decrement(item.bundle.id),
              onRemove: () => viewModel.removeFromCart(item.bundle.id),
            ),
          ),
          const Divider(height: 1, color: AppColors.divider),
          Padding(
            padding: const EdgeInsets.all(AppDimensions.paddingM),
            child: GestureDetector(
              onTap: () {},
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 15),
                decoration: BoxDecoration(
                  color: AppColors.checkoutGreen,
                  borderRadius:
                      BorderRadius.circular(AppDimensions.buttonRadius),
                ),
                child: Center(
                  child: Text(
                    '${viewModel.cartTotalFormatted} - CHECKOUT',
                    style: AppTextStyles.checkoutButton,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
