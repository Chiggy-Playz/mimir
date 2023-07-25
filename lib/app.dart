import 'package:flutter/material.dart';
import 'package:mimir/ui/pages/home.dart';
import 'package:mimir/ui/pages/login/phase_one.dart';
import 'package:mimir/ui/pages/login/phase_two.dart';
import 'package:mimir/ui/pages/splash.dart';
import 'package:mimir/ui/styles/theme.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

Widget getApp() {
  return ResponsiveSizer(
    builder: (context, orientation, screenType) {
      return const MimirApp();
    },
  );
}

class MimirApp extends StatelessWidget {
  const MimirApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mimir',
      theme: appThemeLight,
      darkTheme: appThemeDark,
      themeMode: ThemeMode.dark,
      initialRoute: "/splash",
      routes: {
        "/splash": (context) => const SplashScreen(),
        "/login_phase_one": (context) => const LoginPhaseOnePage(),
        "/login_phase_two": (context) => LoginPhaseTwoPage(serverAddress: ModalRoute.of(context)!.settings.arguments as String),
        "/home": (context) => const HomePage(),
      },
    );
  }
}
