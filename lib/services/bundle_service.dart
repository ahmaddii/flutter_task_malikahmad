import '../models/bundle_model.dart';
import '../models/regional_plan.dart';

class BundleService {
  List<BundleModel> getBundles() {
    return const [
      BundleModel(
        id: 'b1',
        dataAmount: '3 GB',
        validDays: 30,
        price: 2.99,
        type: BundleType.standard,
      ),
      BundleModel(
        id: 'b2',
        dataAmount: '5 GB',
        validDays: 7,
        price: 3.50,
        type: BundleType.standard,
      ),
      BundleModel(
        id: 'b3',
        dataAmount: '5 GB',
        validDays: 15,
        price: 3.99,
        type: BundleType.standard,
      ),
      BundleModel(
        id: 'b4',
        dataAmount: '5 GB',
        validDays: 30,
        price: 4.25,
        type: BundleType.standard,
      ),
      BundleModel(
        id: 'b5',
        dataAmount: '10 GB',
        validDays: 10,
        price: 5.50,
        type: BundleType.standard,
      ),
      BundleModel(
        id: 'b6',
        dataAmount: '10 GB',
        validDays: 15,
        price: 5.75,
        type: BundleType.standard,
      ),
      BundleModel(
        id: 'b7',
        dataAmount: '20 GB',
        validDays: 30,
        price: 7.48,
        type: BundleType.standard,
      ),
      BundleModel(
        id: 'b8',
        dataAmount: 'Unlimited',
        validDays: 10,
        price: 5.50,
        isUnlimited: true,
        type: BundleType.unlimited,
      ),
    ];
  }

  List<RegionalPlan> getRegionalPlans() {
    return const [
      RegionalPlan(
        name: 'EuroConnect',
        dataAmount: '1 GB',
        validDays: 7,
        price: 2.51,
        supportedCountries: 32,
      ),
      RegionalPlan(
        name: 'Global Unlimited',
        dataAmount: 'Unlimited',
        validDays: 1,
        price: 2.99,
        supportedCountries: 34,
      ),
      RegionalPlan(
        name: 'EuroLink',
        dataAmount: '1 GB',
        validDays: 7,
        price: 2.52,
        supportedCountries: 34,
      ),
      RegionalPlan(
        name: 'worldisyours',
        dataAmount: '1 GB',
        validDays: 1,
        price: 3.00,
        supportedCountries: 57,
      ),
    ];
  }
}