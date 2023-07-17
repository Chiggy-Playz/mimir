import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'login/phase_one.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkLogin().then(
      (value) {
        if (value) {
          Navigator.pushReplacementNamed(context, "/login_phase_one");
        } else {
          Navigator.pushReplacementNamed(context, "/login_phase_one");
        }
      },
    ).catchError((error) {
      print(error);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _buildSplashScreen());
  }

  Future<bool> _checkLogin() async {
    // For development purposes, wait 3 seconds
    await Future.delayed(const Duration(milliseconds: 1500));
    return false;
  }

  Widget _buildSplashScreen() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Hero(
            tag: "mimirHeading",
            child: Text(
              'MIMIR',
              style: Theme.of(context).textTheme.displayLarge,
            ),
          ),
        ],
      ),
    );
  }
}
