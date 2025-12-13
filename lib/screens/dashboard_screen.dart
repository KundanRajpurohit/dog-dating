// dashboard_screen.dart
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'home_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _index = 0;

  final screens = const [
    HomeScreen(),
    Placeholder(), // Chat tab
    Placeholder(), // Add tab (middle)
    Placeholder(), // Favorites tab
    Placeholder(), // Profile tab
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_index],
      bottomNavigationBar: buildBottomNavBar(),
    );
  }

  // Bottom Navigation EXACT like screenshot
  Widget buildBottomNavBar() {
    return SizedBox(
      height: 110, // extra height so floating button has space
      child: Stack(
        clipBehavior: Clip.none, // IMPORTANT FIX
        alignment: Alignment.topCenter,
        children: [
          /// White Rounded Nav Bar
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 85,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(45),
                  topRight: Radius.circular(45),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 20,
                    offset: const Offset(0, -4),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    navIcon(Icons.home_rounded, 0),
                    navIcon(Icons.chat_bubble_outline, 1),

                    const SizedBox(width: 60), // space for floating button

                    navIcon(Icons.favorite_border, 3),
                    navIcon(Icons.person_outline, 4),
                  ],
                ),
              ),
            ),
          ),

          /// Floating Center Button (WON'T BE CUT)
          Positioned(
            top: -1, // pops out properly!
            child: GestureDetector(
              onTap: () => setState(() => _index = 2),
              child: Transform.rotate(
                angle: math.pi / 4,
                child: Container(
                  height: 65,
                  width: 65,
                  decoration: BoxDecoration(
                    color: const Color(0xffE48325),
                    borderRadius: BorderRadius.circular(18.5),

                    boxShadow: [
                      BoxShadow(
                        color: Colors.orange.withOpacity(0.4),
                        blurRadius: 12,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  child: Transform.rotate(
                    angle: math.pi / 4,
                    child: const Icon(Icons.add, color: Colors.white, size: 36),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget navIcon(IconData icon, int index) {
    bool isSelected = _index == index;

    return GestureDetector(
      onTap: () => setState(() => _index = index),
      child: Icon(
        icon,
        size: 28,
        color: isSelected ? const Color(0xffE48325) : Colors.grey.shade400,
      ),
    );
  }
}
