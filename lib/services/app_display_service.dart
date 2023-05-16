import 'package:flutter/foundation.dart';

class AppDisplayService
{
  void showMessage({required dynamic data})
  {
    if (kDebugMode) {
      print(data);
    }
  }
}