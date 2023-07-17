import 'package:flutter/material.dart';
import 'package:mimir/ui/styles/theme.dart';
import 'package:mimir/ui/widgets/gradient_scaffold.dart';
import 'package:mimir/ui/widgets/loading_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LoginPhaseTwoPage extends StatefulWidget {
  const LoginPhaseTwoPage({super.key});

  @override
  State<LoginPhaseTwoPage> createState() => _LoginPhaseTwoPageState();
}

class _LoginPhaseTwoPageState extends State<LoginPhaseTwoPage> {
  String _username = "";
  String _password = "";
  bool _loading = false;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      gradient: LinearGradient(
        colors: getGradientColors(MediaQuery.of(context).platformBrightness),
        begin: Alignment.bottomLeft,
        end: Alignment.topRight,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 5.w,
          vertical: 10.h,
        ),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
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
                    "Username",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
                SizedBox(height: 1.h),
                TextFormField(
                  decoration: const InputDecoration(hintText: "username"),
                  readOnly: _loading,
                  validator: (value) => value!.isEmpty ? "Required" : null,
                  onChanged: (value) {
                    if (value.isNotEmpty) {
                      setState(() {
                        _username = value;
                      });
                    }
                  },
                ),
                SizedBox(height: 2.h),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Password",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
                SizedBox(height: 1.h),
                TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText: "password",
                  ),
                  readOnly: _loading,
                  validator: (value) => value!.isEmpty ? "Required" : null,
                  onChanged: (value) {
                    if (value.isNotEmpty) {
                      setState(() {
                        _password = value;
                      });
                    }
                  },
                ),
                SizedBox(height: 10.h),
                LoadingButton(onConnect: () async {})
              ],
            ),
          ),
        ),
      ),
    );
  }
}
