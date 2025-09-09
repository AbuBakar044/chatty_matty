
import 'utils/app_imports.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chatty Matty',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        textTheme: GoogleFonts.fredokaTextTheme(Theme.of(context).textTheme)
      ),
      // home: const SplashScreen(),
      initialRoute: RouteNames.kSplash,
      getPages: AppRoutes.pages,
    );
  }
}
