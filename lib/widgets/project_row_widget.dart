import 'dart:math';

import 'package:flutter/material.dart';

class ProjectRowWidget extends StatelessWidget {
  const ProjectRowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 20,
      children: [
        Container(
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(10),
          width: screenWidth * 0.15,
          height: screenHeight * 0.30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: sqrt1_2,
              ),
              Text(
                'Fast Shopping',
                style: TextStyle(
                    fontSize: screenWidth * 0.018, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Description lorem ipsum dolor sit amet consectetur adipisicing elit. Quisquam, quos?',
                style: TextStyle(fontSize: screenWidth * 0.012),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          width: screenWidth * 0.15,
          height: screenHeight * 0.30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.pink,
          ),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          width: screenWidth * 0.15,
          height: screenHeight * 0.30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.pink,
          ),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          width: screenWidth * 0.15,
          height: screenHeight * 0.30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.pink,
          ),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          width: screenWidth * 0.15,
          height: screenHeight * 0.30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.pink,
          ),
        ),
      ],
    );
  }
}
