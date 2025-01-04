import 'package:flutter/material.dart';

class ContainerProject extends StatelessWidget {
  final String imagePath;
  const ContainerProject({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Container(
      padding: const EdgeInsets.all(10),
      width: screenWidth * 0.15,
      height: screenHeight * 0.30,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        // color: Colors.pink,
      ),
      child: Image.asset(
        imagePath,
        fit: BoxFit.cover,
      ),
    );
  }
}
