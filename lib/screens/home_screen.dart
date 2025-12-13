// home_screen.dart
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFF6ED),
      extendBodyBehindAppBar: false,

      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xffffe6c8), Colors.white],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// First row (avatar + menu)
                  /// S
                  SizedBox(height: 50),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 22,

                        child: Image.asset("assets/user.png"),
                      ),
                      const Spacer(),
                      Image.asset("assets/Group 14.png"),
                    ],
                  ),

                  const SizedBox(height: 20),

                  Text(
                    "Location",
                    style: TextStyle(color: Colors.grey.shade700, fontSize: 14),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    "Delhi, India",
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 20),

                  Row(
                    children: [
                      Image.asset("assets/setting.png"),
                      const SizedBox(width: 16),

                      ...List.generate(3, (index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: CircleAvatar(
                            radius: 28,
                            backgroundColor: Colors.orange.shade200,
                            backgroundImage: AssetImage(
                              "assets/pet${index + 1}.png",
                            ),
                          ),
                        );
                      }),
                    ],
                  ),
                ],
              ),
            ),

            /// TOP HEADER CONTAINER
            const SizedBox(height: 10),

            // const SizedBox(height: 40),

            /// PET CARD
            Expanded(
              child: Stack(
                alignment: Alignment.center,
                clipBehavior: Clip.none,
                children: [
                  /// BACK SHADOW CARDS (Blue + Grey)
                  Positioned(
                    top: 40,
                    child: _backgroundCard(
                      Colors.blue.shade100,
                      260,
                      350,
                      -0.24,
                    ),
                  ),
                  Positioned(
                    top: 45,
                    child: _backgroundCard(
                      Colors.grey.shade200,
                      260,
                      350,
                      0.27,
                    ),
                  ),

                  /// MAIN CARD
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            width: 260,
                            height: 350,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              border: Border.all(
                                color: Colors.white,
                                width: 2.5,
                              ),
                              image: const DecorationImage(
                                image: AssetImage("assets/dog_main.jpg"),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Container(
                              height: 350,
                              width: 260,
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.transparent,
                                    Colors.transparent,
                                    Colors.orange.withOpacity(0.9),
                                  ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                ),
                              ),
                              child: Positioned(
                                bottom: 20,
                                left: 16,
                                right: 16,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: const [
                                    Text(
                                      "Dubby",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "Golden Retriever",
                                      style: TextStyle(
                                        color: Colors.white70,
                                        fontSize: 15,
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: -30,
                            left: 0,
                            right: 0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                _circleBtn(
                                  Icons.close,
                                  Colors.orange,
                                  Colors.white,
                                  true,
                                ),
                                const SizedBox(width: 20),
                                _circleBtn(
                                  Icons.favorite,
                                  Colors.white,
                                  Colors.orange,
                                  false,
                                ),
                                const SizedBox(width: 20),
                                _circleBtn(
                                  Icons.star_border,
                                  Colors.orange,
                                  Colors.white,
                                  true,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      // const SizedBox(height: 30),

                      /// ACTION BUTTONS
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Background tilted cards
  Widget _backgroundCard(Color color, double w, double h, double angle) {
    return Transform.rotate(
      angle: angle,
      child: Container(
        width: w,
        height: h,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(25),
        ),
      ),
    );
  }

  Widget actionBtn(IconData icon, Color bg, Color iconColor) {
    return Container(
      height: 55,
      width: 55,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: bg,
        border: Border.all(color: Colors.orange, width: 2),
      ),
      child: Icon(icon, color: iconColor, size: 30),
    );
  }

  Widget _circleBtn(IconData icon, Color bg, Color iconColor, bool isSideBtn) {
    return Container(
      height: isSideBtn ? 45 : 55,
      width: isSideBtn ? 45 : 55,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: bg,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
        border: Border.all(color: Colors.orange, width: 2),
      ),
      child: Icon(icon, color: iconColor, size: isSideBtn ? 24 : 30),
    );
  }
}
