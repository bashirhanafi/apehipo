import 'package:flutter/material.dart';
import 'package:ui_one/features/auth/presentation/components/buttons.dart';
import 'package:ui_one/features/auth/presentation/validator/auth_validator.dart';
import 'package:ui_one/service._locator.dart';

class SignUpPagePetani extends StatefulWidget {
  static const String id = "sign_up_page_petani";

  const SignUpPagePetani({super.key});

  @override
  State<SignUpPagePetani> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPagePetani> {
  final GlobalKey<FormState> _signUpGlobalKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordRetryController = TextEditingController();
  bool passwordSee = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: _signUpGlobalKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 50),

                // Back Icon Button
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.chevron_left,
                    size: 40,
                  ),
                ),
                const SizedBox(height: 30),
                Row(
                  children: const [
                    SizedBox(width: 10),
                    Text(
                      "Sign Up as Petani",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 55),
                Column(
                  children: [
                    // Name Input -------------------------------------
                    TextFormField(
                      controller: nameController,
                      validator: AuthValidator.isNameValid,
                      decoration: const InputDecoration(
                        hintText: "Full name",
                      ),
                    ),
                    const SizedBox(height: 40),
                    TextFormField(
                      controller: nameController,
                      validator: AuthValidator.isNameValid,
                      decoration: const InputDecoration(
                        hintText: "Username",
                      ),
                    ),

                    // Email Input -------------------------------------
                    const SizedBox(height: 40),
                    TextFormField(
                      controller: emailController,
                      validator: AuthValidator.isEmailValid,
                      decoration: const InputDecoration(
                        hintText: "E-mail",
                      ),
                    ),

                    // Password Input -------------------------------------
                    const SizedBox(height: 40),
                    TextFormField(
                      controller: passwordController,
                      obscureText: passwordSee,
                      validator: AuthValidator.isPasswordValid,
                      decoration: InputDecoration(
                        hintText: "Password",
                        suffixIcon: GestureDetector(
                          onTap: () {
                            passwordSee = !passwordSee;
                            setState(() {});
                          },
                          child: Icon(
                            passwordSee
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                          ),
                        ),
                      ),
                    ),

                    // Retry Password Input -------------------------------------
                    const SizedBox(height: 40),
                    TextFormField(
                      controller: passwordRetryController,
                      obscureText: passwordSee,
                      validator: AuthValidator.isPasswordValid,
                      decoration: const InputDecoration(
                        hintText: "Confirm password",
                      ),
                    ),
                    const SizedBox(height: 80),
                    // Sign Up for Button ----------------------------------
                    MyButtonTwo(
                      text: "Sign Up",
                      onPressed: signUpButton,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // when the button is pressed
  void signUpButton() {
    if (_signUpGlobalKey.currentState!.validate()) {
      final message = authController.registration(
        nameController.text.trim(),
        emailController.text.trim(),
        passwordController.text.trim(),
      );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message["message"] as String),
          margin:
              EdgeInsets.only(bottom: MediaQuery.of(context).size.height * .9),
          behavior: SnackBarBehavior.floating,
          duration: const Duration(seconds: 5),
          shape: const StadiumBorder(),
          dismissDirection: DismissDirection.horizontal,
          showCloseIcon: true,
        ),
      );
    }
  }

  // textController exits when finished
  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    passwordRetryController.dispose();
    super.dispose();
  }
}
