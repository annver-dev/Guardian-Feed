import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:places_search/runner.dart';

// String highAndLow(String numbers) {
//   var num = numbers.split(' ').map(int.parse).toList();
//   return '${num.reduce(max)} ${num.reduce(min)}';
// }

// void main() => print(highAndLow("1 2 3 4 5"));

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  await run();
}
