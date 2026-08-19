import 'package:flutter/material.dart';
import 'package:project_midterm/helper/form_login.dart';

class FormRegister extends StatefulWidget {
  const FormRegister({super.key});

  @override
  State<FormRegister> createState() => _FormRegisterState();
}

class _FormRegisterState extends State<FormRegister> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final FocusNode _emailNode = FocusNode();
  final FocusNode _passwordNode = FocusNode();
  final FocusNode _confirmPasswordNode = FocusNode();
  final FocusNode _nameNode = FocusNode();

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

                  // const SizedBox(height: 10),

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

                  const SizedBox(height: 30),

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

                  // name label
                  const Text(
                    "name",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ), // Adjusted size
                  ),

                  const SizedBox(height: 8),

                  // Email field (Semi-transparent style)
                  TextField(
                    controller: _nameController,
                    focusNode: _nameNode,
                    keyboardType: TextInputType.text,
                    autofocus: true,
                    style: const TextStyle(
                      color: Colors.white,
                    ), // Input text color
                    decoration: InputDecoration(
                      hintText: "Enter your name", // Specific hint text
                      hintStyle: const TextStyle(color: Colors.grey),
                      prefixIcon: const Icon(
                        Icons.person,
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

                  const SizedBox(height: 8),

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

                  const SizedBox(height: 8),

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
                    focusNode: _passwordNode,
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

                  const SizedBox(height: 8),

                  // confirm password label
                  const Text(
                    "Confirm Password",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ), // Adjusted size
                  ),

                  const SizedBox(height: 8),

                  // Password field (Semi-transparent style)
                  TextField(
                    controller: _confirmPasswordController,
                    obscureText: _obscureText,
                    focusNode: _confirmPasswordNode,
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
                          print("Email: ${_emailController.text}");
                          print("Password: ${_passwordController.text}");
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
                          "Sign Up",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ), // Standard size, white text
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 40),

                  // Sign Up text
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Do have an account? ",
                          style: TextStyle(color: Colors.grey, fontSize: 14),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const FormLogin(),
                              ),
                              (route) => false, // Removes all previous routes
                            );
                          },
                          child: const Text(
                            "Login",
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
}
