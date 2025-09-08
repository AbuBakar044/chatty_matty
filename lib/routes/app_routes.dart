

import '../utils/app_imports.dart';

class AppRoutes {
  static List<GetPage> pages = [
    GetPage(name: RouteNames.kSplash, page: () => SplashScreen()),
    GetPage(name: RouteNames.kHome, page: () => HomeScreen()),

  ];
}
