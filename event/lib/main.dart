import 'package:event/screens/splash_screen.dart';
import 'package:event/utils/common_imports.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var isArabic = prefs.getBool('isArabic') ?? false;
  runApp(MyApp(isArabic));
}

class MyApp extends StatelessWidget {
  final bool isArabic;

  MyApp(this.isArabic);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: AppStrings(),
      debugShowCheckedModeBanner: false,
      locale: isArabic ? const Locale('ar', 'AE') : const Locale('en', 'US'),
      title: 'appName'.tr,
      theme: ThemeData(
        useMaterial3: false,
        primarySwatch: Colors.blue,
        appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: AppColors.white,
            statusBarIconBrightness: Brightness.dark,
          ),
          elevation: 0,
          backgroundColor: AppColors.white,
        ),
        scaffoldBackgroundColor: AppColors.white,
        // fontFamily: 'Gotham Rounded'
      ),
      // home: const BottomNavigationScreen(),
      home: const SplashScreen(),
    );
  }
}
