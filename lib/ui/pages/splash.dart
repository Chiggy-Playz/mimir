import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

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
          Navigator.popAndPushNamed(context, "/login");
        } else {
          Navigator.popAndPushNamed(context, "/login");
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
    await Future.delayed(const Duration(milliseconds: 300));
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
