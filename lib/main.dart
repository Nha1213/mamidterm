import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
// import 'package:project_midterm/screen/home_screen.dart';
import 'package:project_midterm/screen/splash_screen.dart';
// import 'package:project_midterm/service/account_service.dart';
void main() {
  runApp(
    DevicePreview(
      builder: (context) {
        return MyApp();
      }

    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      
      home: SplashScreen(),

      theme: ThemeData(
        fontFamily: 'Poppins',
        primaryColor:  Color.fromARGB(255, 65, 118, 136),
        scaffoldBackgroundColor: const Color.fromARGB(255, 30, 24, 34),
        appBarTheme: AppBarThemeData(backgroundColor:  Color.fromARGB(255, 33, 90, 176)),
        // useMaterial3: false,
      ),
    );
  }
}
