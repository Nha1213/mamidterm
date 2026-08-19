import 'package:flutter/material.dart';
import 'package:project_midterm/helper/form_login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _isExpanded = false;

  void init() async {
    await Future.delayed(Duration(seconds: 1));
    setState(() {
      _isExpanded = true;
    });
    await Future.delayed(Duration(seconds: 2));
    if (!mounted) return;
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => FormLogin()),
      (route) => false,
    );
  }

  @override
  void initState() {
    super.initState();
    init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            AnimatedScale(
              scale: _isExpanded ? 1.3 : 1.1,
              duration: Duration(milliseconds: 2000),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Image.asset(
                          "assets/images/logo.png",
                          width: 100,
                          // height: 100,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Text(
                          "Music",
                          style: TextStyle(fontSize: 25, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 100),
            Align(
              alignment: Alignment.bottomCenter,
              child: SafeArea(
                // child: CircularProgressIndicator(),
                // child: CupertinoActivityIndicator(),
                child: CircularProgressIndicator.adaptive(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
