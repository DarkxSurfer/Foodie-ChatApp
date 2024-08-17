import 'package:chatapp/constants/image_strings.dart';
import 'package:chatapp/screens/home_screen.dart';
import 'package:chatapp/screens/login_screen.dart';
import 'package:flutter/material.dart';

class OnBoardingScreen2 extends StatelessWidget {
  const OnBoardingScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      body: 
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 70),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(onboardingImage2),
              const SizedBox(height: 30),
              const Text(
                "Foodie is Where Your \nComfort Food Resides",
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "Enjoy a fast and smooth food delivery at \nyour doorstep",
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
                    MaterialPageRoute(builder: (context)=> LoginScreen()));
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
