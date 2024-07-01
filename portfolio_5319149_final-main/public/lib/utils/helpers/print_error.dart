import 'package:flutter/foundation.dart';

void printError(Exception e) {
  if (kDebugMode) {
    print(e);
  }
}
