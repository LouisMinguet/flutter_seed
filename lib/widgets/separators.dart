// lib/widgets/separators.dart

import 'package:flutter/material.dart';
import '../utils/constants.dart';

class Separator extends StatelessWidget {
  final double height;

  const Separator._(this.height, {super.key});

  Separator.xs({super.key}) : height = AppConstants.xsSpace;
  Separator.small({super.key}) : height = AppConstants.smallSpace;
  Separator.normal({super.key}) : height = AppConstants.normalSpace;
  Separator.large({super.key}) : height = AppConstants.largeSpace;
  Separator.xl({super.key}) : height = AppConstants.xlSpace;

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height);
  }
}
