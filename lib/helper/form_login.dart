import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:project_midterm/helper/form_register.dart';
import 'package:project_midterm/models/user_model.dart';
import 'package:project_midterm/screen/loading_animation.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  Future<void> saveCredential(UserModel user) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString("token", user.token ?? "");
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _emailNode.dispose();
    super.dispose();
  }

  void signIn() async {
    final email = "Vathana@gmail.com";
    final password = "123456";
    if (!mounted) return;
    if (_emailController.text == email &&
        _passwordController.text == password) {
      await saveCredential(
        UserModel(token: "123asdafdasfsafasfdsafsadgdsafafssfaasfas6"),
      );
      if (!mounted) return;
      showDialog(
        context: context,
        builder: (context) => Dialog(
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                // Keep your background image
                image: AssetImage("assets/images/backgroundLogin.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Login Successfully!"),
                  Lottie.asset(
                    "assets/lottie/success.json",
                    height: 100,
                    width: 100,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoadingAnimation(),
                        ),
                        (route) => false,
                      );
                    },
                    child: Text("Done"),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) => Dialog(
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                // Keep your background image
                image: AssetImage("assets/images/backgroundLogin.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Login Failed!"),
                  Lottie.asset(
                    "assets/lottie/error.json",
                    height: 100,
                    width: 100,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Try Again"),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }
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
          // background
          decoration: const BoxDecoration(
            image: DecorationImage(
              // Keep your background image
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
                    // Replace with your stylized white logo
                    child: Image.asset("assets/images/logo.png", width: 100),
                  ),

                  // App name
                  const Center(
                    child: Text(
                      "Music",
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
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
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ), // Adjusted size
                  ),

                  const SizedBox(height: 8),

                  // Email field (Semi-transparent style)
                  TextField(
                    controller: _emailController,
                    focusNode: _emailNode,
                    keyboardType: TextInputType.emailAddress,
                    autofocus: true,
                    style: const TextStyle(
                      color: Colors.white,
                    ), // Input text color
                    decoration: InputDecoration(
                      hintText: "Enter your email", // Specific hint text
                      hintStyle: const TextStyle(color: Colors.grey),
                      prefixIcon: const Icon(
                        Icons.email,
                        color: Colors.white70,
                      ), // White-ish prefix icon
                      filled: true,
                      fillColor: const Color(
                        0xFF424250,
                      ).withOpacity(0.5), // Semi-transparent grey
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(
                          color: Colors.white,
                        ), // Solid white border
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(
                          color: Colors.white54,
                        ), // Semi-transparent default border
                      ),
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.clear),
                        color: Colors.white70,
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
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ), // Adjusted size
                  ),

                  const SizedBox(height: 8),

                  // Password field (Semi-transparent style)
                  TextField(
                    controller: _passwordController,
                    obscureText: _obscureText,
                    keyboardType: TextInputType.visiblePassword,
                    style: const TextStyle(
                      color: Colors.white,
                    ), // Input text color
                    decoration: InputDecoration(
                      hintText: "Enter your password", // Specific hint text
                      hintStyle: const TextStyle(color: Colors.grey),
                      prefixIcon: const Icon(
                        Icons.lock,
                        color: Colors.white70,
                      ), // White-ish prefix icon
                      filled: true,
                      fillColor: const Color(
                        0xFF424250,
                      ).withOpacity(0.5), // Semi-transparent grey
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(
                          color: Colors.white,
                        ), // Solid white border
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(
                          color: Colors.white54,
                        ), // Semi-transparent default border
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscureText
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Colors.white70,
                        ),
                        onPressed: togglePassword,
                      ),
                    ),
                  ),

                  // Forget Password? link
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Forget Password?",
                        style: TextStyle(
                          color: Color(0xFFEF5350),
                          fontSize: 14,
                        ), // Red-ish color
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),

                  // Login button (Centered, purple)
                  Center(
                    child: SizedBox(
                      width: 200, // Fixed width
                      height: 50, // Fixed height
                      child: ElevatedButton(
                        onPressed: () {
                          signIn();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(
                            0xFF9162C0,
                          ), // Specific purple color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              25,
                            ), // More rounded
                          ),
                        ),
                        child: const Text(
                          "Login",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ), // Standard size, white text
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 40),

                  // Social Login Section
                  Row(
                    children: [
                      const Expanded(
                        child: Divider(
                          color: Colors.white30,
                          indent: 30,
                          endIndent: 10,
                        ),
                      ),
                      const Text(
                        "Or Login with",
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                      const Expanded(
                        child: Divider(
                          color: Colors.white30,
                          indent: 10,
                          endIndent: 30,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 25),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Apple icon button
                      _buildSocialButton(
                        "assets/icons/apple.png",
                      ), // Add paths
                      const SizedBox(width: 25),
                      // Google icon button
                      _buildSocialButton(
                        "assets/icons/google.png",
                      ), // Add paths
                      const SizedBox(width: 25),
                      // Facebook icon button
                      _buildSocialButton(
                        "assets/icons/fb.png",
                      ), // Add paths
                    ],
                  ),

                  const SizedBox(height: 40),

                  // Sign Up text
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Don't have an account? ",
                          style: TextStyle(color: Colors.grey, fontSize: 14),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const FormRegister(),
                              ),
                              (route) => false, // Removes all previous routes
                            );
                          },
                          child: const Text(
                            "Sign Up",
                            style: TextStyle(
                              color: Color(0xFFEF5350),
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ), // Red-ish
                          ),
                        ),
                      ],
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

  // Helper function to build social icon buttons
  Widget _buildSocialButton(String imagePath) {
    return Container(
      width: 50,
      height: 50,
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Image.asset(
          imagePath,
          width: 25,
          fit: BoxFit.contain,
        ), // Adjust width/fit
      ),
    );
  }
}
