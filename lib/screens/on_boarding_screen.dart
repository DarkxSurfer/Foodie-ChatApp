import 'package:chatapp/constants/image_strings.dart';
import 'package:chatapp/screens/home_screen.dart';
import 'package:chatapp/screens/on_boarding_screen2.dart';
import 'package:flutter/material.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      body: 
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(onboardingImage1),
              const SizedBox(height: 30),
              const Text(
                "Track your Comfort \nFood here",
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "Here You Can find a chef or dish for every \ntaste and color. Enjoy!",
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey.withOpacity(0.5),
                ),
              ),
              SizedBox(
                height: 70,
              ),
              InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context)=> OnBoardingScreen2()));
                },
                child: Container(
                  height: 50,
                  width: 158,
                  decoration: const BoxDecoration(
                      color: Color(0xffEC2578),
                      ),
                  child: const Center(
                    child: Text("NEXT",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w500)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
