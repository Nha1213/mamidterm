import 'package:flutter/material.dart';

class AccountService extends StatelessWidget {
  const AccountService({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Row(
              children: [
                Image.asset("assets/images/1.jpg", width: 100, height: 100,)
              ],
            ),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Text("Sign up"))
              ],
            )
          ],
        )
      ),
    );
  }
}