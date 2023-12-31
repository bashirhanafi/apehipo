import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:ui_one/features/auth/presentation/pages/sign_in_page.dart';
import 'package:ui_one/features/auth/presentation/pages/sign_up_page.dart';
import 'package:ui_one/features/auth/presentation/pages/sign_up_page_petani.dart';

import '../components/buttons.dart';

class IntroPage extends StatefulWidget {
  static const String id = "intro_page";
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(
              width: 100,
              height: 150,
            ),
            const Center(
              child: Text(
                "Welcome",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              width: 100,
              height: 20,
            ),
            Column(
              children: const [
                // MyButton(
                //   iconUrl: 'assets/images/ic_google.png',
                //   text: "Sign up with Google",
                // ),
                // SizedBox(height: 20),
                // MyButton(
                //   iconUrl: 'assets/images/ic_facebook.png',
                //   text: "Sign up with Facebook",
                // ),
                // SizedBox(height: 20),
                // Text(
                //   "Or",
                //   style: TextStyle(
                //     color: Colors.grey,
                //   ),
                // ),
              ],
            ),
            const SizedBox(height: 20),
            Column(
              children: [
                const Image(
                  image: NetworkImage("https://doodleipsum.com/700/flat?i=4f0389a1195b4d8c17cc7284f2f3d0b5")
                ),
                MyButton(
                  onPressed: () {
                    Navigator.pushNamed(context, SignUpPagePetani.id);
                  },
                  text: "Sign up as Petani",
                ),
                const SizedBox(height: 20),
                MyButton(
                  onPressed: () {
                    Navigator.pushNamed(context, SignUpPage.id);
                  },
                  text: "Sign up as Consumer",
                ),
                const SizedBox(height: 20),
                const Text(
                  "By signing up you are agreed with our \nfriendly terms and condition.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF404653),
                    letterSpacing: 0.5,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 30),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, SignInPage.id);
                  },
                  child: const Text(
                    "Already have an account?",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF383838),
                      letterSpacing: 0.5,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      decoration: TextDecoration.underline,
                  ),
                ),
                ),

                const SizedBox(height: 27 ),
                // RichText(
                //   text: TextSpan(
                //     text: "Sign in",
                //     style: const TextStyle(
                //       color: Color(0xFF265AE8),
                //       fontSize: 18,
                //       fontWeight: FontWeight.w500,
                //     ),
                //     recognizer: TapGestureRecognizer()
                //       ..onTap = () {
                //         print("salom");
                //         Navigator.pushNamed(context, SignInPage.id);
                //       },
                //   ),
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
