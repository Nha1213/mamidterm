import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:project_midterm/provider/app_provider.dart';
import 'package:project_midterm/screen/splash_screen.dart';
import 'package:provider/provider.dart';

// device_frame already provides the iPhone 16 Pro Max definition.
final customIPhone16ProMax = Devices.ios.iPhone16ProMax;

void main() {
  runApp(
    DevicePreview(
      enabled: true,
      defaultDevice: customIPhone16ProMax, // Forces iPhone 16 Pro Max preview
      devices: [
        customIPhone16ProMax,
        ...Devices.ios.all, // Keeps other iOS devices accessible
      ],
      builder: (context) {
        return MultiProvider(
          providers: providers,
          child: const MyApp(),
        );
      },
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      
      // DevicePreview integration properties
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,

      home: const SplashScreen(),

      theme: ThemeData(
        fontFamily: 'Poppins',
        primaryColor: const Color.fromARGB(255, 65, 118, 136),
        scaffoldBackgroundColor: const Color.fromARGB(255, 30, 24, 34),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 33, 90, 176),
        ),
      ),
    );
  }
}