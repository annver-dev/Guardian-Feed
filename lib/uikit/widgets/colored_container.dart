import 'package:flutter/material.dart';

class ColoredContainer extends StatelessWidget {
  const ColoredContainer({super.key, required this.progress});
  final double progress;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: progress,
      child: const ColoredBox(color: Colors.black54),
    );
  }
}
