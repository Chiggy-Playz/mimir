import 'package:flutter/material.dart';
import 'package:mimir/ui/styles/context.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../styles/theme.dart';
import '../../widgets/gradient_scaffold.dart';
import '../../widgets/loading_button.dart';

class LoginPhaseOnePage extends StatefulWidget {
  const LoginPhaseOnePage({super.key});

  @override
  State<LoginPhaseOnePage> createState() => _LoginPhaseOnePageState();
}

class _LoginPhaseOnePageState extends State<LoginPhaseOnePage> {
  String _serverAddress = "";
  bool _loading = false;
  final _formKey = GlobalKey<FormFieldState>();

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      gradient: LinearGradient(
        // TODO: make gradient colors dynamic using app prefs
        colors: getGradientColors(MediaQuery.of(context).platformBrightness),
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 5.w,
          vertical: 10.h,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Align(
                alignment: Alignment.center,
                child: Hero(
                  tag: "mimirHeading",
                  child: Text(
                    'MIMIR',
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Let's get started!",
                    style: Theme.of(context).textTheme.headlineLarge,
                  )),
              SizedBox(height: 1.h),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Connect to your AudiobookShelf server.",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
              SizedBox(height: 10.h),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Server Address",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
              SizedBox(height: 1.h),
              TextFormField(
                key: _formKey,
                decoration: const InputDecoration(hintText: "server address"),
                readOnly: _loading,
                validator: (value) => value!.isEmpty ? "Required" : null,
                onChanged: (value) {
                  if (value.isNotEmpty) {
                    setState(() {
                      _serverAddress = value;
                    });
                  }
                },
              ),
              SizedBox(height: 5.h),
              LoadingButton(onConnect: _onConnect)
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _onConnect() async {
    if (!_formKey.currentState!.validate()) {
      context.showErrorSnackBar(message: "Please enter a server address.");
      return;
    }

    setState(() {
      _loading = true;
    });
    // sleep 3 seconds
    await Future.delayed(const Duration(seconds: 1));

    setState(() {
      _loading = false;
    });
    if (!mounted) return;
    Navigator.pushNamed(context, "/login_phase_two");
  }
}
