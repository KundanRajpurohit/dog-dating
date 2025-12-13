import 'package:dogdating/screens/signup_sceen.dart';
import 'package:dogdating/widgets/arrowButton.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/bg.png'),
                fit: BoxFit.fitHeight,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 180),
                Text(
                  'Let’s do \nsomething together',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 10),
                Text(
                  'Meet local dogs and dog lovers for \nfriendship, play-dates or fun outdoor playing.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff333333),
                  ),
                ),
                SizedBox(height: 30),
                ArrowButtonWithArc(
                  onTap: () {
                    print("Next tapped!");
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return SignUpPage();
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Image.asset('assets/Dog.png'),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Image.asset('assets/Element.png'),
          ),
        ],
      ),
    );
  }
}
