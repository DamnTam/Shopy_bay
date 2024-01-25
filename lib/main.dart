import 'package:flutter/material.dart';
import 'app.dart';
import 'package:device_preview/device_preview.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
  DevicePreview(
    builder: (context) => ShopiBay(), // Wrap your app
  ),
);
}

// void main(){
//   WidgetsFlutterBinding.ensureInitialized();
//   runApp(ShopiBay());
// }