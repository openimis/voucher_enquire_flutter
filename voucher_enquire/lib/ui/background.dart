import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;

  const Background({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(
          top: 42,
          left: 16,
          right: 16,
        ),
        color: Theme.of(context).colorScheme.background,
        child: child);
  }
}
