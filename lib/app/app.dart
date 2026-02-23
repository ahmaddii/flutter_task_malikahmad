import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import '../services/bundle_service.dart';
import '../ui/views/bundles/bundles_view.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: BundlesView, initial: true),
  ],
  dependencies: [
    LazySingleton(classType: BundleService),
    LazySingleton(classType: NavigationService),
  ],
)
class App {}
