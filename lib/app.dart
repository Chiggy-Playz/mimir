import 'package:flutter/material.dart';
import 'package:mimir/providers/login.dart';
import 'package:mimir/ui/pages/login/phase_one.dart';
import 'package:mimir/ui/pages/splash.dart';
import 'package:mimir/ui/styles/theme.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'models/appstate.dart';

Widget getApp() {
  return ChangeNotifierProvider.value(
    value: AppStateModel(),
    child: ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return const MimirApp();
      },
    ),
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
      // home: const SplashScreen(),
      initialRoute: "/splash",
      routes: {
        "/splash": (context) => const SplashScreen(),
        "/login": (context) => Provider.value(
              value: LoginProvider(),
              child: const LoginPhaseOnePage(),
            ),
      },
    );
  }
}
