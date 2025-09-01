import 'package:logger/logger.dart';

var logger = Logger(
  level: Level.debug, // Levels : verbose, debug, info, warning, error, wtf
  printer: PrettyPrinter(
    methodCount: 0,
    errorMethodCount: 8,
    lineLength: 120,
    colors: true,
    printEmojis: true,
  ),
);
