import 'package:chatapp/constants/image_strings.dart';
import 'package:chatapp/screens/home_screen.dart';
import 'package:chatapp/screens/on_boarding_screen2.dart';
import 'package:chatapp/screens/signup_screen.dart';
import 'package:chatapp/services/firebaseAuth/signin_func.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();

}


class _LoginScreenState extends State<LoginScreen> {
  bool passToggle = false;
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _auth = FirebaseAuth.instance;
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: -20,
            left: 0,
            child: Image.asset(decoration2),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(logoWhite),
                const Text(
                  'Deliver Favourite Food',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 21,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 20,
                ),
                Material(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Container(
                    // height: 398,
                    width: 300,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        )),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Login",
                              style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                             TextField(
                              controller: _emailController,
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.person),
                                border: OutlineInputBorder(),
                                labelText: 'Email',
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextField(
                              controller: _passwordController,
                              obscureText: !passToggle,
                              decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.lock),
                                border: const OutlineInputBorder(),
                                labelText: 'Password',
                                suffix: InkWell(
                                  onTap: () {
                                    setState(() {
                                      passToggle = !passToggle;
                                    });
                                  },
                                  child: Icon(
                                    passToggle
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    semanticLabel: passToggle
                                        ? 'Hide password'
                                        : 'Show password',
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 1,
                            ),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  TextButton(
                                    onPressed: () {},
                                    child: const Text(
                                      "Forgot Password?",
                                      style: TextStyle(
                                        color: Color(0xffEC2578),
                                      ),
                                    ),
                                  ),
                                ]),
                            const SizedBox(
                              height: 20,
                            ),
                            InkWell(
                              onTap: () {
                                signIn(context, _emailController.text, _passwordController.text);
                              },
                              child: Container(
                                height: 50,
                                width: double.infinity,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10)
                                  ),
                                  color: Color(0xffEC2578),
                                ),
                                child: const Center(
                                  child: Text("LOGIN",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500)),
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            const Center(
                              child: Text(
                                "Or",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Color(0xffEC2578),
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () {},
                                  child: SizedBox(
                                    width: 60,
                                    height: 30,
                                    child: Image.asset(googleIcon),
                                  ),
                                ),
                                const SizedBox(width: 20),
                                InkWell(
                                  onTap: () {},
                                  child: SizedBox(
                                    width: 60,
                                    height: 30,
                                    child: Image.asset(facebookIcon),
                                  ),
                                ),
                              ],
                            ),
                          ]),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  "Don't have an account?",
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
                const SizedBox(height: 10),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignupScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    "REGISTER",
                    style: TextStyle(fontSize: 16, color: Color(0xffEC2578)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
