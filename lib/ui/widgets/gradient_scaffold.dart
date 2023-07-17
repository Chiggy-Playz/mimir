import 'package:flutter/material.dart';

class GradientScaffold extends StatelessWidget {
  const GradientScaffold(
      {required this.body,
      required this.gradient,
      super.key}); // and maybe other Scaffold properties

  final Widget body;
  final LinearGradient gradient;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: double.infinity,
          decoration: BoxDecoration(gradient: gradient),
          child: body),
    );
  }
}
