import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DogMapScreen extends StatefulWidget {
  const DogMapScreen({super.key});

  @override
  State<DogMapScreen> createState() => _DogMapScreenState();
}

class _DogMapScreenState extends State<DogMapScreen> {
  int? selectedDogIndex;

  final List<DogModel> dogs = [
    DogModel(
      name: "Dubby",
      image: "assets/Rectangle 22.png",
      distance: "1.2 km away from you",
      verified: true,
      position: const Offset(200, 280),
    ),
    DogModel(
      name: "Bruno",
      image: "assets/Rectangle 28.png",
      distance: "2.4 km away from you",
      verified: false,
      position: const Offset(80, 350),
    ),
    DogModel(
      name: "Max",
      image: "assets/Rectangle 29.png",
      distance: "3.1 km away from you",
      verified: true,
      position: const Offset(160, 450),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          /// 🔹 Google Map
          const GoogleMap(
            initialCameraPosition: CameraPosition(
              target: LatLng(28.6139, 77.2090),
              zoom: 14,
            ),
            myLocationEnabled: true,
            zoomControlsEnabled: false,
          ),

          /// 🔹 Top Controls
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(width: 40),

                  /// Filter Button (Center)
                  Container(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10,
                        )
                      ],
                    ),
                    child: Row(
                      children: const [
                        Icon(Icons.tune, size: 18),
                        SizedBox(width: 8),
                        Text(
                          "Filter",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 14),
                        ),
                      ],
                    ),
                  ),

                  /// 4-Dot Menu
                  const Icon(Icons.more_vert, size: 26),
                ],
              ),
            ),
          ),

          /// 🔹 Dog Avatars on Map
          ...List.generate(dogs.length, (index) {
            final dog = dogs[index];
            final isSelected = selectedDogIndex == index;
            return Positioned(
              left: dog.position.dx,
              top: dog.position.dy,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    selectedDogIndex = index;
                  });
                },
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: const Color(0xffE48325),
                    border: isSelected
                        ? Border.all(color: Colors.white, width: 3)
                        : null,
                  ),
                  child: ClipOval(
                    child: Image.asset(
                      dog.image,
                      width: 52,
                      height: 52,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            );
          }),

          /// 🔹 Bottom Info Card
          if (selectedDogIndex != null)
          /// 🔹 Bottom Info Card (POSITIONED JUST BELOW SELECTED DOG)
            if (selectedDogIndex != null)
              Positioned(
                left: 0,
                right: 0,
                top: dogs[selectedDogIndex!].position.dy + 72, // dog height + gap
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    final selectedDog = dogs[selectedDogIndex!];
                    final screenWidth = constraints.maxWidth;

                    final dogCenterX = selectedDog.position.dx + 30;
                    final arrowLeft =
                        dogCenterX.clamp(32.0, screenWidth - 32.0) - 16;

                    return Stack(
                      clipBehavior: Clip.none,
                      children: [
                        /// 🔺 Arrow pointing to dog
                        Positioned(
                          top: -8,
                          left: arrowLeft,
                          child: CustomPaint(
                            size: const Size(32, 16),
                            painter: TrianglePainter(pointsUp: true),
                          ),
                        ),

                        /// 🟨 Info Card
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 16),
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 10,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              /// Name + Verified + Distance
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          selectedDog.name,
                                          style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        const SizedBox(width: 6),
                                        if (selectedDog.verified)
                                          Container(
                                            padding: const EdgeInsets.all(4),
                                            decoration: const BoxDecoration(
                                              color: Colors.green,
                                              shape: BoxShape.circle,
                                            ),
                                            child: const Icon(
                                              Icons.check,
                                              size: 14,
                                              color: Colors.white,
                                            ),
                                          ),
                                      ],
                                    ),
                                    const SizedBox(height: 6),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.location_on,
                                          size: 16,
                                          color: Colors.grey,
                                        ),
                                        const SizedBox(width: 4),
                                        Text(
                                          selectedDog.distance,
                                          style: const TextStyle(
                                            fontSize: 14,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),

                              /// ❤️ Heart Icon
                              const Icon(
                                Icons.favorite_border,
                                size: 24,
                                color: Colors.grey,
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
              )

        ],
      ),
    );
  }
}


class DogModel {
  final String name;
  final String image;
  final String distance;
  final bool verified;
  final Offset position;

  DogModel({
    required this.name,
    required this.image,
    required this.distance,
    required this.verified,
    required this.position,
  });
}

/// Custom Painter for the triangle pointer
class TrianglePainter extends CustomPainter {
  final bool pointsUp;

  TrianglePainter({this.pointsUp = true});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    final path = Path();
    if (pointsUp) {
      // Pointing upward (default)
      path.moveTo(size.width / 2, 0);
      path.lineTo(0, size.height);
      path.lineTo(size.width, size.height);
    } else {
      // Pointing downward
      path.moveTo(size.width / 2, size.height);
      path.lineTo(0, 0);
      path.lineTo(size.width, 0);
    }
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(TrianglePainter oldDelegate) => oldDelegate.pointsUp != pointsUp;
}
