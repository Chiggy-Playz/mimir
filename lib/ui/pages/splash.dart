import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mimir/providers/hive.dart';
import 'package:mimir/providers/http_service.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkLogin().then(
      (value) {
        if (value) {
          Navigator.pushReplacementNamed(context, "/home");
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

    // Check if user is logged in
    final credentials = await ref.read(hiveDbProvider.future).then(
          (value) => value.getCredentials(),
        );
    if (credentials == null) {
      return false;
    }

    // Attempt login
    final httpService = ref.read(httpClientProvider);
    httpService.setBase(credentials.serverAddress);
    final response = await httpService.login(apiKey: credentials.apiKey);
    if (response == null) {
      return false;
    }
    return true;
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
