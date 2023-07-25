import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mimir/providers/hive.dart';
import 'package:mimir/providers/http_service.dart';
import 'package:mimir/services/context.dart';
import 'package:mimir/ui/styles/theme.dart';
import 'package:mimir/ui/widgets/gradient_scaffold.dart';
import 'package:mimir/ui/widgets/loading_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LoginPhaseTwoPage extends ConsumerStatefulWidget {
  const LoginPhaseTwoPage({super.key, required this.serverAddress});

  final String serverAddress;

  @override
  ConsumerState<LoginPhaseTwoPage> createState() => _LoginPhaseTwoPageState();
}

class _LoginPhaseTwoPageState extends ConsumerState<LoginPhaseTwoPage> {
  String _username = "";
  String _password = "";
  bool _loading = false;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      gradient: LinearGradient(
        // TODO: make gradient colors dynamic using prefs
        colors: getGradientColors(Brightness.dark),
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
                LoadingButton(onClick: _onLogin)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _onLogin() async {
    if (!_formKey.currentState!.validate()) {
      context.showErrorSnackBar(
          message: "Please enter a username and password.");
      return;
    }

    setState(() {
      _loading = true;
    });

    // Attempt login
    final response = await ref
        .read(httpClientProvider)
        .login(username: _username, password: _password);
    if (!mounted) return;

    if (response == null) {
      setState(() {
        _loading = false;
      });
      context.showErrorSnackBar(message: "Invalid username or password.");
      return;
    }

    setState(() {
      _loading = false;
    });

    await (await ref.read(hiveDbProvider.future))
        .saveCredentials(widget.serverAddress, response.user.token);
    if (!mounted) return;
    Navigator.of(context).pushNamedAndRemoveUntil("/home", (route) => false);
  }
}
