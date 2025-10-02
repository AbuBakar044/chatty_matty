
import 'package:chatty_matty/views/chat/chat_screen.dart';

import '../utils/app_imports.dart';

class AppRoutes {
  static List<GetPage> pages = [
    GetPage(name: RouteNames.kSplash, page: () => SplashScreen()),
    GetPage(name: RouteNames.kHome, page: () => HomeScreen()),
    GetPage(name: RouteNames.kSliderOne, page: () => SliderOne()),
    GetPage(name: RouteNames.kSliderTwo, page: () => SliderTwo()),
    GetPage(name: RouteNames.kLogin, page: () => Login()),
    GetPage(name: RouteNames.kSignup, page: () => Signup()),
    GetPage(name: RouteNames.kChat, page: () => ChatScreen()),

  ];
}
