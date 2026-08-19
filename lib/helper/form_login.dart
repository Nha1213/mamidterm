import 'package:flutter/material.dart';

class FormLogin extends StatefulWidget {
  const FormLogin({super.key});

  @override
  State<FormLogin> createState() => _FormLoginState();
}

class _FormLoginState extends State<FormLogin> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final FocusNode _emailNode = FocusNode();

  bool _obscureText = true;

  void togglePassword() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _emailNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,

          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/backgroundLogin.png"),
              fit: BoxFit.cover,
            ),
          ),

          child: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Logo
                  Center(
                    child: Image.asset("assets/images/logo.png", width: 100),
                  ),

                  const SizedBox(height: 10),

                  // App name
                  const Center(
                    child: Text(
                      "Music",
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                  ),

                  const SizedBox(height: 50),

                  // Login title
                  const Text(
                    "Login",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 30),

                  // Email label
                  const Text(
                    "Email",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),

                  const SizedBox(height: 8),

                  // Email field
                  TextField(
                    controller: _emailController,
                    focusNode: _emailNode,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: "Email",
                      prefixIcon: const Icon(Icons.email, color: Colors.grey),
                      filled: false,
                      fillColor: const Color.fromRGBO(254, 254, 254, 1),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none,
                      ),
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.clear),
                        color: Colors.grey,
                        onPressed: () {
                          _emailController.clear();
                        },
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Password label
                  const Text(
                    "Password",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),

                  const SizedBox(height: 8),

                  // Password field
                  TextField(
                    controller: _passwordController,
                    obscureText: _obscureText,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      hintText: "Password",
                      prefixIcon: const Icon(Icons.lock, color: Colors.grey),
                      filled: true,
                      fillColor: const Color.fromARGB(255, 224, 224, 224),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none,
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscureText
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Colors.grey,
                        ),
                        onPressed: togglePassword,
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),

                  // Login button
                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      onPressed: () {
                        print("Email: ${_emailController.text}");
                        print("Password: ${_passwordController.text}");
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: const Text(
                        "Login",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
